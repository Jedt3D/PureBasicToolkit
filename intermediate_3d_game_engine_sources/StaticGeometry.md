# StaticGeometry.pb - Intermediate Description
## Purpose
Demonstrates static geometry optimization where many cube instances are batched into a single static geometry object for efficient rendering, creating a cityscape with random-height buildings and a moving sun.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Variables: KeyX.f, KeyY.f, MouseX.f, MouseY.f, nx.f, nz.f, Boost.f=10, Yaw.f, Pitch.f
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- WorldShadows() with #PB_Shadow_Additive
- AmbientColor()
- CreateNode(), AttachNodeObject(), MoveNode()
- CreateLight(), LightID()
- GetScriptMaterial(), CreateBillboardGroup(), AddBillboard(), BillboardGroupID()
- CreateCube(), CreateEntity()
- CreateStaticGeometry(), AddStaticGeometryEntity(), BuildStaticGeometry()
- FreeEntity()
- CreateCamera(), MoveCamera(), CameraLookAt(), CameraFOV(), CameraBackColor()
- ElapsedMilliseconds(), Cos(), Sin()
- RotateCamera(), RenderWorld(), FlipBuffers()
## Input/Output
- Loads: Script materials (Scene/burst)
- Displays: Grid of 21x21 ground tiles with random-height buildings, orbiting sun with lens flare
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window and windowed screen
3. Add archives and parse scripts, enable additive shadows
4. Set ambient color to black
5. Create node at (0,3000,0) for sun
6. Create light at same position, attach to node
7. Create billboard group with burst material for sun flare, attach to node
8. Create a single cube entity as template
9. Create static geometry container with 1000x1000x1000 regions
10. Loop -10 to 10 in x and z: add ground tiles and random-height buildings to static geometry
11. Build static geometry, free template entity
12. Create camera at (2000,2000,2000) looking at origin with 90-degree FOV
13. Main loop: handle input, move camera with arrow keys and mouse
14. Animate sun position using Cos/Sin with ElapsedMilliseconds
15. Render and flip until Escape or Quit
## Important Notes
- Static geometry is much more efficient than individual entities for many identical meshes
- Template entity is freed after building static geometry
- Sun orbits using trigonometric functions based on elapsed time
- Random(800) creates varied building heights
