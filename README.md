# MuseScore-Realistic-Playback-Plugins

Plugins mainly targeted towards streamlining the realistic playback experience in MuseScore. No longer will you have to manually increase the tempo of a hundred rubato adjustments by 2 each, or increase the offset velocity of a bunch of notes all with different velocities by 5.

# Installation guide

These plugins require at least MuseScore 3.3; and they not guaranteed to work in MuseScore 4. MuseScore 4 is terrible for realistic playback anyway, since they reworked my precious offset velocity system :(

Install by simply downloading the code from here and copying the .qml file into the MuseScore plugins folder (`C:\Program Files\MuseScore [version]\plugins\` if on Windows).

# Plugin list

### BulkVelocityChange
- Change velocities of notes in bulk

### BulkDynamicsVelocityChange
- Change velocities of dynamics in bulk

### BulkTempoChange
- Change velocities of tempo text markings in bulk—their text has to be formatted like the default `[something] = [tempo value]` and their tempo should follow the text
- Note: doesn't seem to go below 5 bpm

### ElementCounter
- Just a cool niche thing to count how many elements you've selected, when you want to feel like you did something

# Bugs
- BulkVelocityChange and BulkDynamicsVelocityChange occasionally crash when plugin hotkey pressed

# Fixed bugs
- BulkTempoChange no longer corrupts your entire score due to string parsing oversights
- BulkTempoChange now automatically refreshes tempo from text

---

Thanks to [Articulation and Ornamentation Control](https://github.com/BernardGreenberg/MuseScorePlugins) for both a great QoL tool and a helpful code reference.
