# BillboardGrass.pb - Intermediate Description

## Purpose
Demonstrates using billboard groups to simulate grass in a 3D scene. Creates 4001 grass billboards with alpha rejection, alongside a tudor house model, sky dome, and dirt ground plane. Camera can be controlled with mouse and keyboard.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Constants:
- `#CameraSpeed = 2`

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), Parse3DScripts(), CreateMaterial(), SetMaterialAttribute(), CreateBillboardGroup(), BillboardGroupCommonDirection(), AddBillboard(), CreatePlane(), CreateEntity(), LoadMesh(), ScaleEntity(), CreateLight(), CreateCamera(), MoveCamera(), CameraLookAt(), RotateCamera(), SkyDome(), LoadTexture(), RenderWorld()
- Sprite: InitSprite(), OpenWindowedScreen(), FlipBuffers()
- Keyboard: InitKeyboard(), ExamineKeyboard(), KeyboardPushed()
- Mouse: InitMouse(), ExamineMouse(), MouseDeltaX(), MouseDeltaY(), MouseWheel()

## Input/Output
- Loads: grass1.png, Dirt.jpg, tudorhouse.mesh, sky.png, skybox.zip pack
- Displays: Large field of grass billboards with a house, under a sky dome

## Logic Flow
1. Define input variables, camera speed constant
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add archives for textures, models, scripts, skybox pack; parse scripts
5. Create grass material with alpha reject (128) and clamp TAM; create dirt material
6. Create billboard group with grass material (50x50 size), set common direction (0,1,0) for upward orientation
7. Loop 0 to 4000: add billboards at random positions across 2000x2000 area, Y=Random(8)+15
8. Create ground plane (2000x2000) with dirt material
9. Load tudor house mesh, create entity scaled to 0.5, positioned at Y=280
10. Create light, create camera at (200,100,900) looking at (0,100,0)
11. Load sky texture, create sky dome
12. Main loop:
    - Read mouse delta and wheel for camera control
    - Arrow keys for camera movement
    - RotateCamera, MoveCamera
    - RenderWorld, FlipBuffers
13. Exit on Escape

## Important Notes
- #PB_Material_AlphaReject = 128 for grass transparency
- #PB_Material_TAM and #PB_Material_ClampTAM for texture addressing
- BillboardGroupCommonDirection(Billboard, 0, 1, 0) makes grass always face up
- Last two parameters of CreateBillboardGroup are -1, 1 (billboard type parameters)
- MouseWheel() used for zoom control
