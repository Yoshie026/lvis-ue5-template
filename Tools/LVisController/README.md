# LVis Controller

A small terminal app that sends OSC to the LVis UE5 project, for when you don't use Max/MSP, TouchDesigner, etc.

| Input | OSC sent |
|---|---|
| Audio input (FFT analysis, ~60 Hz) | `/audio/bass` `/audio/mid` `/audio/high` `/audio/loudness`, floats 0–1 |
| Keys `1`–`9` | `/scene <1–9>` |
| `←` / `→` | `/camera/pos <1–N>` (wraps around, N = `--cam-max`, default 8) |
| MIDI CC from any connected controller | `/midi<CC number> <0–1>` |

Bands: bass 20–250 Hz, mid 250–4000 Hz, high 4–16 kHz.

## Setup

```bash
cd Tools/LVisController
python3 -m pip install -r requirements.txt
```

## Run

```bash
python3 lvis_controller.py --list                  # show audio inputs and MIDI ports
python3 lvis_controller.py                         # system audio input, all MIDI inputs, 127.0.0.1:8000
python3 lvis_controller.py --audio-device 2 --midi-port nanoKONTROL --port 8000
```

Match `--port` to `OSCPort` in `BP_Config`. Use `--host` to send to another machine.

On macOS, the first run asks for microphone permission for your terminal app. To analyse music playing on the same Mac, route it through a loopback device such as BlackHole and pick that device as the input.

### Keys

`1`–`9` scene · `←` `→` camera position · `+` `-` audio gain · `q` quit

### Useful options

| Option | |
|---|---|
| `--gain 6` | Input gain in dB. You can also change it live with `+`/`-`. |
| `--floor -60` | dB level that reads as 0. Raise it (e.g. `-45`) to ignore background noise. |
| `--attack 0.6 --release 0.15` | Smoothing. Lower values give slower, smoother movement. |
| `--midi-map 16:0,17:1,18:x` | Send CC16 as `/midi0`, CC17 as `/midi1`, and ignore CC18. Other CCs keep their own number. |
| `--midi-raw` | Send MIDI values as 0–127 ints instead of 0–1 floats. |
| `--no-audio` / `--no-midi` | Turn off an input. |
