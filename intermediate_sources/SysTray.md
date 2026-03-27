# SysTray.pb - Intermediate Description

## Purpose
Demonstrates creating system tray icons in PureBasic, handling tray icon events (double-click), changing icons, and setting tooltips.

## Application Type
GUI (windowed application with system tray icons)

## Compiler Flags
None (standard GUI app)

## Structure
- OpenWindow() creates main window
- Platform-specific icon loading (ICO on Windows, PNG on others)
- AddSysTrayIcon() creates two tray icons
- SysTrayIconToolTip() sets tooltips
- Event loop handles #PB_Event_SysTray events
- ChangeSysTrayIcon() updates icon on double-click

## Key Libraries/Functions
- OpenWindow() - creates window
- AddSysTrayIcon() - adds icon to system tray
- SysTrayIconToolTip() - sets tooltip text
- ChangeSysTrayIcon() - changes an existing tray icon
- LoadImage() - loads image for icon
- UsePNGImageDecoder() - enables PNG support (non-Windows)
- EventGadget() - identifies which tray icon was clicked
- #PB_Event_SysTray, #PB_EventType_LeftDoubleClick - event constants

## Input/Output
- Input: User double-clicks system tray icons
- Output: MessageRequester shows which icon was clicked, icon/tooltip changes

## Logic Flow
1. Open window
2. Load icon (ICO on Windows, PNG on others)
3. Add two system tray icons with tooltips
4. Enter event loop
5. On tray icon double-click: show message, change icon, update tooltip
6. Exit on window close

## Cross-Platform Notes
- Windows uses .ico format for tray icons
- Linux/macOS use PNG format (requires UsePNGImageDecoder)

## Important Notes
- Some Linux distributions may hide systray icons by default
