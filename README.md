# MuseScore Realistic Playback Plugins

Plugins mainly targeted towards streamlining the realistic playback experience in MuseScore. No longer will you have to manually increase the tempo of a hundred rubato adjustments by 2 each, or increase the offset velocity of a bunch of notes all with different velocities by 5.

# Installation guide

These plugins require at least MuseScore 3.3; but I have so little faith that they will work in MuseScore 4 that I didn't even bother to download it for testing. MuseScore 4 is terrible for realistic playback anyway, since they reworked my precious offset velocity system :(

Install by simply downloading the `.qml` files from here and copying them into the MuseScore plugins folder (`C:\Program Files\MuseScore [version]\plugins\` on Windows, `/i/d/k/` on Linux, `macs/are/overrated/` on Mac).

# Plugin list

### bulk-note-velocity-change
- Change velocities of notes in bulk

### bulk-dynamics-velocity-change
- Change velocities of dynamics in bulk

### bulk-tempo-change
- Change tempo of tempo text markings in bulk—their text has to be formatted like the default `[something] = [tempo value]` and their tempo should follow the text
- Note: doesn't seem to go below 5 bpm

### ElementCounter
- Just a cool niche thing to count how many elements you've selected, when you want to feel like you did something

# Bugs
- bulk-note-velocity-change and bulk-dynamics-velocity-change occasionally crash when plugin hotkey pressed; seems to be an OpenGL error?
- bulk-note-velocity-change can apply the velocity change multiple times if it lags; just double-check after running it

---

Thanks to [Articulation and Ornamentation Control](https://github.com/BernardGreenberg/MuseScorePlugins) for both a great QoL tool and a helpful code reference.
