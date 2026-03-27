# WebBrowser.pb - Intermediate Description

## Purpose
Implements a minimal web browser using PureBasic's WebGadget. Features navigation buttons (Back, Next, Stop, Go), a URL bar, and a status bar. Supports keyboard shortcut (Enter) for navigation.

## Application Type
GUI (windowed application with WebGadget)

## Compiler Flags
None (standard GUI app)

## Structure
- ResizeWebWindow() procedure for dynamic layout adjustment
- OpenWindow() creates browser window with resize support
- StatusBar for status text
- Button gadgets for navigation (Back, Next, Stop, Go)
- StringGadget for URL input
- FrameGadget as separator
- WebGadget for web content display
- BindEvent for real-time resize handling
- Event loop handling gadget clicks and keyboard shortcuts

## Key Libraries/Functions
- OpenWindow() with #PB_Window_SizeGadget
- CreateStatusBar() / AddStatusBarField() / StatusBarText()
- ButtonGadget() - navigation buttons
- StringGadget() - URL input field
- FrameGadget() - visual separator
- WebGadget() - embedded web browser
- SetGadgetState() with #PB_Web_Back, #PB_Web_Forward, #PB_Web_Stop
- SetGadgetText() - navigates WebGadget to URL
- GetGadgetText() - reads URL from StringGadget
- ResizeGadget() - resizes gadgets on window resize
- BindEvent() - binds resize handler
- AddKeyboardShortcut() - adds Enter key shortcut

## Input/Output
- Input: User enters URLs and clicks navigation buttons
- Output: Web pages displayed in WebGadget

## Logic Flow
1. Open window with min/max/size gadgets
2. Create status bar with welcome message
3. Create navigation buttons (Back, Next, Stop, Go)
4. Create URL input field
5. Create separator frame
6. Create WebGadget with initial URL
7. Bind resize event for responsive layout
8. Add Enter keyboard shortcut
9. Event loop: handle button clicks (back/forward/stop/go), Enter key
10. Exit on window close

## Cross-Platform Notes
- Linux/macOS use WebKit engine for WebGadget
- Error message about missing Webkit only shown on non-Windows platforms

## Important Notes
- Uses BindEvent for real-time resize (smoother than handling in event loop)
