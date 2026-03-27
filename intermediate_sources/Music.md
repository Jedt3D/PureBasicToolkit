# Music.pb - Intermediate Description

## Purpose
Demonstrates music module playback: loading tracker modules (MOD, XM, IT formats), playing them, and performing a volume fade-out.

## Application Type
GUI (uses MessageRequester for UI, no window event loop)

## Compiler Flags
None required (GUI application)

## Structure
- Initialize sound subsystem
- Open file requester for music module selection
- Load and play the music
- Show a dialog while playing
- Fade volume from 100 to 0
- Clean up

## Key Libraries/Functions
- InitSound()
- OpenFileRequester()
- LoadMusic(), PlayMusic(), MusicVolume()
- MessageRequester()
- Delay()

## Input/Output
- Input: user selects a music module file
- Output: audio playback with volume fade

## Logic Flow
1. Initialize sound system
2. Show file requester for MOD/XM/IT files
3. If file selected, load the music module
4. Play the music
5. Show a message requester (blocks while playing)
6. After user dismisses dialog, fade volume from 100 to 0 with delay
7. Handle errors

## Cross-Platform Notes
No platform-specific code

## Important Notes
- InitSound() is required before any sound/music functions
- For loop uses constant Step -1 (compile-time constant)
- MusicVolume(id, volume) sets volume 0-100
