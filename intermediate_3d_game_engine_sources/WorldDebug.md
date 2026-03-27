# WorldDebug.pb - Intermediate Description
## Purpose
Demonstrates the WorldDebug function that visualizes physics bodies and entity bounding boxes for debugging purposes, with toggleable debug modes.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Enumeration: #MainWindow, #Editor
- Constants: #CameraSpeed = 0.4, #Speed = 60
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- GetScriptMaterial(), CreateMaterial(), LoadTexture()
- CreateCube(), CreateSphere(), LoadMesh()
- CreateEntity(), ScaleEntity()
- CreateEntityBody() with #PB_Entity_BoxBody, SphereBody, StaticBody
- WorldDebug() with #PB_World_DebugEntity, #PB_World_DebugBody, #PB_World_DebugNone
- CreateCamera(#PB_Any), MoveCamera(), CameraLookAt(), CameraViewWidth/Height()
- CreateLight(#PB_Any)
- OpenWindow3D(), EditorGadget3D(), SetGadgetText3D(), ShowGUI()
- InputEvent3D()
- WindowEvent3D()
- RenderWorld(), FlipBuffers()
## Input/Output
- Loads: Dirt.jpg texture, PureBasic.mesh model, color script materials, GUI data
- Displays: Cube, sphere, and PB logo with physics bodies, debug wireframes toggleable
- F2: Entity debug, F3: Body debug, F4: No debug
## Logic Flow
1. Initialize engine, create windowed screen
2. Add archives for textures, models, scripts, GUI
3. Get 4 script materials (Blue, Green, Red, Yellow), create dirt material
4. Create cube, sphere, PureBasic logo meshes
5. Create entities: blue cube, green sphere, red PB logo, dirt ground
6. Create physics bodies for all entities
7. Create camera with #PB_Any, position and look at origin
8. Create light
9. Set up 3D GUI window with editor showing debug key instructions
10. Show GUI with mouse cursor
11. Main loop:
    - Process window events and 3D events
    - Mouse input drives InputEvent3D
    - F2/F3/F4 toggle WorldDebug mode
    - Arrow keys move camera, camera always looks at origin
    - Render and flip
## Important Notes
- Camera always looks at origin (CameraLookAt called each frame)
- WorldDebug modes: DebugEntity shows bounding boxes, DebugBody shows physics shapes
- PureBasic.mesh scaled to 0.1 for appropriate size
- Uses #PB_Any for camera and light creation
- 3D GUI provides on-screen instructions
