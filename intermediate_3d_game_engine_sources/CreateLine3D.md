# CreateLine3D.pb - Intermediate Description

## Purpose
Demonstrates CreateLine3D() which draws colored 3D lines in the scene. Shows 3 colored axis lines (X=red, Y=green, Z=blue) with a loaded axes mesh model.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures.

## Key Libraries/Functions
- Engine3D: InitEngine3D, RenderWorld
- Line3D: CreateLine3D
- Entity: CreateEntity, ScaleEntity
- Mesh: LoadMesh
- Material: CreateMaterial, LoadTexture
- Camera: CreateCamera, MoveCamera, CameraLookAt, RotateCamera
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed
- Mouse: InitMouse, ExamineMouse, MouseDeltaX, MouseDeltaY
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers

## Input/Output
- Loads: axes.mesh, axes.png
- Displays: 3D axis lines (RGB for XYZ) with an axes model for reference

## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen, add archives for textures and models
3. Load axes mesh and create entity, scale to 0.1
4. Create three Line3D objects:
   - Line 0: origin to (10,0,0) in red (X axis)
   - Line 1: origin to (0,10,0) in green (Y axis)
   - Line 2: origin to (0,0,10) in blue (Z axis)
5. Create camera at (5, 5, 5) looking at origin
6. Main loop:
    a. Process events, mouse, keyboard
    b. Rotate/move camera
    c. RenderWorld and FlipBuffers
7. Exit on Escape

## Important Notes
- CreateLine3D(id, x1,y1,z1, color1, x2,y2,z2, color2) - 9 parameters
- Colors use RGB() function
- No Parse3DScripts call needed
- Simple static scene with camera navigation
