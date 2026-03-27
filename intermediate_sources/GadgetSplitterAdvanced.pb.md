# GadgetSplitterAdvanced.pb - Intermediate Description

## Purpose
Advanced splitter demonstration with WebGadget, EditorGadget, ExplorerTreeGadget, and ScrollAreaGadget in nested splitters.

## Application Type
GUI

## Compiler Flags
None (default GUI mode)

## Structure
- Resize callback procedure for dynamic window sizing
- WebGadget for web content, EditorGadget for text editing
- ExplorerTreeGadget for directory browsing
- ScrollAreaGadget with a button inside
- Nested SplitterGadgets combining all above

## Key Libraries/Functions
- OpenWindow(), SplitterGadget(), WebGadget(), EditorGadget()
- ExplorerTreeGadget(), ScrollAreaGadget(), TextGadget(), ButtonGadget()
- CloseGadgetList(), BindEvent(), ResizeGadget()
- WindowWidth(), WindowHeight()

## Input/Output
- Input: User interacts with editor, explorer tree, web gadget, scroll area
- Output: Web page display, directory tree, editable text

## Logic Flow
1. Open resizable window
2. Create TextGadget with description
3. Create WebGadget, EditorGadget with lines, ExplorerTreeGadget
4. Create ScrollAreaGadget with button inside, close gadget list
5. Create nested splitter arrangement
6. Bind resize event
7. Event loop handles gadget events

## Cross-Platform Notes
- WebGadget availability varies by platform
- Uses GetHomeDirectory() for ExplorerTreeGadget

## Important Notes
- WebGadget does NOT take URL in constructor on some platforms (but reference uses it)
- Uses CloseGadgetList() after ScrollAreaGadget
- Demonstrates complex splitter nesting
