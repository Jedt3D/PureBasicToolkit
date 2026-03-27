# Menu.pb - Intermediate Description

## Purpose
Demonstrates creating a window menu bar with titles, items, submenus, separators, disabled items, and checkable items. Handles menu events in an event loop.

## Application Type
GUI (OpenWindow with menu bar)

## Compiler Flags
None required (GUI application)

## Structure
- Opens a window
- Creates a menu with File, Edit, and Help menu titles
- File menu has items, a submenu with nested submenus, and disabled items
- Help menu has an About item and a checkable item
- Event loop processes menu selections

## Key Libraries/Functions
- OpenWindow, CreateMenu, MenuTitle, MenuItem, MenuBar (separator)
- OpenSubMenu, CloseSubMenu
- DisableMenuItem, GetMenuItemState, SetMenuItemState
- WaitWindowEvent, EventMenu
- MessageRequester

## Input/Output
- No file input
- User interaction through menus and message dialogs

## Logic Flow
1. Open a window
2. Create menu with File (Load, Save, Save As, Recents submenu, Quit), Edit (Cut, Copy, Paste), Help (About, Check/Uncheck)
3. Disable some menu items
4. Enter event loop
5. On menu event, display info or toggle check state
6. On close window, exit

## Cross-Platform Notes
No platform-specific code

## Important Notes
- MenuBar() creates a separator line in the menu
- OpenSubMenu/CloseSubMenu allow nested submenus
- DisableMenuItem grays out a menu item
- GetMenuItemState/SetMenuItemState handle checkable items
