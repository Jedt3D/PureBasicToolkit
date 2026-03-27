# RayCollide.pb - Intermediate Description
## Purpose
Demonstrates RayCollide with collision filtering. Uses bit-mask based collision groups to control which entities a ray can detect. F3 tests ray against cylinder position, F4 tests against box position. The ray is configured to NOT collide with boxes, demonstrating selective collision filtering.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Enumerations: #MainWindow, #Editor
- Constants: #CameraSpeed=1, #Speed=60, collision bit flags (#COL_Sphere through #COL_Ray), collision masks (#SphereCollidesWith etc.)
- Variables: KeyX, KeyY, MouseX, MouseY, RatioX, RatioY, d (float), x1-z2 (float), Shoot (integer), Entity, Event3D, Text$, Quit
## Key Libraries/Functions
- RayCollide: RayCollide (with collision group and mask parameters)
- SetEntityCollisionFilter: assigns collision group/mask to entities
- 3D GUI: OpenWindow3D, StringGadget3D, SetGadgetText3D, ShowGUI, WindowEvent3D
- Physics: CreateEntityBody
- Entity: CreateEntity, ScaleEntity
- Mesh: CreateCube, CreateSphere, CreateCylinder, MeshID
- Material: CreateMaterial, LoadTexture, GetScriptMaterial, MaterialID
- Line3D: CreateLine3D
- Camera: CreateCamera, MoveCamera, CameraLookAt, RotateCamera, CameraViewWidth, CameraViewHeight
## Input/Output
- Loads: Dirt.jpg, script materials (Color/Blue,Green,Red), GUI data
- Displays: Colored shapes with ray collision testing, 3D GUI showing results
- Controls: F3 test cylinder ray, F4 test box ray, arrows/mouse for camera, Esc to quit
## Logic Flow
1. Define collision group constants as bit flags (1<<6 through 1<<10)
2. Define collision masks specifying which groups interact
3. Initialize engine, sprite, keyboard, mouse
4. Open windowed screen, add archives, parse scripts
5. Create materials and meshes
6. Create entities: blue cube, green sphere, red cylinder, dirt platform
7. Create physics bodies for all entities
8. Set collision filters for each entity
9. Set up camera, lighting, 3D GUI
10. Main loop:
    a. F3: set ray endpoints through cylinder position (x=0, z=-4 to z=4)
    b. F4: set ray endpoints through box position (x=4, z=-4 to z=4)
    c. Call RayCollide with ray group and mask
    d. Ray is configured to NOT collide with boxes (#RayCollidesWith excludes #COL_Box)
    e. Display result in GUI: "Nothing" or entity ID
    f. Camera controls
11. Exit on Escape
## Important Notes
- Collision filtering uses bit masks (powers of 2) for group/mask system
- #RayCollidesWith = #COL_Sphere | #COL_Cylinder (excludes box intentionally)
- F3 ray should detect cylinder, F4 ray should NOT detect box (filtered out)
- RayCollide differs from RayCast by using physics-based collision with filters
- The collision constants use shifted bits (1 << 6 through 1 << 10)
