# WebView.pb - Intermediate Description

## Purpose
Demonstrates the WebViewGadget with JavaScript callback bindings. Creates a webview that loads an HTML page and binds PureBasic procedures to JavaScript function calls, enabling two-way communication between PureBasic and JavaScript.

## Application Type
GUI (windowed application with WebViewGadget)

## Compiler Flags
None (standard GUI app)

## Structure
- IncrementCallback() - callback maintaining a static counter, returns JSON
- ComputeCallback() - callback that parses JSON parameters, computes sum
- OpenWindow() with #PB_Window_Invisible initially
- WebViewGadget() created WITHOUT URL parameter
- SetGadgetText() used to navigate to HTML file
- BindWebViewCallback() to bind JS function names to PB procedures
- HideWindow() to show after load

## Key Libraries/Functions
- OpenWindow() with #PB_Window_Invisible
- WebViewGadget() - creates webview gadget (NO URL parameter!)
- SetGadgetText() - navigates webview to URL
- BindWebViewCallback() - binds JavaScript function to PureBasic procedure
- HideWindow() - shows/hides window
- ParseJSON() / ExtractJSONArray() / JSONValue() - JSON handling
- UTF8() - returns UTF-8 encoded buffer
- #PB_Compiler_Procedure - built-in constant for current procedure name

## Input/Output
- Input: JavaScript calls from loaded HTML page
- Output: Return values from PureBasic callbacks to JavaScript

## Logic Flow
1. Define IncrementCallback - static counter, returns JSON with count
2. Define ComputeCallback - parses 2 parameters from JSON array, returns sum
3. Open invisible window
4. Create WebViewGadget (no URL parameter!)
5. Navigate to HTML file using SetGadgetText()
6. Bind "increment" and "compute" JavaScript functions to PB callbacks
7. Show the window
8. Event loop until close

## Cross-Platform Notes
No platform-specific code

## Important Notes
- CRITICAL: WebViewGadget() does NOT take a URL parameter
- Use SetGadgetText(gadgetID, url$) to navigate
- Callbacks receive JSON string parameters and return UTF-8 encoded results
