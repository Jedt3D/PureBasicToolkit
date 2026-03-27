# PointPick.pb - Intermediate Description
## Purpose
Demonstrates PointPick for converting 2D mouse coordinates to a 3D direction vector. Clicking the mouse shoots a sphere from the camera position in the direction determined by PointPick, using the resulting PickX/Y/Z as the impulse direction.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Enumerations: #MainWindow, #Editor
- Constants: #CameraSpeed=0.4, #Speed=60
- Variables: KeyX, KeyY, MouseX, MouseY, RatioX, RatioY (float), DebugBody, Clic, Shoot, Event3D, Quit
## Key Libraries/Functions
- PointPick: PointPick, PickX, PickY, PickZ
- 3D GUI: OpenWindow3D, StringGadget3D, ShowGUI, WindowEvent3D, InputEvent3D
- Physics: CreateEntityBody, ApplyEntityImpulse
- Entity: CreateEntity, ScaleEntity
- Mesh: CreateCube, CreateSphere, CreateCylinder, MeshID
- Material: CreateMaterial, LoadTexture, GetScriptMaterial, MaterialID
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraX, CameraY, CameraZ, CameraViewWidth, CameraViewHeight
- Mouse: MouseX(), MouseY(), MouseButton
## Input/Output
- Loads: Dirt.jpg texture, script materials (Color/Blue, Green, Red, Yellow), GUI data
- Displays: Colored shapes on a platform with a 3D GUI window showing click info
- Controls: Mouse click to shoot spheres, arrows for camera, Esc to quit
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen
3. Add archives (textures, models, scripts, GUI); parse scripts
4. Create materials (4 script colors + dirt)
5. Create meshes: cube, sphere, cylinder
6. Create entities: blue cube, green sphere, red cylinder, dirt platform
7. Add physics bodies to all entities
8. Set up camera and lighting
9. Create 3D GUI window with read-only string gadget
10. Main loop:
    a. Process window and 3D events
    b. On mouse click: call PointPick(0, MouseX(), MouseY())
    c. If hit: create sphere at camera position, apply impulse in pick direction * #Speed
    d. Use Clic flag to prevent continuous shooting
    e. Move camera with arrow keys
11. Exit on Escape
## Important Notes
- PointPick converts 2D screen coords to 3D ray direction
- PickX/Y/Z return normalized direction vector components
- InputEvent3D feeds mouse events to the 3D GUI system
- The Clic flag ensures one shot per mouse press
- Spheres are created dynamically with #PB_Any
