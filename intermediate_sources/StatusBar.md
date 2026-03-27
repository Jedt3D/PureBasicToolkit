# StatusBar.pb - Intermediate Description

## Purpose
Demonstrates creating a status bar at the bottom of a window with multiple fields, each with different display styles (normal, borderless, right-aligned/raised).

## Application Type
GUI (windowed application with status bar)

## Compiler Flags
None (standard GUI app)

## Structure
- OpenWindow() creates main window
- CreateStatusBar() creates status bar attached to window
- AddStatusBarField() adds three fields with specified widths
- StatusBarText() sets text with style flags
- Event loop waits for close

## Key Libraries/Functions
- OpenWindow() - creates the application window
- CreateStatusBar() - creates a status bar
- AddStatusBarField() - adds a field with specified width
- StatusBarText() - sets field text with optional style flags
- WaitWindowEvent() - waits for window events
- #PB_StatusBar_BorderLess, #PB_StatusBar_Right, #PB_StatusBar_Raised - style constants

## Input/Output
- No input
- Output: Window with 3-field status bar

## Logic Flow
1. Open window with system menu and size gadget
2. Create status bar attached to window
3. Add three fields (100, 50, 100 pixels wide)
4. Set text for each field with different styles
5. Wait for close window event

## Cross-Platform Notes
No platform-specific code

## Important Notes
- Status bar fields can have different visual styles applied
