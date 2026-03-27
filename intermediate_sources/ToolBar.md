# ToolBar.pb - Intermediate Description

## Purpose
Demonstrates creating a toolbar with image buttons, separators, tooltips, and a menu. Toolbar and menu share the same IDs so both trigger the same actions. Shows how to disable toolbar buttons.

## Application Type
GUI (windowed application with toolbar and menu)

## Compiler Flags
None (standard GUI app)

## Structure
- UsePNGImageDecoder() for PNG toolbar icons
- OpenWindow() creates main window
- CreateToolBar() with ToolBarImageButton() for 7 buttons
- ToolBarSeparator() for visual grouping
- ToolBarToolTip() for hover text
- CreateMenu() with matching menu items
- DisableToolBarButton() to disable a button
- Event loop handling #PB_Event_Menu for both toolbar and menu clicks

## Key Libraries/Functions
- UsePNGImageDecoder() - enables PNG image loading
- CreateToolBar() - creates toolbar attached to window
- ToolBarImageButton() - adds image button to toolbar
- ToolBarSeparator() - adds separator between button groups
- ToolBarToolTip() - sets tooltip for a toolbar button
- CreateMenu() / MenuTitle() / MenuItem() - creates menu
- DisableToolBarButton() - enables/disables toolbar buttons
- EventMenu() - returns ID of clicked toolbar button or menu item

## Input/Output
- Input: User clicks toolbar buttons or menu items
- Output: MessageRequester showing which button/item was clicked

## Logic Flow
1. Enable PNG decoder
2. Open window with system menu and size gadget
3. Create toolbar with 7 image buttons (New, Open, Save, Cut, Copy, Paste, Find)
4. Add separators and tooltips
5. Create menu with matching New/Open/Save items
6. Disable the Save button
7. Enter event loop
8. On menu/toolbar event: show message with item ID
9. Exit on window close

## Cross-Platform Notes
Uses #PB_Compiler_Home for cross-platform data paths

## Important Notes
- Toolbar buttons and menu items with same ID trigger same EventMenu() value
