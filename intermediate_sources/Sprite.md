# Sprite.pb - Intermediate Description

## Purpose
Demonstrates PureBasic's Sprite library using full-screen mode. Loads a sprite from a BMP file, creates a copy, and animates them across the screen using ClipSprite and DisplaySprite in a game loop.

## Application Type
GUI (full-screen sprite/game application)

## Compiler Flags
None (standard GUI app - sprite system handles screen)

## Structure
- InitSprite() and InitKeyboard() initialization
- OpenScreen() for full-screen 800x600 32-bit display
- LoadSprite() loads a BMP image
- CopySprite() creates a duplicate
- Main game loop with FlipBuffers(), ClearScreen(), ClipSprite(), DisplaySprite()
- Keyboard exit via Escape key

## Key Libraries/Functions
- InitSprite() / InitKeyboard() - system initialization
- OpenScreen() - opens full-screen display
- LoadSprite() - loads sprite from file
- CopySprite() - duplicates a sprite
- FlipBuffers() - swaps front/back buffers
- ClearScreen() - clears back buffer
- ClipSprite() - sets sprite clipping region
- DisplaySprite() - draws sprite at coordinates
- ExamineKeyboard() / KeyboardPushed() - keyboard input

## Input/Output
- Input: Keyboard (Escape to quit)
- Output: Full-screen sprite animation

## Logic Flow
1. Initialize sprite and keyboard systems
2. Open 800x600 32-bit full screen
3. Load PureBasic logo sprite and make a copy
4. Enter main loop:
   a. Flip buffers
   b. Clear screen to black
   c. Clip sprite 0 based on x position
   d. Display sprites at various positions based on x
   e. Increment x
   f. Check for Escape key
5. Exit when Escape pressed

## Cross-Platform Notes
Uses #PB_Compiler_Home for data path (cross-platform)

## Important Notes
- CRITICAL: On arm64, modulo (%) results must be extracted to .l temp variables before passing to DisplaySprite()
- The x variable increments without bounds in the reference - this is fine for a demo
