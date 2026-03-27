# ExamineWorldCollisions.pb - Intermediate Description
## Purpose
Demonstrates ExamineWorldCollisions() for physics world collision detection. A sphere rolls through a field of cubes, and collision contact points are visualized as green lines showing collision normals.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures. Constant #CameraSpeed=1.
## Key Libraries/Functions
- ExamineWorldCollisions(#True) - examines world with contact info
- NextWorldCollision() - iterates through collisions
- FirstWorldCollisionEntity(), SecondWorldCollisionEntity() - get colliding entity IDs
- WorldCollisionContact() - gets contact point
- WorldCollisionNormal() - gets contact normal
- GetX(), GetY(), GetZ() - retrieve coordinates after collision queries
- CreateLine3D() - draws debug lines at collision points
- FreeMesh() - cleans up debug lines
- CreateEntityBody() with various body types and mass/friction/restitution
- CameraFollow() - third-person camera following entity
- MoveEntity() with #PB_Local
- WorldShadows(#PB_Shadow_Additive)
## Input/Output
- Loads: Dirt.jpg, DosCarte.png, Wood.jpg, stevecube.jpg
- Displays: Sphere rolling through cube obstacles, green collision normal lines
- Controls: Up/Down keys move sphere, mouse rotates, Esc quit
## Logic Flow
1. Define variables including d=0.4 (normal line length scale)
2. Initialize subsystems, open window/screen
3. Add archives, parse scripts, set additive shadows
4. Create materials (dirt, dos carte, wood)
5. Create sphere and cube meshes (small: 0.06 radius, 0.1 cube)
6. Create ground entity (scaled cube, mass 0 = static, with friction)
7. Create player sphere entity with physics body (mass 0.5)
8. Create 101 random entities: 50% movable cubes (mass 0.1), 50% static cubes
9. Create skybox, camera with CameraRange
10. Set up CameraFollow for third-person view
11. Create light, set ambient
12. Main loop:
    a. Process events, read mouse/keyboard
    b. Accelerate/decelerate player based on Up/Down keys
    c. Rotate entity with mouse, move entity in local space
    d. Update CameraFollow
    e. ExamineWorldCollisions(#True) for contact info
    f. Iterate collisions: skip ground contacts, get contact point and normal, create green debug line
    g. If too many lines (>200), free all and reset counter
    h. Render with physics step (50), flip
13. Exit on Escape
## Important Notes
- Uses #PB_Any for dynamic entity/mesh IDs
- Ground entity filtered out of collision display
- Debug lines accumulate until 200 limit, then all cleared
- Player speed has momentum (Speed1 * 0.9 decay)
- CameraFollow provides smooth third-person tracking
- Small scale world (sphere radius 0.06, cubes 0.1)
