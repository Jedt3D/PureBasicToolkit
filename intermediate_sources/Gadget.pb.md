# Gadget.pb - Intermediate Description

## Purpose
Comprehensive gadget demonstration showing many common PureBasic gadgets: String, Button, Panel, ListView, CheckBox, Option, ComboBox, TrackBar, Frame, and Text gadgets.

## Application Type
GUI

## Compiler Flags
None (default GUI mode)

## Structure
- Single window with multiple gadgets organized in a FrameGadget and PanelGadget
- Two tabs: "MP3 PlayList" with a ListView and controls, "Options" with checkboxes, combo, options, and button
- Event loop handles user interactions with all gadgets

## Key Libraries/Functions
- OpenWindow(), FrameGadget(), StringGadget(), ButtonGadget(), ListViewGadget()
- PanelGadget(), AddGadgetItem(), CloseGadgetList()
- CheckBoxGadget(), ComboBoxGadget(), OptionGadget(), TrackBarGadget(), TextGadget()
- DisableGadget(), GadgetToolTip(), SetGadgetState(), GetGadgetState(), GetGadgetText()
- WaitWindowEvent(), EventGadget(), EventType(), MessageRequester()

## Input/Output
- Input: User interacts with various gadgets
- Output: Gadget state changes, message requesters

## Logic Flow
1. Open window with constants for dimensions
2. Create Frame, String, Play/Stop buttons
3. Create PanelGadget with two tabs
4. Tab 1: ListView with 31 items, Add/Remove/Select buttons, TrackBar
5. Tab 2: Checkboxes, ComboBox, OptionGadgets, Info button
6. Close gadget list, add Text and Quit button
7. Event loop: handle Play/Stop toggle, ListView events, Add/Remove items, Info button, etc.
8. Exit on close window or Quit button

## Cross-Platform Notes
- Standard gadgets work cross-platform
- Uses numbered gadget IDs

## Important Notes
- Demonstrates enable/disable patterns for gadgets
- Uses EventType() = 2 for double-click detection in ListView
- Uses GadgetToolTip() for hover tips
