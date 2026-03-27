# Window.pb - Intermediate Description

## Purpose
Demonstrates basic window operations: opening a window, moving it, resizing it, and handling the event loop for window close.

## Application Type
GUI (windowed application)

## Compiler Flags
None (standard GUI app)

## Structure
- OpenWindow() creates main window with minimize/maximize/system menu
- MessageRequester prompts between operations
- ResizeWindow() for moving and resizing
- Standard event loop waiting for close

## Key Libraries/Functions
- OpenWindow() - creates window with specified flags
- ResizeWindow() - moves/resizes window (#PB_Ignore for unchanged dimensions)
- MessageRequester() - displays messages
- WaitWindowEvent() - waits for window events
- #PB_Event_CloseWindow - window close event constant
- #PB_Window_SystemMenu, #PB_Window_MinimizeGadget, #PB_Window_MaximizeGadget

## Input/Output
- Input: User clicks message requester OK buttons and window close
- Output: Window moves and resizes

## Logic Flow
1. Open window at 100,200 with size 195x260
2. Show "Click to move" message, then move window to 200,200
3. Show "Click to resize" message, then resize window to 320x200
4. Enter event loop
5. Exit when close button clicked
6. End program

## Cross-Platform Notes
No platform-specific code

## Important Notes
- #PB_Ignore is used to skip position or size parameters in ResizeWindow
