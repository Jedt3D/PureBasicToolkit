# RayPick.pb - Intermediate Description
## Purpose
Demonstrates RayPick for detecting entities along a ray defined by origin and direction in world space. A small sphere orbits via nodes and casts a ray that detects entities. Includes an animated robot. Shows pick result in 3D GUI. RayPick differs from RayCast in that it uses mesh-level picking rather than physics bodies.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Enumerations: #MainWindow, #Editor
- Constants: #CameraSpeed=0.4
- Variables: KeyX, KeyY, MouseX, MouseY, SpeedRotate (float), MaskSphere=0, RatioX, RatioY (float), Entity, Event3D, Quit
## Key Libraries/Functions
- RayPick: RayPick, PickX, PickY, PickZ
- 3D GUI: OpenWindow3D, StringGadget3D, SetGadgetText3D, ShowGUI, WindowEvent3D
- Node: CreateNode, AttachNodeObject, NodeX, NodeY, NodeZ, RotateNode, MoveNode, NodeID
- Entity: CreateEntity, ScaleEntity, StartEntityAnimation
- Mesh: CreateCube, CreateSphere, CreateCylinder, CreatePlane, LoadMesh, MeshID
- Material: CreateMaterial, LoadTexture, GetScriptMaterial, MaterialID
- Line3D: CreateLine3D
- Camera: CreateCamera, MoveCamera, CameraLookAt, RotateCamera, CameraViewWidth, CameraViewHeight
- Keyboard: KeyboardMode
## Input/Output
- Loads: Dirt.jpg, r2skin.jpg, script materials (Color/Blue,Green,Red,Yellow), robot.mesh, GUI data
- Displays: Colored shapes, animated robot, rotating ray pick with visual feedback
- Controls: Arrows/mouse for camera, Esc to quit
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen, add archives, parse scripts
3. Set keyboard international mode
4. Create materials (4 script colors + dirt + r2skin)
5. Create meshes: cube, sphere, cylinder, plane, robot
6. Create entities: blue cube, green sphere, red cylinder, yellow cube, dirt plane, red sphere (MaskSphere=0)
7. Create robot entity with walk animation
8. Create node hierarchy for ray origin and direction
9. Set up camera, lighting, 3D GUI
10. Main loop:
    a. Process events
    b. RayPick from node 0 toward node 1
    c. Draw line for ray; on hit draw red line to pick point
    d. Update GUI text
    e. If entity is robot (10), slow rotation; otherwise fast rotation
    f. Rotate node, camera controls
11. Exit on Escape
## Important Notes
- MaskSphere=0 makes entity invisible to RayPick (passed as last parameter to CreateEntity)
- RayPick uses mesh geometry for detection (not physics bodies)
- Entity 5 (red sphere) orbits but is excluded from detection via mask
- Robot entity uses r2skin.jpg texture (material 10)
- SpeedRotate varies: 0.1 for robot hit, 1 for other/no hit
