# PopupMenu.pb - Intermediate Description

## Purpose
Demonstrates creating a right-click context (popup) menu for a gadget. Creates a popup menu with items and submenus, displays it on right-click over a ListIconGadget, and handles menu selections.

## Application Type
GUI (OpenWindow with popup menu)

## Compiler Flags
None required (GUI application)

## Structure
- Creates a popup menu with items, separator, submenu, and quit option
- Opens a window with a ListIconGadget
- Detects right-click events on the gadget
- Shows the popup menu on right-click
- Handles menu item selections

## Key Libraries/Functions
- CreatePopupMenu(), MenuItem(), MenuBar(), OpenSubMenu(), CloseSubMenu()
- DisplayPopupMenu()
- OpenWindow, ListIconGadget, AddGadgetItem
- WaitWindowEvent, EventGadget, EventType, EventMenu
- #PB_EventType_RightClick
- MessageRequester

## Input/Output
- No file I/O
- User interaction through right-click and menu selection

## Logic Flow
1. Create popup menu with Cut, Copy, Paste, Options submenu, Quit
2. Open window with a ListIconGadget containing items
3. Event loop: check for gadget right-click events
4. On right-click of gadget: display popup menu
5. On menu event: handle Cut, Copy, Paste, or Quit
6. On window close: exit

## Cross-Platform Notes
No platform-specific code

## Important Notes
- CreatePopupMenu() is created before the window
- DisplayPopupMenu() is called with the window ID
- #PB_EventType_RightClick detects right-click on a gadget
