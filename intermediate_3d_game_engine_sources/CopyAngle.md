# CopyAngle.pb - Intermediate Description

## Purpose
Demonstrates copying rotation angles from one entity to another using EntityPitch/Yaw/Roll with the #PB_Engine3D_Adjusted flag. Two robot meshes are shown side by side - entity 1 rotates freely while entity 2 copies its rotation.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures.

## Key Libraries/Functions
- Engine3D: InitEngine3D, RenderWorld
- Entity: CreateEntity, RotateEntity, EntityPitch, EntityYaw, EntityRoll
- Mesh: LoadMesh
- Material: CreateMaterial, LoadTexture
- Camera: CreateCamera, MoveCamera, RotateCamera
- SkyBox
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed
- Mouse: InitMouse, ExamineMouse, MouseDeltaX, MouseDeltaY
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers

## Input/Output
- Loads: robot.mesh, clouds.jpg, r2skin.jpg, stevecube.jpg (skybox)
- Displays: Two robot models, one rotating automatically, the other mirroring its rotation

## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen, add archives for textures, models, skybox
3. Load robot mesh, create 2 materials
4. Create entity 1 at (-30,0,0) and entity 2 at (30,0,0)
5. Create skybox
6. Create camera at (0, 40, 150)
7. Main loop:
    a. Process events, mouse, keyboard
    b. Rotate entity 1 by (0.7, 1, 0.5) relative
    c. Copy entity 1's angles to entity 2 using EntityPitch/Yaw/Roll with #PB_Engine3D_Adjusted
    d. Move/rotate camera
    e. RenderWorld and FlipBuffers
8. Exit on Escape

## Important Notes
- EntityPitch/Yaw/Roll with #PB_Engine3D_Adjusted provides adjusted Euler angles
- RotateEntity(2, pitch, yaw, roll) uses absolute mode by default to set exact angles
- No Parse3DScripts needed (no script materials used)
