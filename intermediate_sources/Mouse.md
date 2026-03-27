# Mouse.pb - Intermediate Description

## Purpose
Demonstrates fullscreen mouse input: initializing mouse/sprite/keyboard subsystems, reading mouse position and buttons, using mouse wheel, and centering the mouse. A sprite follows the mouse cursor.

## Application Type
GUI (fullscreen sprite-based application)

## Compiler Flags
None required (GUI application)

## Structure
- Initializes Mouse, Sprite, and Keyboard subsystems
- Opens a fullscreen screen
- Loads a sprite image
- Main loop reads mouse position, wheel, buttons
- Displays sprite at mouse position
- Exits on left/right mouse button click

## Key Libraries/Functions
- InitMouse(), InitSprite(), InitKeyboard()
- OpenScreen()
- LoadSprite(), DisplaySprite(), SpriteWidth(), SpriteHeight()
- FlipBuffers(), ClearScreen()
- ExamineMouse(), MouseX(), MouseY(), MouseButton(), MouseWheel(), MouseLocate()
- ExamineKeyboard()
- #PB_MouseButton_Left, #PB_MouseButton_Right, #PB_MouseButton_Middle

## Input/Output
- Mouse/keyboard input
- Fullscreen visual output

## Logic Flow
1. Initialize mouse, sprite, keyboard subsystems
2. Show info message
3. Open fullscreen 1920x1080x32 screen
4. Load sprite image
5. Main loop: flip buffers, clear screen, examine mouse/keyboard
6. Get mouse X/Y, apply wheel offset
7. If middle button, center mouse
8. Display sprite at mouse position
9. Exit when left or right button pressed

## Cross-Platform Notes
- Fullscreen mode may behave differently across platforms
- Screen resolution should match display capabilities

## Important Notes
- Uses #PB_Compiler_Home to find example data files
- MouseLocate() repositions the mouse cursor
- MouseWheel() returns scroll wheel delta
