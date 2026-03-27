# FPSFirstPerson.pb - Intermediate Description
## Purpose
Demonstrates a first-person shooter style game with physics. Features a robot character with first-person camera, shooting spheres with physics impulse, walking animation, barrels with physics, and a waterworld level with water shader effect.
## Type
3D Engine Demo (complex game demo)
## Compiler Flags
None (GUI app with windowed screen)
## Structure
- Dim Barrel.Vector3(2): Array of barrel offset positions
- DataSection with barrel base positions
- Procedure clamp(V.f, i.f, s.f): Clamps value between min and max
- Procedure EntityOnGround(entity): Raycasts downward to check ground collision
- Procedure main(): Main game loop encapsulated in a procedure
- Constants: #PlayerSpeed = 16
## Key Libraries/Functions
- Engine3D: InitEngine3D, CreateEntity, LoadMesh, CreateEntityBody, ApplyEntityImpulse
- Physics: WorldGravity, RayCollide, #PB_Entity_ConvexHullBody, #PB_Entity_StaticBody, #PB_Entity_SphereBody, #PB_Entity_CylinderBody
- Shader: CreateShaderMaterial, MaterialShaderTexture, #PB_Material_WaterShader
- Animation: StartEntityAnimation, StopEntityAnimation, AddEntityAnimationTime, EntityAnimationStatus
- Camera: CreateCamera, MoveCamera, RotateCamera, CameraFOV, PointPick, PickX/Y/Z
- Node: CreateNode, AttachEntityObject, AttachNodeObject
- Mesh: LoadMesh, CreateSphere, CreatePlane
- Bones: EntityBoneX/Y/Z
## Input/Output
- Input: Keyboard (arrow keys for movement, Space for jump, Escape to quit), Mouse (look around, left click shoot, right click zoom, wheel for distance)
- Output: 3D windowed screen with waterworld level, robot character, barrels, water surface
- Data: waterworld.zip, r2skin.jpg, viseur-jeux.png, RustyBarrel.png, robot.mesh, Barrel.mesh, waternormal.png
## Logic Flow
1. Define clamp procedure and barrel offset positions array
2. Initialize engine, sprites, keyboard, mouse
3. Open window (80% desktop) and windowed screen
4. Add archives (Textures, Models, Scripts, waterworld.zip), parse scripts
5. Create materials (robot skin, crosshair with alpha blend, red for bullets, barrel texture)
6. Create bullet mesh (sphere), load robot mesh and entity, load waterworld mesh and entity
7. Load barrel mesh, read barrel positions from DataSection, create 9 barrels (3 groups of 3) with cylinder bodies
8. Create camera, light, water shader material and water plane entity
9. Set world gravity (-500), create entity bodies (robot=convex hull static, ground=static)
10. Attach camera to robot via node
11. Main loop (inside main() procedure):
    a. Process window events
    b. Examine keyboard and mouse
    c. Handle shooting (left click): create sphere entity at robot bone position, apply impulse in picked direction
    d. Handle zoom (right click): adjust FOV
    e. Handle camera distance (mouse wheel)
    f. Handle mouse look (delta X/Y for rotation)
    g. Check if on ground (raycollide)
    h. Handle movement and jumping with simple physics
    i. Animate walk when moving
    j. Render and flip
12. Exit on Escape
## Important Notes
- No EnableExplicit - many implicit variables (distance, vity, vitx, vitz, OnGround, TimeSinceLastFrame, Shoot, Quit, etc.)
- Uses DataSection with Restore/Read for barrel positions
- The main() procedure contains the game loop with Static variables for state
- Water shader uses CreateShaderMaterial with #PB_Material_WaterShader
- EntityOnGround uses RayCollide for ground detection
- Camera is attached to robot entity via node system
- CreateEntity(-1,...) is used for water entity (auto-numbered)
