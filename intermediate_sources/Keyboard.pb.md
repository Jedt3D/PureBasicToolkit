# Keyboard.pb - Intermediate Description

## Purpose
Demonstrates fast keyboard input using the Keyboard library with a fullscreen sprite display, moving sprites with arrow keys.

## Application Type
GUI (Fullscreen/Screen application)

## Compiler Flags
None (default GUI mode - uses OpenScreen)

## Structure
- Initializes keyboard and sprite subsystems
- Opens fullscreen 800x600 screen
- Loads a sprite image
- Game loop reads keyboard state and moves sprites

## Key Libraries/Functions
- InitKeyboard(), InitSprite(), ExamineKeyboard(), KeyboardPushed()
- OpenScreen(), FlipBuffers(), ClearScreen()
- LoadSprite(), DisplaySprite()
- #PB_Key_Left, #PB_Key_Right, #PB_Key_Up, #PB_Key_Down, #PB_Key_Escape
- MessageRequester(), RGB()

## Input/Output
- Input: Arrow keys for movement, ESC to quit
- Output: Fullscreen display with tiled sprites moving based on keyboard input

## Logic Flow
1. Initialize keyboard and sprite systems
2. Show info message about controls
3. Open 800x600 32-bit fullscreen screen
4. Load PureBasic.bmp as sprite
5. Game loop: flip buffers, clear screen
6. Examine keyboard, adjust x/y based on arrow keys
7. Display sprites in tiled pattern with offsets
8. Exit on ESC key

## Cross-Platform Notes
- Uses #PB_Compiler_Home for sprite data path
- Screen/sprite system works cross-platform

## Important Notes
- Uses OpenScreen for fullscreen rendering
- Double-buffered with FlipBuffers/ClearScreen
- Sprites tiled in a grid pattern with alternating offsets
