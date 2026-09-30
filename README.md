# LVis — UE5 Live Visuals Template

![LVis running a scene](Docs/Images/hero.gif)

An Unreal Engine 5 template for live visuals and immersive installations. Scenes respond to OSC, MIDI and audio sent from outside the engine, and the rendered output is shared to other apps (VJ software, projection mapping, OBS…) through **Syphon** on macOS.

- **OSC control:** audio bands, kicks/hits, MIDI values, scene and camera switching all come in over OSC.
- **Reactive actor base class:** make a child of `BP_ReactiveActorBase`, tick which inputs it should react to, and implement the events.
- **Scene manager:** each scene is a streamed sub‑level; switch between them over OSC or from the keyboard.
- **Syphon output (macOS):** the `SyphonLink` plugin publishes the camera view as a Syphon server at 720p, 1080p, 1440p or 4K. It keeps rendering even when the app window's own 3D view is turned off.
- **In‑app control panel:** `WBP_Config` has toggles for audio input, MIDI and Syphon, plus the server name and an FPS readout.

---

## Requirements

| | |
|---|---|
| Engine | **Unreal Engine 5.8** |
| OS | **macOS** for Syphon output. Everything else in the project is cross‑platform, but Syphon only exists on Mac. |
| Compiler | **Xcode** on macOS, or Visual Studio 2022 on Windows. The two bundled plugins ship as C++ source and get compiled the first time you open the project. |

Engine plugins the project enables: OSC, MIDIDevice, PCG, Water, Buoyancy, HDRIBackdrop, Modeling Tools, plus a few Experimental ones (WaterAdvanced, ProceduralVegetationEditor, ModelContextProtocol, Terminal, EditorToolset). All of them ship with the engine, so there is nothing extra to install.

---

## Getting started

1. **Clone**
   ```bash
   git clone https://github.com/Yoshie026/lvis-ue5-template.git
   cd lvis-ue5-template
   ```
2. **Open `lvis_ue5_template.uproject`.** When UE says the `LVisUI` and `SyphonLink` modules are missing or out of date, click **Yes** to rebuild them. This needs Xcode or Visual Studio.
   - If the rebuild fails, right‑click the `.uproject` → *Generate Xcode/Visual Studio project files*, build the `lvis_ue5_templateEditor` target from the IDE, and read the build log.
3. **Press Play.** The game starts in `Levels/Map_Persistent`, which streams in the scenes from `Levels/Sub_Levels`.

---

## How it works

```
 Audio analysis / MIDI / controller app
            │  OSC (UDP)
            ▼
   BP_Config  ──►  BP_LiveVisualsGI (GameInstance, holds the config)
            │
            ├──►  BP_ReactiveActorBase children   (OnBass / OnKick / OnMidiChanged …)
            └──►  BP_SceneManager                 (/scene, /camera/* → load sub-level, move camera)
                          │
                          └──►  SyphonServerComponent ──► Syphon ──► Resolume, MadMapper, OBS …
```

### Folder layout

| Path | What's there |
|---|---|
| `Content/Core/` | The framework: `BP_Config`, `BP_AudioConfig`, `BP_LiveVisualsGI`, `BP_LVisGameMode`, `BP_SceneManager`, `BP_ReactiveActorBase` |
| `Content/Core/Examples/` | `BP_Reactive_Example` with its materials. Start from this one. |
| `Content/Core/widget/` | `WBP_Config`, the runtime control panel |
| `Content/Levels/` | `Map_Persistent` (entry map) and `Sub_Levels/Scene_XX` (one level per scene) |
| `Content/Data/` | `DT_CAMERA` / `ST_CAMERA_POS`, the preset camera positions |
| `Plugins/SyphonLink/` | Syphon server component (C++, macOS) |
| `Plugins/LVisUI/` | C++ base class that styles `WBP_Config` |

### OSC addresses

The OSC server is created in `BP_Config`, listening on `0.0.0.0`. The port is set by the `OSCPort` variable in `BP_Config`, so change it there to match your sender.

| Address | Meaning |
|---|---|
| `/audio/bass` `/audio/mid` `/audio/high` | Band levels |
| `/audio/loudness` | Overall level |
| `/audio/ext/amp` `/audio/ext/freq` | External amplitude and frequency |
| `/audio/dt2/trk1/hit` … `/audio/dt2/trk5/hit` | Per‑track hit triggers |
| `/audio/dt2/trk6` … `/audio/dt2/trk8` | Per‑track values |
| `/hit` `/bang` | Generic triggers |
| `/tempo` | Tempo |
| `/midi` `/midi1` … `/midi8` | MIDI or controller values |
| `/scene` | Switch to a scene by index |
| `/camera/mode` `/camera/pos` | Camera mode and preset position |
| `/system` | System commands |

You can send these from the bundled [LVis Controller] or from any OSC tool: TouchDesigner, Max/MSP, Ableton + Max for Live, TouchOSC, or a small Python script using `python-osc`.

```python
from pythonosc.udp_client import SimpleUDPClient
c = SimpleUDPClient("127.0.0.1", 8000)  # use the OSCPort set in BP_Config
c.send_message("/audio/bass", 0.8)
c.send_message("/scene", 2)
```

### LVis Controller (no Max/MSP needed)

`Tools/LVisController` is a small Python terminal app that sends the OSC above for you:

| Input | OSC sent |
|---|---|
| Audio input (FFT analysis, ~60 Hz) | `/audio/bass` `/audio/mid` `/audio/high` `/audio/loudness`, floats 0–1 |
| Keys `1`–`9` | `/scene <1–9>` |
| `←` / `→` | `/camera/pos <1–N>`, wrapping around (N = `--cam-max`, default 8) |
| MIDI CC from any connected controller | `/midi<CC number> <0–1>` (remap with `--midi-map 16:0,17:1`) |

```bash
cd Tools/LVisController
python3 -m pip install -r requirements.txt
python3 lvis_controller.py --list      # show audio inputs and MIDI ports
python3 lvis_controller.py --audio-device 2 --port 8000
```

While it runs: `1`–`9` scene, `←` `→` camera position, `+` `-` audio gain, `q` quit. To analyse music playing on the same Mac, route it through a loopback device such as BlackHole and pick that as the input. All options are in [its README](Tools/LVisController/README.md).

### LVis Controller patch (Max/MSP)

`Tools/LVisController_Patch/Lvis_Controller_Patch.maxpat` is a Max version of the controller for multichannel live setups. Open it in Max with `trk_bang~.maxpat` and `trk_float~.maxpat` in the same folder. It sends to `127.0.0.1:8000` (edit the `udpsend` object to change this).

| Input | OSC sent |
|---|---|
| Inputs 1–2 (main mix) | `/audio/bass` `/audio/mid` `/audio/high` `/audio/loudness` |
| Inputs 3–12 (tracks 1–5, stereo pairs) | `/audio/dt2/trk1/hit` … `/audio/dt2/trk5/hit` |
| Inputs 13–18 (tracks 6–8, stereo pairs) | `/audio/dt2/trk6` … `/audio/dt2/trk8` |
| Input 43 (external source) | `/audio/ext/freq` `/amp` `/onset` `/note` `/pc` `/noisiness` |
| MIDI CC from `OXI E16 Port 1` (edit `ctlin` for another device) | `/midi1` … `/midi4` |
| Scene / camera controls | `/scene` `/camera/pos` |

---

## Making your own reactive actor

1. Right‑click `BP_ReactiveActorBase` → **Create Child Blueprint Class**.
2. In Class Defaults, tick the inputs it should respond to: `bReactToBass`, `bReactToMid`, `bReactToHigh`, `bReactToKick`, `bReactToBassHit`, `bReactToMidi`.
3. Implement the matching events, e.g. `OnBassReact`, `OnKickReact`, `OnHighReact`, `OnBassHitReact`, `OnMidiChanged`, and drive material parameters, transforms, Niagara and so on from them.
4. Drop the actor into a scene level.

`Content/Core/Examples/BP_Reactive_Example` is a small working example.

## Adding a scene

1. Create a new level in `Content/Levels/Sub_Levels/`, e.g. `Scene_08`.
2. Add it to `BP_SceneManager`'s scene list.
3. Place a camera actor in the level and add the tag **`SceneCam`** to it (Details → Actor → Tags). `BP_SceneManager` finds the scene's camera by this tag, and it is the camera the Syphon output and `/camera/pos` move. Without the tag, the scene has no camera to switch to.
4. If the scene needs camera positions, add them in `DT_CAMERA` (see below).
5. Switch to it with `/scene <index>` over OSC or with the keyboard shortcut in `BP_SceneManager`.

## Adding camera positions

Camera presets live in the data table `Content/Data/DT_CAMERA` (row struct `ST_CAMERA_POS`). There is one row per scene, and the row name is the scene's level name, e.g. `Scene_04`. Each row holds a list of transforms, one per camera position.

1. Open `DT_CAMERA`.
2. Select the scene's row, or add one with **+ Add** and name it after the level.
3. Add an element to the transform array and set its location and rotation. A quick way to get the values is to move the `SceneCam` camera where you want it in the level and copy its transform.
4. Save. `/camera/pos` (or `←`/`→` in LVis Controller) now steps through the positions in array order. Set the controller's `--cam-max` to the number of positions in the scene.

## Syphon output (macOS)

A `SyphonServerComponent` publishes the chosen camera as a Syphon server. You can switch it on and off from the **Syphon** toggle in the control panel.

| Property | |
|---|---|
| `ServerName` | Name other apps see (default `UE5 Output`) |
| `CameraActor` | Camera to publish (the player camera if empty) |
| `Resolution` | 720p / 1080p / 1440p / 4K |
| `bRenderAppWindow` | Also render into the app's own window. Leave it **off** in shows so the GPU only renders the Syphon output. |

When you add a camera for the Syphon output to a scene, tag the camera actor **`SceneCam`** (Details → Actor → Tags → `+` → `SceneCam`). The scene manager looks the camera up by this tag when the scene loads, so an untagged camera is not the one that gets published or moved.

To receive it, choose the server in Resolume, MadMapper, VDMX, Millumin, or in OBS with the Syphon Client source.

**Packaged‑build flag:** start the app with `-LVisNoAudio` to skip the CoreAudio output device. Use it for visuals‑only machines where the audio analysis arrives over OSC; it avoids crashes when macOS audio stalls.

---

## License

[MIT](LICENSE) © Kōsa Studio. The bundled Syphon framework (`Plugins/SyphonLink/Source/SyphonLink/ThirdParty/Syphon`) is © the Syphon Project contributors and keeps its own BSD‑style license.
