# Billboard.pb - Intermediate Description

## Purpose
Demonstrates basic billboard group creation and usage. Creates three billboards in a group with a rotating cloud texture material, and orbits the camera around them.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Constants:
- `#CameraSpeed = 1`

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), CreateMaterial(), RotateMaterial(), CreateBillboardGroup(), AddBillboard(), CreatePlane(), CreateEntity(), EntityRenderMode(), CreateCamera(), MoveCamera(), CameraLookAt(), AmbientColor(), RenderWorld()
- Sprite: InitSprite(), OpenWindowedScreen(), FlipBuffers()
- Keyboard: InitKeyboard(), ExamineKeyboard(), KeyboardPushed()
- Mouse: InitMouse()

## Input/Output
- Loads: Dirt.jpg, clouds.jpg from Textures directory
- Displays: Three billboards with rotating cloud texture orbited by camera, on a dirt ground plane

## Logic Flow
1. Define angle variable (float)
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add textures archive
5. Set ambient color to white
6. Create dirt ground plane with entity (render mode 0)
7. Create cloud material with rotation effect (0.05 speed, 1 scroll)
8. Create billboard group (10x10 size) with the cloud material
9. Add three billboards at (-20,20,0), (0,20,0), (20,20,0)
10. Create camera
11. Main loop:
    - Increment angle by 0.02
    - Position camera using Cos/Sin of angle * 50, Y=40
    - Look at (0,20,0)
    - RenderWorld, FlipBuffers
12. Exit on Escape

## Important Notes
- Camera orbits automatically, no user camera control
- RotateMaterial creates an animated texture effect
- LoadTexture(0, ...) reuses texture ID 0 for clouds (overwriting Dirt.jpg texture ID)
- Billboard material uses #PB_Any for creation
