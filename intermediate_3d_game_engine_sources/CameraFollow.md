# CameraFollow.pb - Intermediate Description

## Purpose
Demonstrates CameraFollow() to make the camera automatically follow a ninja character as it moves through a scene with grass billboards, a tudor house, and a desert skybox.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Constants:
- `#CameraSpeed = 2`

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), Parse3DScripts(), CreateMaterial(), SetMaterialAttribute(), CreateBillboardGroup(), AddBillboard(), CreatePlane(), CreateEntity(), LoadMesh(), ScaleEntity(), StartEntityAnimation(), MoveEntity(), Yaw(), CreateCamera(), CameraFollow(), CameraLookAt(), CreateLight(), SkyBox(), RenderWorld()

## Input/Output
- Loads: grass1.png, Dirt.jpg, nskinrd.jpg, tudorhouse.mesh, ninja.mesh, Desert.zip skybox
- Displays: A ninja character walking through a grassy field with a house and desert skybox, camera following

## Logic Flow
1. Define input variables and camera speed constant
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add archives for textures, models, scripts, desert pack; parse scripts
5. Create grass material (alpha reject 128, clamp TAM), dirt material, ninja red material
6. Create grass billboard group (60x60), add 1001 random billboards
7. Create ground plane (2000x2000) with dirt
8. Load tudor house, scale to 0.5, position at Y=280
9. Load ninja mesh, create entity with red material at (500,0,400), scale 0.5, start Walk animation
10. Setup skybox, light, create camera
11. Main loop:
    - Read mouse delta for rotation, keyboard for movement
    - Move ninja entity with arrow keys (relative movement)
    - Yaw ninja based on mouse X input (world + relative)
    - CameraFollow: camera follows ninja with height offset, distance 160, smoothing 0.1/0.1
    - CameraLookAt ninja position (Y=40)
    - RenderWorld, FlipBuffers
12. Exit on Escape

## Important Notes
- CameraFollow(Camera, EntityID(Ninja), 0, EntityY(Ninja)+80, 160, 0.1, 0.1, #False)
  - Angle=0, height=EntityY+80, distance=160, smooth X=0.1, smooth Y=0.1, rotation=False
- Yaw() uses EntityID() not entity number directly
- #PB_World|#PB_Relative combined flags for Yaw
- Ninja starts at position (500, 0, 400)
