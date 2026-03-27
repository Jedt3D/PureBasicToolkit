# Sound.pb - Intermediate Description

## Purpose
Demonstrates loading and playing a WAV sound file using PureBasic's Sound library. User selects a .wav file via file requester, then it plays in a loop until the user clicks OK.

## Application Type
GUI (uses MessageRequester and OpenFileRequester)

## Compiler Flags
None (standard GUI app)

## Structure
- InitSound() initialization
- OpenFileRequester() for file selection
- LoadSound() / PlaySound() for audio playback
- Loop playback with MessageRequester as pause point

## Key Libraries/Functions
- InitSound() - initializes sound system
- OpenFileRequester() - file selection dialog
- LoadSound() - loads a sound from file
- PlaySound() - plays sound with loop flag
- MessageRequester() - displays messages and waits for user
- #PB_Sound_Loop - constant for looped playback

## Input/Output
- Input: User selects a .wav file via dialog
- Output: Sound plays in loop, MessageRequester shows status

## Logic Flow
1. Initialize sound system; exit on failure
2. Open file requester for .wav files
3. If file selected, load sound
4. If loaded, play in loop mode
5. Show message requester (blocks until user clicks)
6. End program

## Cross-Platform Notes
No platform-specific code

## Important Notes
- The program ends after the user dismisses the message requester
