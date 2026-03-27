# AttachNodeObject.pb - Intermediate Description

## Purpose
Demonstrates AttachNodeObject() to attach multiple 3D objects (entities, particle emitters, billboard group, lights) to a single node, then move/rotate the node to move all attached objects together. Supports detach/reattach with Space/Return and node freeing with F5.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Uses fixed numeric IDs for most resources.

## Key Libraries/Functions
- Engine3D: InitEngine3D(3), Add3DArchive(), Parse3DScripts(), CreateNode(), AttachNodeObject(), DetachNodeObject(), FreeNode(), MoveNode(), RotateNode(), CreateMaterial(), SetMaterialColor(), GetScriptMaterial(), CreateBillboardGroup(), AddBillboard(), GetScriptParticleEmitter(), MoveParticleEmitter(), CreatePlane(), LoadMesh(), CreateSphere(), CreateEntity(), MoveEntity(), EntityRenderMode(), StartEntityAnimation(), StopEntityAnimation(), EntityAnimationStatus(), CreateCamera(), MoveCamera(), CameraLookAt(), CreateLight(), SetLightColor(), LightAttenuation(), MoveLight(), MoveBillboardGroup(), AmbientColor(), RenderWorld()

## Input/Output
- Loads: PureBasic.bmp, r2skin.jpg, Dirt.jpg, robot.mesh, Color/Red & Color/Green scripts, Examples/PurpleFountain & Examples/JetEngine1 particles, desert skybox
- Displays: Multiple objects attached to a movable node - robot, spheres, particles, billboard, lights

## Logic Flow
1. Define variables for input, Speed=1.0, RobotMove flag
2. Initialize engine with parameter 3, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add archives including particles; parse scripts
5. Create billboard material and group, get script materials, create robot skin material
6. Get particle emitters, position them
7. Create ground, load robot mesh, create sphere mesh
8. Create Node(1)
9. Create entities: ground, robot, red sphere (at 0,18,0), green sphere
10. Create camera, two lights with specular and attenuation
11. Attach all objects to node 1: robot entity, red sphere entity, both particles, billboard, both lights
12. Main loop:
    - F5: free node (debug entity position, reset entity to origin)
    - Space: detach red sphere, billboard, light 1, jet from node
    - Return: reposition objects and reattach to node
    - Arrow keys: move and rotate the node (not individual entities)
    - Robot walk animation based on movement
    - Camera follows robot via CameraLookAt
    - RenderWorld()
13. Exit on Escape

## Important Notes
- InitEngine3D(3) passes a parameter (rendering subsystem selector)
- Node-based movement moves all attached objects as a group
- FreeNode detaches all objects; Debug statements used for position output
- Range.f variable used for light attenuation
