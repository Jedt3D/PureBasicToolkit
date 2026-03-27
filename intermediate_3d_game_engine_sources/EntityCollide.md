# EntityCollide.pb - Intermediate Description
## Purpose
Demonstrates EntityCollide() for detecting collisions between physics-enabled entities. User clicks to shoot spheres that collide with and destroy colored objects (cube, sphere, cylinder) on a platform.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures. Constants: #CameraSpeed=0.4, #Speed=60, #MainWindow=0, #TextGadget=0.
## Key Libraries/Functions
- EntityCollide() - checks if two entities are in contact
- CreateEntityBody() with Box, Sphere, Cylinder body types
- ApplyEntityImpulse() for shooting projectiles
- PointPick(), PickX/Y/Z() for mouse-ray intersection
- GetScriptMaterial() for colored materials
- OpenWindow3D(), TextGadget3D(), ShowGUI() for 3D GUI overlay
- InputEvent3D(), WindowEvent3D() for 3D GUI input
- FreeEntity() to destroy entities on collision
- ScaleEntity() for ground platform
## Input/Output
- Loads: Dirt.jpg, scripts, GUI resources
- Displays: 3 colored shapes on a platform, 3D GUI text, mouse cursor
- Controls: Left click to shoot, arrows move camera, Esc quit
## Logic Flow
1. Define constants and variables
2. Initialize subsystems, open window/screen
3. Add archives (Textures, Models, Scripts, GUI), parse scripts
4. Create materials: Blue, Green, Red, Yellow (script), Dirt (texture)
5. Create meshes: cube, sphere, cylinder
6. Create 4 entities: blue cube, green sphere, red cylinder, ground platform (scaled cube)
7. Create physics bodies for all entities (ground has mass 0 = static)
8. Create camera, light
9. Create 3D GUI window with text gadget
10. Show GUI with transparency and mouse cursor
11. Main loop:
    a. Process window events, 3D GUI events
    b. Read mouse, send InputEvent3D
    c. On left click: PointPick for ray, create shoot sphere with impulse
    d. Read keyboard for camera movement
    e. Check EntityCollide between shoot entity and entities 0-2
    f. On collision: free both entities, reset shoot
    g. Move camera, look at origin
    h. Render and flip
12. Exit on Escape
## Important Notes
- Clic variable prevents rapid fire (one shot per click)
- Shoot entity is #PB_Any dynamic ID
- When collision detected, both projectile and target are freed
- GUI overlay shows "Clic somewhere" text
- ShowGUI(128, 1) = semi-transparent with mouse cursor
