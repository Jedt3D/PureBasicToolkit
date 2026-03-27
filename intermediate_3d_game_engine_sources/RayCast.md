# RayCast.pb - Intermediate Description
## Purpose
Demonstrates RayCast for detecting entities along a ray in 3D space. A small sphere orbits via a node, casting a ray that detects entities it points at. Includes animated robot and ninja meshes. Line3D shows the ray visually, changing color on hit. A 3D GUI displays which entity is detected.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Enumerations: #MainWindow, #Editor
- Constants: #CameraSpeed=0.4, #N=2
- Variables: KeyX, KeyY, MouseX, MouseY, RatioX, RatioY, SpeedRotate (float), Entity, Event3D, Quit
## Key Libraries/Functions
- RayCast: RayCast, PickX, PickY, PickZ, NormalX, NormalY, NormalZ
- 3D GUI: OpenWindow3D, StringGadget3D, SetGadgetText3D, ShowGUI, WindowEvent3D
- Node: CreateNode, AttachNodeObject, NodeX, NodeY, NodeZ, RotateNode, MoveNode, NodeID
- Entity: CreateEntity, ScaleEntity, RotateEntity, StartEntityAnimation
- Mesh: CreateCube, CreateSphere, CreateCylinder, CreatePlane, LoadMesh, MeshID
- Material: CreateMaterial, LoadTexture, GetScriptMaterial, MaterialID
- Line3D: CreateLine3D
- Camera: CreateCamera, CameraBackColor, MoveCamera, CameraLookAt, RotateCamera, CameraViewWidth, CameraViewHeight
- World: WorldDebug, KeyboardMode
## Input/Output
- Loads: Dirt.jpg, script materials (Color/Blue,Green,Red,Yellow), robot.mesh, ninja.mesh, GUI data
- Displays: Various colored shapes, animated models, rotating raycast with visual feedback
- Controls: Arrows/mouse for camera, Esc to quit
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen, add archives, parse scripts
3. Set keyboard international mode, enable world debug for entities
4. Create materials (4 script colors + dirt)
5. Create meshes: cube, sphere, cylinder, plane, robot, ninja
6. Create entities: blue cube, green sphere, red cylinder, yellow cube (scaled long), small red sphere (PickMask=0)
7. Create robot and ninja with walk animations
8. Create node hierarchy: node 0 at (3,0,0) with sphere and child node 1 at (0,0,1)
9. Set up camera, lighting
10. Create 3D GUI with string gadget
11. Main loop:
    a. Process events
    b. RayCast from node 0 toward node 1 direction
    c. Draw white line for ray; on hit, draw cyan line to pick point and red normal line
    d. Update GUI text with entity ID or "looking" message
    e. Adjust rotation speed based on hit (slower when hitting)
    f. Rotate node, move camera
12. Exit on Escape
## Important Notes
- Entity 5 has PickMask=0 making it invisible to RayCast
- RayCast returns entity ID or -1 if nothing hit
- NormalX/Y/Z return surface normal at hit point
- The small sphere (entity 5) orbits but is excluded from ray detection
- WorldDebug shows entity bounding boxes
- SpeedRotate changes between 0.1 (hit) and 0.5 (no hit)
