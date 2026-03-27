# SoundPlugin.pb - Intermediate Description

## Purpose
Demonstrates using the OGG sound decoder plugin alongside standard WAV support. User selects a .wav or .ogg file, which plays in a loop.

## Application Type
GUI (uses MessageRequester and OpenFileRequester)

## Compiler Flags
None (standard GUI app)

## Structure
- InitSound() initialization
- UseOGGSoundDecoder() to enable OGG format support
- OpenFileRequester() for file selection (WAV or OGG)
- LoadSound() / PlaySound() for audio playback

## Key Libraries/Functions
- InitSound() - initializes sound system
- UseOGGSoundDecoder() - enables OGG Vorbis format
- OpenFileRequester() - file selection dialog
- LoadSound() - loads sound from file
- PlaySound() - plays with loop flag
- MessageRequester() - status display

## Input/Output
- Input: User selects a .wav or .ogg file
- Output: Sound plays in loop, message requesters show status

## Logic Flow
1. Initialize sound system; exit on failure
2. Enable OGG sound decoder
3. Open file requester for .wav and .ogg files
4. If file selected, load and play in loop
5. Show message requester; end when dismissed

## Cross-Platform Notes
No platform-specific code

## Important Notes
- UseOGGSoundDecoder() must be called before loading OGG files
