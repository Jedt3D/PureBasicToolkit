# TerrainPhysic.pb - Intermediate Description
## Purpose
Demonstrates terrain with physics simulation. A robot character walks on terrain with proper physics collision, and physics objects (spheres, cylinders, cubes) are scattered on the terrain.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- s_Key: Up, Down, Left, Right, StrafeLeft, StrafeRight, Jump (all .i)
- s_Entity: Entity.i, EntityBody.i, BodyOffsetY.f, elapsedTime.f, Key.s_Key, MainNode/SightNode/CameraNode/ForwardNode/StrafeNode (all .i)
- s_Camera: Camera.i, Tightness.f, CameraNode.i, TargetNode.i
- Constants: #TerrainMiniX/Y=0, #TerrainMaxiX/Y=0, #PlayerSpeed=60, #CameraSpeed=10
- Macros: GetNodePosition, SubVector3
- Procedures: HandleEntity(), CameraTrack(), OnGround(), Clamp(), InitBlendMaps()
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- SetupTerrains(), CreateTerrain(), BuildTerrain(), CreateTerrainBody()
- TerrainRenderMode()
- CreateEntityBody() with #PB_Entity_CapsuleBody, SphereBody, CylinderBody, BoxBody
- MoveEntity(), RotateEntity(), EntityX/Y/Z(), EntityYaw()
- CreateNode(#PB_Any), AttachNodeObject(), MoveNode(), RotateNode(), NodeX/Y/Z()
- RayCollide(), PickY()
- StartEntityAnimation()
- WorldDebug() with #PB_World_DebugBody, DebugEntity, DebugNone
- WorldShadows(), GetScriptMaterial()
- CameraLookAt()
- RenderWorld(60) with frame rate parameter
## Input/Output
- Loads: Terrain textures, robot.mesh, r2skin.jpg, various material textures
- Displays: Terrain with physics-enabled robot character and scattered physics objects
- Controls: Arrow keys move robot, X/C strafe, Space jump, F5/F6/F7 debug modes
## Logic Flow
1. Initialize engine, create windowed screen
2. Setup terrain with physics body (CreateTerrainBody)
3. Create robot entity with capsule body for physics
4. Setup node hierarchy: MainNode with SightNode, CameraNode, ForwardNode, StrafeNode
5. Setup camera with tightness-based smooth following
6. Create random physics objects (spheres, cylinders, cubes)
7. Main loop:
   - HandleEntity: read input, compute forward/strafe vectors from nodes
   - Apply movement, rotation, jumping with ground detection
   - CameraTrack: smooth camera follow using tightness interpolation
   - RenderWorld with 60fps target
8. OnGround uses RayCollide for ground detection
## Important Notes
- Uses Vector3 structure (built-in) for position math
- Node hierarchy provides direction vectors relative to entity orientation
- CameraTrack uses tightness-based interpolation for smooth following
- RayCollide used for ground detection with delta comparison
- Robot has a hidden body entity offset from visual entity
