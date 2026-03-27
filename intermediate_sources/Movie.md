# Movie.pb - Intermediate Description

## Purpose
Demonstrates movie/video playback: initializing the movie subsystem, opening a file requester to choose a video file, loading and playing the movie in a window sized to the video dimensions.

## Application Type
GUI (OpenWindow with movie playback)

## Compiler Flags
None required (GUI application)

## Structure
- Initialize movie subsystem
- Open file requester for video selection
- Load movie and get its dimensions
- Open a window sized to the movie
- Play movie in the window
- Wait for window close

## Key Libraries/Functions
- InitMovie()
- OpenFileRequester()
- LoadMovie(), PlayMovie()
- MovieWidth(), MovieHeight()
- OpenWindow, WindowID()
- WaitWindowEvent()
- MessageRequester

## Input/Output
- Input: user selects a video file via file requester
- Output: video playback in a window

## Logic Flow
1. Initialize movie subsystem
2. Show file requester for AVI/MPG/all files
3. If file selected, load the movie
4. Open window sized to movie dimensions
5. Play movie in the window
6. Wait for close window event
7. Handle errors with message requesters

## Cross-Platform Notes
- Supported movie formats may vary by platform
- macOS uses AVFoundation, Windows uses DirectShow

## Important Notes
- InitMovie() must be called before any movie functions
- PlayMovie takes a window ID to render into
- Window is sized to match MovieWidth/MovieHeight
