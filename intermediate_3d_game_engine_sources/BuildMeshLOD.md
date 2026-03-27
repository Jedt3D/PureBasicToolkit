# BuildMeshLOD.pb - Intermediate Description

## Purpose
Demonstrates BuildMeshLOD() for automatic Level of Detail generation and AddMeshManualLOD() for manual LOD creation. Creates rows of entities that show LOD transitions as the camera moves.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. No named constants.

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), Parse3DScripts(), LoadMesh(), BuildMeshLOD(), CreateSphere(), AddMeshManualLOD(), CreateEntity(), CreateCamera(), MoveCamera(), CameraLookAt(), CameraBackColor(), CameraRenderMode(), CreateLight(), AmbientColor(), RotateCamera(), MoveCamera(), RenderWorld()
- Sprite: InitSprite(), OpenWindowedScreen(), FlipBuffers()
- Keyboard: InitKeyboard(), ExamineKeyboard(), KeyboardPushed(), KeyboardReleased()
- Mouse: InitMouse(), ExamineMouse(), MouseDeltaX(), MouseDeltaY(), MouseWheel()

## Input/Output
- Loads: Sinbad.mesh from Sinbad.zip pack, Textures archive
- Displays: Three columns of 21 entities each (Sinbad, manual LOD spheres, another set of manual LOD spheres) with wireframe toggle (F12)

## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window and windowed screen
3. Add texture archive and Sinbad.zip pack; parse scripts
4. Create camera, light, ambient color, back color
5. Load Sinbad mesh (ID 0), call BuildMeshLOD(0, 4, 40, 0.5) for automatic LOD
6. Create manual LOD spheres: mesh 1 (32 segments) with manual LODs at distances 40, 80, 160 using progressively simpler spheres
7. Create second set of manual LOD spheres (mesh 5) with same pattern
8. Loop 0 to 20: create entities in three columns at Z intervals of 15
9. Main loop:
    - F12 toggles wireframe/solid rendering
    - Arrow keys and mouse wheel for camera movement
    - Mouse for camera rotation
    - Smooth camera movement with acceleration (depza interpolation)
    - RenderWorld, FlipBuffers
10. Exit on Escape or right mouse button

## Important Notes
- BuildMeshLOD(0, 4, 40, 0.5): mesh 0, 4 LOD levels, starting distance 40, reduction factor 0.5
- AddMeshManualLOD(1, 4, 0) sets the final LOD (distance 0 means infinity)
- CreateEntity(-1, ...) uses -1 for auto-numbering
- Uses Bool() function for keyboard state conversion
- depza+(depz-depza)*0.05 creates smooth camera acceleration
- Tab character indentation mixed with spaces in original
