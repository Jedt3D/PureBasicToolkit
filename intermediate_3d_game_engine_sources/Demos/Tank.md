# Tank.pb - Intermediate Description
## Purpose
Demonstrates a tank simulation with turret/cannon control, shooting with ribbon trail effects, physics-based projectiles, and a smooth-tracking camera system. Features destructible pyramid of crates.
## Type
3D Engine Demo (complex game demo)
## Compiler Flags
None (GUI app with windowed screen)
## Structure
- `s_Key`: Key bindings (Up, Down, Left, Right)
- `s_Entity`: Tank entity with nodes (MainNode, TourelleNode, CanonNode, ShootNode, ForwardNode, SightNode, CameraNode, SightNode1, CameraNode1), key bindings, elapsed time
- `s_Camera`: Camera with camera ID, tightness factor, camera node, target node
- `Bullet`: Bullet entity ID, ribbon effect ID, timer, direction vector, speed, life timestamp
- Constants: #PlayerSpeed=0.4, #CameraSpeed=1
## Key Libraries/Functions
- Engine3D: CreateEntity, ScaleEntity, MoveEntity, RotateEntity, CreateEntityBody, ApplyEntityImpulse
- Node system: CreateNode, AttachNodeObject, AttachEntityObject, MoveNode, RotateNode, NodeX/Y/Z
- RibbonEffect: CreateRibbonEffect, RibbonEffectColor, RibbonEffectWidth, AttachRibbonEffect, FreeEffect
- Camera: CreateCamera, CameraFOV, CameraLookAt
- Shadows: WorldShadows (#PB_Shadow_Modulative, 500)
- Physics: CreateEntityBody, ApplyEntityImpulse, #PB_Entity_BoxBody, #PB_Entity_SphereBody, #PB_Entity_StaticBody
## Input/Output
- Input: Keyboard (arrows for tank movement, F5-F7 debug views, Escape to quit), Mouse (aim turret/cannon, left click to shoot)
- Output: 3D scene with drivable tank, turret aiming, projectile shooting, destructible pyramid
- Data: Main, Textures (RustySteel.jpg, Caisse.png), Scripts, desert.zip
## Logic Flow
1. Define structures, declare procedures
2. Initialize engine, sprites, keyboard, mouse
3. Open window and screen (80% desktop)
4. Add archives, parse scripts
5. Enable modulative shadows with distance 500
6. Create textures (white solid, gradient ribbon)
7. Create materials (rusty steel for tank, red for bullets, ground blend, crate, ribbon trail)
8. Create ground plane with static body
9. Create meshes (cube, sphere, cylinder)
10. Create tank body parts (corps entity, tourelle entity, canon entity)
11. Create destructible pyramid (8 levels of crate boxes with box bodies)
12. Create lights, fog, skybox
13. Setup tank node hierarchy:
    - MainNode -> SightNode, TourelleNode, CameraNode, ForwardNode
    - TourelleNode -> CanonNode
    - CanonNode -> ShootNode, CameraNode1
    - ShootNode -> SightNode1
    - Attach entities to their respective nodes
14. Setup cameras: main camera (camera 0) on CameraNode via s_Camera tracking, gun sight camera (camera 1) attached to CanonNode
15. Main loop:
    a. Process events, set elapsed time
    b. HandleEntity: Read keyboard for movement (forward/backward/turn), mouse for turret yaw and cannon pitch, mouse click for shooting
    c. ShootBullet: Clean up expired bullets (>10 seconds), free entities and effects
    d. CameraTrack: Smooth camera following using tightness factor interpolation
    e. Update gun sight camera look-at
    f. Render and flip
16. Exit on Escape
## Important Notes
- No EnableExplicit - uses implicit variables
- Complex node hierarchy for tank parts with parent-child relationships
- Turret rotates independently on Y axis, cannon pitches on X axis (clamped -3 to 45 degrees)
- Bullets are physics spheres with ribbon trail effects, auto-cleaned after 10 seconds
- Camera uses dual-node tracking (position node + target node) with tightness-based interpolation
- Two cameras: main follow camera and gun sight camera
- Static variables used in HandleEntity for persistent state between calls
- Normalize procedure for vector normalization
