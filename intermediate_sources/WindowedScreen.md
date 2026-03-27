# WindowedScreen.pb - Intermediate Description

## Purpose
Demonstrates combining a windowed screen (sprite surface) with regular GUI gadgets. Features mouse/keyboard input grabbing and releasing, sprite animation, and mouse-driven sprite movement within a windowed screen area.

## Application Type
GUI (windowed application with embedded sprite screen)

## Compiler Flags
None (standard GUI app)

## Structure
- InitSprite(), InitKeyboard(), InitMouse() initialization
- OpenWindow() with buttons and text gadget
- OpenWindowedScreen() creates sprite surface inside the window
- LoadSprite() loads sprite image
- Main game loop with:
  - WindowEvent() processing for GUI events
  - Keyboard/Mouse examination
  - Sprite rendering and animation
  - Input grab/release via ReleaseMouse()
- FlipBuffers() for double buffering

## Key Libraries/Functions
- InitSprite() / InitKeyboard() / InitMouse()
- OpenWindow() with gadgets (Button, Text)
- OpenWindowedScreen() - creates sprite surface in window
- LoadSprite() / DisplaySprite() / ClipSprite() / ClearScreen()
- FlipBuffers() - double buffering
- ExamineKeyboard() / KeyboardPushed() - keyboard input
- ExamineMouse() / MouseX() / MouseY() - mouse input
- ReleaseMouse() - grab/release mouse input
- MouseLocate() - set mouse position
- DesktopScaledX() - DPI-aware coordinate scaling
- WindowEvent() - non-blocking event processing
- ScreenWidth() / ScreenHeight() / SpriteWidth() / SpriteHeight()

## Input/Output
- Input: Mouse movement, keyboard arrows, F1 key, button clicks
- Output: Animated sprites on windowed screen, status text

## Logic Flow
1. Initialize sprite, keyboard, mouse systems
2. Open window with 3 buttons and status text
3. Open windowed screen inside window
4. Load sprite, set initial positions
5. Start with released mouse input
6. Main loop:
   a. Process all window events (button clicks, close)
   b. Examine keyboard
   c. If input grabbed: track mouse, handle arrow keys, F1 to release
   d. Clear screen, clip and display sprites at animated positions
   e. Flip buffers
7. Exit on close or Escape

## Cross-Platform Notes
Uses DesktopScaledX() for DPI-aware positioning

## Important Notes
- WindowEvent() (non-blocking) must be used instead of WaitWindowEvent() in game loops
- Mouse input starts released and can be grabbed via button click
