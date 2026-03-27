# GadgetSplitter.pb - Intermediate Description

## Purpose
Demonstrates SplitterGadget usage with nested splitters containing ListIconGadget, ExplorerListGadget, TreeGadget, PanelGadget, and HyperLinkGadgets.

## Application Type
GUI

## Compiler Flags
None (default GUI mode)

## Structure
- Resize callback procedure for dynamic window sizing
- Multiple splitter gadgets arranged in a nested hierarchy
- Various gadgets embedded within splitter panes
- Event loop handles hyperlink clicks, splitter state changes

## Key Libraries/Functions
- OpenWindow(), SplitterGadget(), ListIconGadget(), ExplorerListGadget()
- TreeGadget(), PanelGadget(), HyperLinkGadget(), TextGadget()
- ResizeGadget(), WindowWidth(), WindowHeight()
- BindEvent(), #PB_Event_SizeWindow
- LoadFont(), SetGadgetFont(), SetGadgetState(), GetGadgetState()

## Input/Output
- Input: User resizes window, clicks hyperlinks, adjusts splitters
- Output: Splitter position displayed in text gadgets

## Logic Flow
1. Open resizable window
2. Create hyperlink gadgets and text gadgets for splitter position display
3. Create ListIconGadget, ExplorerListGadget, TreeGadget
4. Create PanelGadget with 5 tabs each containing a button
5. Create nested SplitterGadgets combining the above
6. Bind resize event to callback that adjusts master splitter
7. Event loop: handle hyperlink click to set splitter positions, display splitter states

## Cross-Platform Notes
- Uses GetHomeDirectory() for ExplorerListGadget
- Splitter gadgets work cross-platform

## Important Notes
- Demonstrates nested splitter pattern
- Uses BindEvent for real-time resize handling
- #PB_Splitter_Vertical and #PB_Splitter_Separator flags
