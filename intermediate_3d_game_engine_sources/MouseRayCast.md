# MouseRayCast.pb - Intermediate Description

## Purpose
Demonstrates MouseRayCast() for continuous ray-based entity detection. Unlike MousePick, MouseRayCast also provides normal vectors at the intersection point, visualized with a yellow line.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Constants: #CameraSpeed = 0.4, #N = 2
- Enumeration: #MainWindow, #Editor
- Variables: KeyX, KeyY, MouseX, MouseY, RatioX, RatioY (floats), Entity, Mx, My, Event3D, Quit (integers)

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, WorldDebug
- Material: GetScriptMaterial, CreateMaterial, LoadTexture
- Mesh: CreateCube, CreateSphere, CreateCylinder, CreatePlane, LoadMesh, FreeMesh, IsMesh
- Entity: CreateEntity, ScaleEntity, RotateEntity, StartEntityAnimation
- Node: CreateNode, AttachNodeObject, MoveNode, RotateNode
- Picking: MouseRayCast, PickX, PickY, PickZ, NormalX, NormalY, NormalZ
- Line: CreateLine3D
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor, CameraViewWidth, CameraViewHeight, RotateCamera
- Light: CreateLight, AmbientColor
- 3D GUI: OpenWindow3D, StringGadget3D, ShowGUI, InputEvent3D, WindowEvent3D, SetGadgetText3D, MouseLocate

## Input/Output
- Input: Dirt.jpg texture; Color script materials; PureBasic.mesh, robot.mesh, ninja.mesh models; GUI resources
- Output: 3D scene with various entities; yellow line shows surface normal at raycast hit point

## Logic Flow
1. Initialize all subsystems
2. Open window and screen
3. Add archives; parse scripts; enable keyboard international mode and world debug
4. Create materials and meshes (including loaded meshes for PureBasic logo, robot, ninja)
5. Create entities: sphere, cylinder, scaled box, PB logo, cube
6. Create robot and ninja entities with walk animations
7. Create node hierarchy: node 0 with PB logo attached, node 1 as child
8. Create camera with custom back color
9. Create light and ambient
10. Scale 3D GUI based on camera view dimensions ratio to 1920x1080
11. Show GUI, center mouse cursor
12. Main loop:
    a. Process window and 3D events
    b. Read mouse position and delta
    c. MouseRayCast(0, Mx, My, -1) returns entity under cursor
    d. If entity found: draw yellow normal line from pick point, show entity ID in GUI
    e. If no entity: free line mesh if exists, show "I'm looking..." in GUI
    f. Rotate PB logo node, camera controls, render
13. Exit on Escape or Quit

## Important Notes
- MouseRayCast provides NormalX/Y/Z in addition to PickX/Y/Z
- CreateLine3D(11, ...) conflicts with ninja mesh loaded as mesh 11 - must check IsMesh before FreeMesh
- The -1 parameter in MouseRayCast means check all entities
- RatioX/RatioY scale the 3D GUI to match actual viewport size
- MouseLocate centers the mouse cursor initially
