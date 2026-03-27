# AttachEntityObject2.pb - Intermediate Description

## Purpose
Extended demonstration of AttachEntityObject() showing attachment of various 3D object types to a robot's bone joints: entities (spheres), particle emitters, billboard groups, and lights. Supports detaching multiple objects with Space and reattaching with Return.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Uses fixed numeric IDs (not #PB_Any for most resources).

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), Parse3DScripts(), CreateMaterial(), SetMaterialColor(), GetScriptMaterial(), CreateBillboardGroup(), AddBillboard(), GetScriptParticleEmitter(), CreatePlane(), LoadMesh(), CreateSphere(), CreateEntity(), AttachEntityObject(), DetachEntityObject(), EntityRenderMode(), MoveEntity(), RotateEntity(), StartEntityAnimation(), StopEntityAnimation(), EntityAnimationStatus(), AddEntityAnimationTime(), CreateCamera(), MoveCamera(), CameraLookAt(), CreateLight(), SetLightColor(), LightAttenuation(), AmbientColor(), RenderWorld()

## Input/Output
- Loads: PureBasic.bmp, r2skin.jpg, Dirt.jpg, robot.mesh, Color/Red & Color/Green scripts, Examples/PurpleFountain & Examples/JetEngine1 particle scripts, desert skybox pack
- Displays: Robot with spheres, particles, billboard, and lights attached to its joints

## Logic Flow
1. Define float vars for input, Speed=1.0, RobotMove flag
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add archives including particles directory; parse scripts
5. Create billboard material (PureBasic.bmp with self-illumination), create billboard group with one billboard
6. Get red/green script materials, create r2skin material with self-illumination
7. Get particle emitters from scripts (PurpleFountain at ID 0, JetEngine1 as #PB_Any)
8. Create ground (dirt plane), load robot mesh, create sphere mesh
9. Create entities: ground, robot (material 3), red sphere (material 1), green sphere (material 2)
10. Create camera looking at robot, two lights with specular and attenuation
11. Attach to robot joints: red sphere to Joint18, green sphere to Joint15, particle 0 to Joint15, jet to Joint18, billboard to Joint1, lights to Joint18 and Joint15
12. Main loop:
    - Space: detach red sphere, billboard, light 1, jet particle
    - Return: reattach those objects
    - Arrow keys: move robot with animation (manual mode)
    - Camera follows robot with CameraLookAt
    - RenderWorld with speed-scaled TimeSinceLastFrame
13. Exit on Escape

## Important Notes
- Uses fixed IDs (0, 1, 2, 3) for most resources, #PB_Any only for jet particle emitter
- Multiple object types attached: EntityID(), ParticleEmitterID(), BillboardGroupID(), LightID()
- Self-illumination color set on materials for visibility
