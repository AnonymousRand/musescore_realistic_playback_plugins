# MuseScore 3.3+ plugins

Plugins mainly targeted towards streamlining the realistic playback experience in MuseScore (imagine having to manually increase the tempo of thousands of rubato markings by 2 each, or trying to increase the offset velocity of a bunch of notes all with different velocities by 5).

Install by simply downloading the code from here and copying the .qml file into the MuseScore plugins folder (`C:\Program Files\MuseScore [version]\plugins` if on Windows).

### BulkVelocityChange
- Change velocities of notes in bulk.

### BulkDynamicsVelocityChange
- Change velocities of dynamics in bulk.

### BulkTempoChange
- Change velocities of tempo text markings in bulk—their text has to be formatted like the default `[something] = [tempo value]` and their tempo should follow the text.

### ElementCounter
- Just a cool niche thing to count how many elements you've selected, when you want to feel like you did something.

# Bugs
- BulkVelocityChange occasionally crashes when plugin hotkey pressed
- BulkTempoChange changes note head font and makes tempo element un-copyable (*update: corrupts your score*)

---

Thanks to [Articulation and Ornamentation Control](https://github.com/BernardGreenberg/MuseScorePlugins) for both a great QoL tool and a helpful code reference.
