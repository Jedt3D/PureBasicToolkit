# ThirdPerson.pb - Intermediate Description
## Purpose
Demonstrates third-person character control with a robot character navigating a 3D world. Features physics-based movement, jumping, stair climbing, smooth camera tracking, and a destructible environment with dynamic and static objects.
## Type
3D Engine Demo (complex game demo)
## Compiler Flags
None (GUI app with windowed screen)
## Structure
- `s_Key`: Key bindings (Up, Down, Left, Right, StrafeLeft, StrafeRight, Jump)
- `s_Entity`: Entity, EntityBody, BodyOffsetY, elapsedTime, key bindings, nodes (MainNode, SightNode, CameraNode, ForwardNode, StrafeNode)
- `s_Camera`: Camera ID, Tightness factor, CameraNode, TargetNode
- Constants: #PlayerSpeed=60*2, #CameraSpeed=10
## Key Libraries/Functions
- Engine3D: CreateEntity, MoveEntity, RotateEntity, EntityX/Y/Z/Yaw, CreateEntityBody, HideEntity
- Physics: #PB_Entity_CapsuleBody, #PB_Entity_StaticBody, #PB_Entity_BoxBody, RayCollide
- Node: CreateNode, AttachNodeObject, MoveNode, RotateNode, NodeX/Y/Z
- Animation: StartEntityAnimation, StopEntityAnimation, AddEntityAnimationTime, EntityAnimationStatus
- Mesh: LoadMesh, CreatePlane, CreateCube
- Camera: CreateCamera, CameraLookAt
- Materials: CreateMaterial, LoadTexture, GetScriptMaterial, MaterialFilteringMode
## Input/Output
- Input: Keyboard (arrows for movement, X/C for strafe, Space for jump, F5-F7 debug, Escape to quit)
- Output: 3D world with robot character, stairs (spiral and straight), dynamic/static objects, fog, skybox
- Data: Textures (r2skin.jpg, Dirt.jpg, Wood.jpg), Models (robot.mesh), Scripts, desert.zip
## Logic Flow
1. Define structures, declare procedures
2. Initialize engine, sprites, keyboard, mouse
3. Open window and screen (80% desktop)
4. Add archives (Textures, Models, Scripts, GUI, desert.zip), parse scripts
5. Create textures (procedural blue grid pattern)
6. Create materials (robot skin, grid, dirt, wood, ground blend)
7. Load robot mesh, create visible entity (0) and hidden physics body entity (1) offset above ground
8. Create large ground plane (5000x5000) with static body
9. Create physics bodies (capsule for robot body, static for ground)
10. Create cube mesh for objects
11. AddObjects: Scatter 100+ random dynamic/static box entities
12. Build spiral staircase (MakeColimacon) and straight staircase (MakeStair) with pyramid on platform
13. Create light, ambient color, fog, skybox
14. Setup robot node hierarchy:
    - MainNode -> SightNode, CameraNode, ForwardNode, StrafeNode
    - Attach visible entity to MainNode
15. Setup camera with dual-node tracking (position + target)
16. Main loop:
    a. Process events, update elapsed time
    b. HandleEntity: Movement (forward, backward, strafe, turning), jump physics, stair detection
    c. CameraTrack: Smooth camera interpolation
    d. Render and flip
17. Exit on Escape
## Important Notes
- No EnableExplicit - uses implicit variables (Volume, j, i, Quit, dx, dy, TimeSinceLastFrame)
- Robot uses separate visible entity (0) and physics capsule body entity (1)
- BodyOffsetY compensates for physics body offset from visible mesh
- IsStair procedure uses dual raycasts to detect step edges
- Jump physics: acceleration up, gravity down, ground detection via RayCollide
- Stair auto-climb: when stairs detected and moving, automatic upward boost
- RotateNode for MainNode uses 2 parameters (0, yaw) which means absolute rotation
- MakeColimacon creates spiral staircase with 30-degree angle steps
- Camera tightness of 0.035 gives very smooth, slow-following camera
