# GadgetAdvanced.pb - Intermediate Description

## Purpose
Demonstrates advanced gadgets: TreeGadget, ListIconGadget, ImageGadget, ButtonImageGadget, ProgressBarGadget, and popup menus with images.

## Application Type
GUI

## Compiler Flags
None (default GUI mode)

## Structure
- Loads images for use in tree and list gadgets
- Creates a popup menu
- Opens window with ListIconGadget, TreeGadget, ProgressBar, ImageGadget, ButtonImageGadget
- Event loop handles tree/list selection, double-click, right-click popup menu

## Key Libraries/Functions
- LoadImage(), ImageID(), CreatePopupMenu(), MenuItem()
- OpenWindow(), ListIconGadget(), AddGadgetColumn(), TreeGadget()
- ProgressBarGadget(), ImageGadget(), ButtonImageGadget(), TextGadget()
- AddGadgetItem(), SetGadgetState(), SetGadgetText()
- DisplayPopupMenu(), EventType(), EventGadget()

## Input/Output
- Input: User clicks tree items, list items, button image; right-click for popup
- Output: Status text updates, message requesters on double-click

## Logic Flow
1. Load images (Drive.bmp, File.bmp, PureBasic.bmp, CdPlayer.ico on Windows)
2. Create popup menu
3. Open window, create ListIconGadget with 3 columns
4. Create TextGadget for status, ProgressBarGadget
5. Animate progress bar from 0 to 100
6. Create ImageGadget, ButtonImageGadget
7. Create TreeGadget, populate with hierarchical items using images
8. Populate ListIconGadget with 101 items
9. Event loop: handle button click, tree selection/double-click/right-click, list selection/double-click/right-click

## Cross-Platform Notes
- Windows uses .ico files; other platforms fall back to .bmp
- Uses #PB_Compiler_Home for data file paths
- CompilerIf for platform-specific image loading

## Important Notes
- ListIconGadget columns separated by Chr(10)
- TreeGadget supports hierarchical items with sublevel parameter
- EventType() = 1 for right-click, 2 for double-click
