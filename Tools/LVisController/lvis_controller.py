#!/usr/bin/env python3
"""LVis Controller — a small OSC sender for people who don't use Max/MSP.

Analyses live audio input, reads MIDI controllers and the keyboard, and sends
everything to the UE5 project over OSC:

  /audio/bass  /audio/mid  /audio/high  /audio/loudness   float 0..1, every frame
  /scene <1..9>                                           keys 1-9
  /camera/pos <1..N>                                      left / right arrow
  /midi<N> <value>                                        MIDI CC N (0..1, or 0..127 with --midi-raw)

Run `python3 lvis_controller.py --help` for options.
"""

import argparse
import curses
import sys
import threading
import time

import numpy as np
from pythonosc.udp_client import SimpleUDPClient

try:
    import sounddevice as sd
except Exception:  # PortAudio missing etc. — audio becomes optional
    sd = None

try:
    import mido
except Exception:
    mido = None


BANDS = {
    "bass": (20.0, 250.0),
    "mid": (250.0, 4000.0),
    "high": (4000.0, 16000.0),
}


# --------------------------------------------------------------------------- audio

class AudioAnalyser:
    """Keeps the latest samples from the input device and turns them into 0..1 levels."""

    def __init__(self, device, fft_size, gain_db, floor_db):
        self.fft_size = fft_size
        self.gain_db = gain_db
        self.floor_db = floor_db
        self.buffer = np.zeros(fft_size, dtype=np.float32)
        self.lock = threading.Lock()
        self.levels = {"bass": 0.0, "mid": 0.0, "high": 0.0, "loudness": 0.0}

        info = sd.query_devices(device, "input")
        self.device_name = info["name"]
        self.samplerate = int(info["default_samplerate"])
        self.window = np.hanning(fft_size).astype(np.float32)
        self.freqs = np.fft.rfftfreq(fft_size, 1.0 / self.samplerate)
        self.stream = sd.InputStream(
            device=device,
            channels=min(2, info["max_input_channels"]),
            samplerate=self.samplerate,
            blocksize=256,
            callback=self._callback,
        )

    def _callback(self, indata, frames, time_info, status):
        mono = indata.mean(axis=1)
        with self.lock:
            n = len(mono)
            if n >= self.fft_size:
                self.buffer[:] = mono[-self.fft_size:]
            else:
                self.buffer = np.roll(self.buffer, -n)
                self.buffer[-n:] = mono

    def start(self):
        self.stream.start()

    def stop(self):
        self.stream.stop()
        self.stream.close()

    def _to_unit(self, linear):
        db = 20.0 * np.log10(linear + 1e-12) + self.gain_db
        return float(np.clip((db - self.floor_db) / -self.floor_db, 0.0, 1.0))

    def update(self, attack, release):
        with self.lock:
            x = self.buffer.copy()

        # Amplitude spectrum scaled so a full-scale sine peaks at ~1.0
        mag = np.abs(np.fft.rfft(x * self.window)) * 2.0 / self.window.sum()
        raw = {}
        for name, (lo, hi) in BANDS.items():
            band = mag[(self.freqs >= lo) & (self.freqs < hi)]
            raw[name] = self._to_unit(np.sqrt(np.sum(band ** 2) / 2.0))
        raw["loudness"] = self._to_unit(np.sqrt(np.mean(x ** 2)))

        for name, target in raw.items():
            current = self.levels[name]
            k = attack if target > current else release
            self.levels[name] = current + (target - current) * k
        return self.levels


# --------------------------------------------------------------------------- midi

class MidiInput:
    """Opens one or all MIDI inputs and forwards CC messages as /midi<N>."""

    def __init__(self, client, port_filter, raw, cc_map, on_event):
        self.client = client
        self.raw = raw
        self.cc_map = cc_map
        self.on_event = on_event
        self.ports = []

        names = mido.get_input_names()
        if port_filter is not None:
            if port_filter.isdigit():
                names = [names[int(port_filter)]] if int(port_filter) < len(names) else []
            else:
                names = [n for n in names if port_filter.lower() in n.lower()]
        for name in names:
            self.ports.append(mido.open_input(name, callback=self._callback))

    @property
    def names(self):
        return [p.name for p in self.ports]

    def _callback(self, msg):
        if msg.type != "control_change":
            return
        index = self.cc_map.get(msg.control, msg.control) if self.cc_map else msg.control
        if index is None:
            return
        address = f"/midi{index}"
        value = msg.value if self.raw else msg.value / 127.0
        self.client.send_message(address, value)
        self.on_event(f"{address} {value if self.raw else round(value, 3)}  (ch{msg.channel + 1} cc{msg.control})")

    def close(self):
        for p in self.ports:
            p.close()


# --------------------------------------------------------------------------- UI / main loop

def meter(value, width):
    filled = int(round(value * width))
    return "█" * filled + "·" * (width - filled)


def run(stdscr, args, client, audio, midi_names, state):
    curses.curs_set(0)
    stdscr.nodelay(True)
    stdscr.keypad(True)
    frame_time = 1.0 / args.rate

    def send(address, value):
        client.send_message(address, value)
        state["last"] = f"{address} {value}"

    while True:
        start = time.perf_counter()

        # --- keyboard
        while True:
            key = stdscr.getch()
            if key == -1:
                break
            if key in (ord("q"), ord("Q"), 27):
                return
            if ord("1") <= key <= ord("9"):
                state["scene"] = key - ord("0")
                send("/scene", state["scene"])
            elif key == curses.KEY_RIGHT:
                state["cam"] = state["cam"] % args.cam_max + 1
                send("/camera/pos", state["cam"])
            elif key == curses.KEY_LEFT:
                state["cam"] = (state["cam"] - 2) % args.cam_max + 1
                send("/camera/pos", state["cam"])
            elif key in (ord("+"), ord("=")) and audio:
                audio.gain_db += 1.0
            elif key in (ord("-"), ord("_")) and audio:
                audio.gain_db -= 1.0

        # --- audio
        levels = None
        if audio:
            levels = audio.update(args.attack, args.release)
            for name, value in levels.items():
                client.send_message(f"/audio/{name}", value)

        # --- draw
        stdscr.erase()
        h, w = stdscr.getmaxyx()
        bar = max(10, min(50, w - 24))
        lines = [
            f"LVis Controller  →  OSC {args.host}:{args.port}",
            "",
        ]
        if audio:
            lines.append(f"Audio in: {audio.device_name}  ({audio.samplerate} Hz)  gain {audio.gain_db:+.0f} dB")
            for name in ("bass", "mid", "high", "loudness"):
                lines.append(f"  {name:<9}{meter(levels[name], bar)} {levels[name]:.2f}")
        else:
            lines.append("Audio in: off")
        lines += [
            "",
            f"MIDI in:  {', '.join(midi_names) if midi_names else 'none'}",
            f"  last:   {state['midi']}",
            "",
            f"Scene:    {state['scene']}          Camera pos: {state['cam']} / {args.cam_max}",
            f"Last key: {state['last']}",
            "",
            "[1-9] scene   [←/→] camera   [+/-] audio gain   [q] quit",
        ]
        for i, line in enumerate(lines[: h - 1]):
            stdscr.addnstr(i, 0, line, w - 1)
        stdscr.refresh()

        time.sleep(max(0.0, frame_time - (time.perf_counter() - start)))


def parse_cc_map(text):
    """'16:0,17:1,18:x' → {16: 0, 17: 1, 18: None}. Unmapped CCs keep their own number."""
    result = {}
    for pair in text.split(","):
        cc, _, idx = pair.partition(":")
        result[int(cc)] = None if idx.strip().lower() == "x" else int(idx)
    return result


def list_devices():
    if sd:
        print("Audio input devices:")
        for i, d in enumerate(sd.query_devices()):
            if d["max_input_channels"] > 0:
                mark = "*" if i == sd.default.device[0] else " "
                print(f"  {mark}[{i}] {d['name']}")
    else:
        print("Audio: sounddevice not available")
    if mido:
        print("MIDI input ports:")
        for i, name in enumerate(mido.get_input_names()):
            print(f"   [{i}] {name}")
    else:
        print("MIDI: mido not available")


def main():
    p = argparse.ArgumentParser(description="Send audio analysis, scene/camera keys and MIDI to LVis over OSC.")
    p.add_argument("--host", default="127.0.0.1", help="OSC target host (default 127.0.0.1)")
    p.add_argument("--port", type=int, default=8000, help="OSC target port — match OSCPort in BP_Config (default 8000)")
    p.add_argument("--list", action="store_true", help="list audio and MIDI inputs and exit")
    p.add_argument("--audio-device", default=None, help="audio input index or name (default: system input)")
    p.add_argument("--no-audio", action="store_true", help="don't analyse audio")
    p.add_argument("--gain", type=float, default=0.0, help="input gain in dB (also +/- keys)")
    p.add_argument("--floor", type=float, default=-60.0, help="dB level that maps to 0 (default -60)")
    p.add_argument("--attack", type=float, default=0.6, help="smoothing when rising, 0..1 (default 0.6)")
    p.add_argument("--release", type=float, default=0.15, help="smoothing when falling, 0..1 (default 0.15)")
    p.add_argument("--fft", type=int, default=2048, help="FFT size (default 2048)")
    p.add_argument("--rate", type=float, default=60.0, help="audio send rate in Hz (default 60)")
    p.add_argument("--cam-max", type=int, default=8, help="number of camera positions; arrows wrap 1..N (default 8)")
    p.add_argument("--midi-port", default=None, help="MIDI input index or name substring (default: all inputs)")
    p.add_argument("--no-midi", action="store_true", help="don't open MIDI inputs")
    p.add_argument("--midi-raw", action="store_true", help="send MIDI values as 0..127 ints instead of 0..1 floats")
    p.add_argument("--midi-map", default=None,
                   help="remap CC numbers to /midi indices, e.g. '16:0,17:1,18:2' (x = ignore). Default /midi<CC>")
    args = p.parse_args()

    if args.list:
        list_devices()
        return

    client = SimpleUDPClient(args.host, args.port)
    state = {"scene": "-", "cam": 1, "last": "-", "midi": "-"}

    audio = None
    if not args.no_audio:
        if sd is None:
            print("sounddevice not available — running without audio (pip install sounddevice)", file=sys.stderr)
        else:
            device = args.audio_device
            if device is not None and device.isdigit():
                device = int(device)
            audio = AudioAnalyser(device, args.fft, args.gain, args.floor)
            audio.start()

    midi = None
    if not args.no_midi:
        if mido is None:
            print("mido not available — running without MIDI (pip install mido python-rtmidi)", file=sys.stderr)
        else:
            cc_map = parse_cc_map(args.midi_map) if args.midi_map else None
            midi = MidiInput(client, args.midi_port, args.midi_raw, cc_map,
                             lambda text: state.__setitem__("midi", text))

    try:
        curses.wrapper(run, args, client, audio, midi.names if midi else [], state)
    except KeyboardInterrupt:
        pass
    finally:
        if audio:
            audio.stop()
        if midi:
            midi.close()


if __name__ == "__main__":
    main()
