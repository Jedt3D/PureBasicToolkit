# SetEntityCollisionFilter.pb - Intermediate Description
## Purpose
Demonstrates SetEntityCollisionFilter() for selective physics collision between different entity types. Creates box, sphere, and cylinder entities with collision filters so each type collides with other types but not with the same type. Click to shoot spheres into the scene.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures. Uses Enumeration for window IDs.
## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld
- Entity: CreateEntity, ScaleEntity, CreateEntityBody, SetEntityCollisionFilter, ApplyEntityImpulse
- Mesh: CreateCube, CreateSphere, CreateCylinder
- Material: GetScriptMaterial, CreateMaterial, LoadTexture
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraViewWidth, CameraViewHeight
- Mouse: ExamineMouse, MouseDeltaX, MouseDeltaY, MouseX, MouseY, MouseButton, InputEvent3D
- Picking: PointPick, PickX, PickY, PickZ
- GUI3D: OpenWindow3D, TextGadget3D, ShowGUI, WindowEvent3D
- Light: CreateLight, AmbientColor
- Constants: #PB_Entity_BoxBody, #PB_Entity_SphereBody, #PB_Entity_CylinderBody, #PB_Any
- Collision filter constants using bit shifts (1 << 6..9)
## Input/Output
- Loads: Textures, Models, Scripts, GUI archives
- Uses materials: Color/Blue, Color/Green, Color/Red, Color/Yellow, Dirt.jpg
- Displays: Box, sphere, cylinder entities on a ground platform with collision physics and 3D GUI
## Logic Flow
1. Define collision filter constants using bit shifts for sphere, box, cylinder, ground
2. Define collision mask constants for what each type collides with
3. Define enumeration for MainWindow, Editor
4. Initialize engine, sprite, keyboard, mouse
5. Open window and windowed screen
6. Add archives; parse scripts
7. Get/create materials (blue, green, red, yellow, dirt)
8. Create meshes: cube, sphere, cylinder
9. Create entities: box at (4,1,0), sphere at (-4,0.5,0), cylinder at (0,-1,0), ground at (0,-4,0) scaled
10. Create physics bodies for each entity
11. Apply collision filters: each type collides with other types and ground, not with itself
12. Create camera, light
13. Create 3D GUI window with text
14. Show GUI semi-transparent with mouse cursor
15. Main loop:
    - Process window events and 3D events
    - On mouse click: use PointPick to get 3D direction, create sphere entity (#PB_Any), apply impulse
    - Set collision filter on new sphere
    - Move camera with keyboard
    - RenderWorld and FlipBuffers
16. Exit on Escape
## Important Notes
- Collision filters use bit flags with << operator
- #PB_Any used for dynamically created shoot entities
- PointPick provides ray-casting for click direction
- 3D GUI overlay for instructions
- Variable Clic used for click debouncing (implicitly declared)
