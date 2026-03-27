# Requester.pb - Intermediate Description

## Purpose
Demonstrates PureBasic's various requester dialogs: OpenFileRequester, SaveFileRequester, PathRequester, ColorRequester, FontRequester, and MessageRequester. All accessed through a window menu.

## Application Type
GUI (OpenWindow with menu and requesters)

## Compiler Flags
None required (GUI application)

## Structure
- Opens a window with a menu bar
- Menu items trigger different types of requesters
- Each requester's result is displayed via MessageRequester
- Event loop handles menu selections

## Key Libraries/Functions
- OpenWindow, CreateMenu, MenuTitle, MenuItem, MenuBar
- OpenFileRequester(), SaveFileRequester(), PathRequester()
- ColorRequester(), FontRequester()
- SelectedFontName(), SelectedFontSize()
- Red(), Green(), Blue()
- MessageRequester()
- WaitWindowEvent, EventMenu

## Input/Output
- No file I/O
- User interaction through menus and dialog boxes
- Display results in message requesters

## Logic Flow
1. Open a window with a menu containing Test items
2. Menu items: Open, Save, Path, Color, Font, Message, Quit
3. On Open: show open file requester, display selected file
4. On Save: show save file requester, display selected file
5. On Path: show path requester, display selected path
6. On Color: show color requester, display RGB components
7. On Font: show font requester, display font name and size
8. On Message: show a multiline message
9. On Quit or close window: exit

## Cross-Platform Notes
- PathRequester default path format differs by platform
- Font availability varies by platform

## Important Notes
- OpenFileRequester filter format uses | as separator
- ColorRequester returns -1 if canceled
- FontRequester returns 0 if canceled
- SelectedFontName/SelectedFontSize used after FontRequester
