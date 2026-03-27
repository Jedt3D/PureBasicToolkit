# ResizeCamera.pb - Intermediate Description
## Purpose
Demonstrates the ResizeCamera() function by animating a second camera's viewport position and size. Shows a robot entity with walk animation viewed from two cameras: a main full-screen camera and a smaller bouncing/resizing wireframe camera overlay.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures.
## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, RenderWorld
- Entity: CreateEntity, RotateEntity, StartEntityAnimation
- Mesh: LoadMesh
- Material: CreateMaterial, LoadTexture
- Camera: CreateCamera, MoveCamera, CameraBackColor, CameraRenderMode, ResizeCamera
- Constants: #PB_Absolute, #PB_Relative, #PB_Camera_Wireframe, #CameraSpeed
## Input/Output
- Loads: robot.mesh, r2skin.jpg
- Displays: Robot with walk animation, two cameras with one bouncing/resizing
## Logic Flow
1. Define constant #CameraSpeed = 1
2. Define float variables for movement and camera animation (x=25, y=0, s=1, ps/px/py=0.2)
3. Initialize engine, sprite, keyboard, mouse
4. Open window and windowed screen
5. Add texture and model archives
6. Set ambient color, create material with robot skin texture
7. Create robot entity with walk animation
8. Create camera 0 (full screen, red background)
9. Create camera 1 (small viewport at x,y with size s,s, blue background, wireframe mode)
10. Main loop:
    - Rotate entity
    - Animate x position with px step, bounce at edges (0 and 100-s)
    - Animate y position with py step, bounce at edges
    - Animate size s with ps step, bounce between 1 and 100
    - Call ResizeCamera(1, x, y, s, s) each frame
    - RenderWorld and FlipBuffers
11. Exit on Escape
## Important Notes
- Camera viewport coordinates are in percentage (0-100)
- The bouncing/reversing logic toggles ps, px, py to create bouncing animation
- Variable Quit is used but not declared/initialized (implicit)
