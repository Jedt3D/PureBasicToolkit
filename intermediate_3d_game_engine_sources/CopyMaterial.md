# CopyMaterial.pb - Intermediate Description

## Purpose
Demonstrates CopyMaterial() which duplicates a material so it can be applied to a different mesh independently. A sphere and cube share the same material (copied).

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures.

## Key Libraries/Functions
- Engine3D: InitEngine3D, RenderWorld
- Material: CreateMaterial, CopyMaterial, LoadTexture
- Mesh: CreateSphere, CreateCube
- Entity: CreateEntity
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor
- Light: CreateLight, AmbientColor
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers

## Input/Output
- Loads: clouds.jpg
- Displays: A sphere and a cube side by side, both using the clouds texture (one original, one copied)

## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen, add textures archive
3. Create material 0 with clouds texture
4. Create sphere entity with material 0 at (-60, 0, 0)
5. CopyMaterial(0, 1) - copy material 0 to material 1
6. Create cube entity with material 1 at (60, 0, 0)
7. Create camera at (0, 100, 300), set back color
8. Create light and ambient color
9. Main loop:
    a. Process events
    b. Examine keyboard
    c. RenderWorld and FlipBuffers
10. Exit on Escape

## Important Notes
- CopyMaterial(source, destination) copies all material properties
- Simple static scene - no animation or mouse input needed
- No mouse initialization needed since mouse is not used
