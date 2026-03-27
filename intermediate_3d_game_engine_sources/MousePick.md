# MousePick.pb - Intermediate Description

## Purpose
Demonstrates MousePick() for 3D object selection with mouse. Click on entities to identify them; a small yellow sphere moves to the picked position. A 3D GUI window shows the picked entity ID.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Constants: #CameraSpeed = 0.4
- Enumeration: #MainWindow, #Editor
- Variables: KeyX, KeyY, MouseX, MouseY (floats), Entity (integer), Quit (integer)

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, WorldDebug
- Material: GetScriptMaterial, CreateMaterial, LoadTexture, ScaleMaterial
- Mesh: CreateCube, CreateSphere, CreateCylinder, CreatePlane
- Entity: CreateEntity, ScaleEntity, MoveEntity
- Picking: MousePick, PickX, PickY, PickZ
- Camera: CreateCamera, MoveCamera, CameraLookAt
- Light: CreateLight, AmbientColor
- 3D GUI: OpenWindow3D, StringGadget3D, ShowGUI, InputEvent3D, WindowEvent3D, SetGadgetText3D

## Input/Output
- Input: Dirt.jpg texture; Color script materials (Blue, Green, Red, Yellow); GUI resources
- Output: 3D scene with colored objects, clickable with mouse pick feedback in 3D GUI

## Logic Flow
1. Initialize all subsystems
2. Open window and screen
3. Add archives for textures, models, scripts, GUI; parse scripts
4. Enable world debug for entity outlines
5. Create script materials (blue, green, red, yellow) and dirt texture material
6. Create cube, sphere, cylinder, plane meshes
7. Create entities: blue cube at (4,1,0), green sphere at (-4,1,0), red cylinder at (0,2,0), ground plane, small yellow sphere (picker marker)
8. Scale yellow sphere to 0.1
9. Create camera, light, ambient color
10. Open 3D window with read-only string gadget
11. Show GUI with transparency and cursor
12. Main loop:
    a. Process window and 3D events
    b. On left mouse click: MousePick returns entity ID
    c. If entity found (>=0 and not 3): move yellow sphere to pick position, update GUI text
    d. Camera controls, render
13. Exit on Escape or Quit

## Important Notes
- MousePick returns entity ID or -1 if nothing picked
- Entity 3 (yellow sphere marker) is excluded from pick results
- PickX/PickY/PickZ return the 3D intersection point
- 3D GUI uses OpenWindow3D/StringGadget3D for in-scene UI
- WorldDebug(#PB_World_DebugEntity) shows entity bounding boxes
