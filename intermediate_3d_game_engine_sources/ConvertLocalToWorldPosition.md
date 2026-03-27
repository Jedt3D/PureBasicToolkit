# ConvertLocalToWorldPosition.pb - Intermediate Description

## Purpose
Demonstrates ConvertLocalToWorldPosition() which converts coordinates from an entity's local space to world space. Two spheres track the corners of a moving/rotating cube.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
Uses built-in Vector3 structure for corner coordinates (C1, C2).

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld, ConvertLocalToWorldPosition, GetX, GetY, GetZ
- Entity: CreateEntity, MoveEntity, RotateEntity, EntityPitch, EntityYaw, EntityRoll, EntityX, EntityY, EntityZ
- Mesh: CreateCube, CreateSphere
- Material: CreateMaterial, LoadTexture
- Camera: CreateCamera, MoveCamera, CameraLookAt
- Keyboard: InitKeyboard, ExamineKeyboard
- Mouse: InitMouse, ExamineMouse, MouseDeltaX, MouseDeltaY
- SkyBox
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers

## Input/Output
- Loads: Dirt.jpg, Wood.jpg, stevecube.jpg (skybox)
- Displays: A rotating/moving cube with two spheres tracking its opposite corners

## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Define Vector3 corners: C1=(-25,-25,-25) and C2=(25,25,25)
3. Open windowed screen, add archives, parse scripts
4. Create cube mesh (size 50) and sphere mesh (radius 8)
5. Create 3 entities: cube (entity 0), two spheres (entities 1 and 2)
6. Create skybox
7. Create camera at (90, 80, 150)
8. Main loop:
    a. Process events
    b. Rotate cube and move it forward in local space
    c. ConvertLocalToWorldPosition for C1 corner -> move sphere 1 to GetX/Y/Z
    d. ConvertLocalToWorldPosition for C2 corner -> move sphere 2 to GetX/Y/Z
    e. Copy cube rotation to sphere 2 using EntityPitch/Yaw/Roll with #PB_Engine3D_Adjusted
    f. Camera looks at cube
    g. RenderWorld and FlipBuffers
9. Exit on Escape

## Important Notes
- Define.Vector3 declares variables of the built-in Vector3 structure type
- Vector3 has \x, \y, \z fields
- ConvertLocalToWorldPosition(EntityID, x, y, z) stores result retrievable via GetX(), GetY(), GetZ()
- #PB_Engine3D_Adjusted flag for getting Euler angles
- #PB_Local flag for local-space movement
- #PB_Absolute flag for world-space positioning
