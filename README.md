# LVis — UE5 Live Visuals Template

An Unreal Engine 5 template for audio‑reactive live visuals. Scenes react to audio analysis, MIDI and OSC sent from outside the engine, and the rendered output is shared to other apps (VJ software, projection mapping, OBS…) through **Syphon** on macOS.

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
| Git | [Git LFS](https://git-lfs.com) is recommended if you fork this and add large assets. |

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

You can send these from any OSC tool: TouchDesigner, Max/MSP, Ableton + Max for Live, TouchOSC, or a small Python script using `python-osc`.

```python
from pythonosc.udp_client import SimpleUDPClient
c = SimpleUDPClient("127.0.0.1", 8000)  # use the OSCPort set in BP_Config
c.send_message("/audio/bass", 0.8)
c.send_message("/scene", 2)
```

---

## Making your own reactive actor

1. Right‑click `BP_ReactiveActorBase` → **Create Child Blueprint Class**.
2. In Class Defaults, tick the inputs it should respond to: `bReactToBass`, `bReactToMid`, `bReactToHigh`, `bReactToKick`, `bReactToBassHit`, `bReactToMidi`.
3. Implement the matching events, e.g. `OnBassReact`, `OnKickReact`, `OnHighReact`, `OnBassHitReact`, `OnMidiChanged`, and drive material parameters, transforms, Niagara and so on from them.
4. Drop the actor into a scene level.

`Content/Core/Examples/BP_Reactive_Example` is a small working example.

## Adding a scene

1. Create a new level in `Content/Levels/Sub_Levels/`, e.g. `Scene_08`.
2. Add it to `BP_SceneManager`'s scene list and give it camera presets in `DT_CAMERA` if it needs them.
3. Switch to it with `/scene <index>` over OSC or with the keyboard shortcut in `BP_SceneManager`.

## Syphon output (macOS)

A `SyphonServerComponent` publishes the chosen camera as a Syphon server. You can switch it on and off from the **Syphon** toggle in the control panel.

| Property | |
|---|---|
| `ServerName` | Name other apps see (default `UE5 Output`) |
| `CameraActor` | Camera to publish (the player camera if empty) |
| `Resolution` | 720p / 1080p / 1440p / 4K |
| `bRenderAppWindow` | Also render into the app's own window. Leave it **off** in shows so the GPU only renders the Syphon output. |

To receive it, choose the server in Resolume, MadMapper, VDMX, Millumin, or in OBS with the Syphon Client source.

**Packaged‑build flag:** start the app with `-LVisNoAudio` to skip the CoreAudio output device. Use it for visuals‑only machines where the audio analysis arrives over OSC; it avoids crashes when macOS audio stalls.

---

## Assets not included

Several Fab/Marketplace packs used during development are left out of the repo (see `.gitignore`), because of their licenses and their size: `CommonHazel`, `Megaplant_Library`, `PN_*Foliage*`, `SoulCave`, `UltraDynamicSky`, `FluidFlux`, `RockEnv_Pack`, `EasyAtmos`, `HighPoly_Tree_Model`. The template does not depend on them. If you own them, add them through Fab as usual.

## License

[MIT](LICENSE) © Kōsa Studio. The bundled Syphon framework (`Plugins/SyphonLink/Source/SyphonLink/ThirdParty/Syphon`) is © the Syphon Project contributors and keeps its own BSD‑style license.
