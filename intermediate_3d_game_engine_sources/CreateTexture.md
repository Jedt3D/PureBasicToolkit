# CreateTexture.pb - Intermediate Description

## Purpose
Demonstrates CreateTexture() which creates a runtime-generated texture using 2D drawing commands. Draws a brown frame with "PureBasic" text and applies it to a rotating cube.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures.

## Key Libraries/Functions
- Engine3D: InitEngine3D, RenderWorld, AmbientColor
- Texture: CreateTexture, TextureOutput
- Material: CreateMaterial
- Mesh: CreateCube
- Entity: CreateEntity, RotateEntity
- Camera: CreateCamera, MoveCamera, RotateCamera
- Drawing: StartDrawing, StopDrawing, Box, DrawingMode, DrawingFont, DrawText
- Font: LoadFont
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed
- Mouse: InitMouse, ExamineMouse, MouseDeltaX, MouseDeltaY
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers

## Input/Output
- No external texture files loaded
- Displays: A rotating cube with a programmatically generated texture showing "PureBasic" text

## Logic Flow
1. Load Arial Bold 32pt font
2. Initialize engine, sprite, keyboard, mouse
3. Open windowed screen, add archives for textures and models
4. Set white ambient color
5. Create 256x256 texture, draw on it:
   - Brown background box
   - Lighter brown inner box
   - "PureBasic" text in purple
6. Create material from texture, create cube (size 30)
7. Create entity with material
8. Create camera at (0, 0, 100)
9. Main loop:
    a. Process events, mouse, keyboard
    b. Rotate cube
    c. Move/rotate camera
    d. RenderWorld and FlipBuffers
10. Exit on Escape

## Important Notes
- CreateTexture(id, width, height) creates empty texture
- TextureOutput(id) returns drawing surface for StartDrawing
- #PB_2DDrawing_Transparent for text with transparent background
- Font must be loaded before engine init in this example
- No light created - uses full ambient illumination
