# Camera.pb - Intermediate Description

## Purpose
Demonstrates split-screen camera setup with two cameras viewing the same scene from front and back. The top half shows a normal textured view, the bottom half shows a wireframe view from the opposite side.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Constants:
- `#CameraSpeed = 1`

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), CreateMaterial(), LoadTexture(), LoadMesh(), CreateEntity(), StartEntityAnimation(), RotateEntity(), CreateCamera(), MoveCamera(), CameraBackColor(), RotateCamera(), MoveCamera(), CameraRenderMode(), AmbientColor(), RenderWorld()
- Sprite: InitSprite(), OpenWindowedScreen(), FlipBuffers()

## Input/Output
- Loads: r2skin.jpg, robot.mesh
- Displays: Split screen - top: front view of rotating walking robot, bottom: wireframe back view

## Logic Flow
1. Define input variables and camera speed constant
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add texture and model archives
5. Set green ambient color (HUD-like)
6. Create material from r2skin.jpg, create robot entity, start Walk animation
7. Create Camera 0 (front): viewport top half (0,0,100,50), position (0,20,250), dark red background
8. Create Camera 1 (back): viewport bottom half (0,50,100,50), position (0,20,-250), dark gray background, rotated 180 on X axis, wireframe mode
9. Main loop:
    - Read mouse and keyboard input
    - Rotate entity slowly (0.1 degrees Y per frame)
    - Camera 0: rotate and move by input
    - Camera 1: rotate and move by inverse input
    - RenderWorld, FlipBuffers
10. Exit on Escape

## Important Notes
- Camera viewport percentages: (x%, y%, width%, height%)
- Camera 1 is rotated 180 degrees to face the opposite direction
- CameraRenderMode(1, #PB_Camera_Wireframe) for wireframe view
- Both cameras respond to input but in opposite directions
- CreateEntity uses LoadMesh inline: CreateEntity(0, LoadMesh(0, "robot.mesh"), MaterialID(0))
