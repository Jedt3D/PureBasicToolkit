# Bridge.pb - Intermediate Description

## Purpose
Demonstrates PointJoint() physics to create a rope bridge made of planks connected by point joints. Spheres and cubes are dropped on the bridge. Space applies impulse, Return removes planks one by one.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Constants:
- `#CameraSpeed = 1`
- `#NbPlanks = 30`
- `#EndDistance = 1024*4`
Array: `Dim Plank(#NbPlanks)`

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), Parse3DScripts(), CreateMaterial(), GetScriptMaterial(), CreateCube(), CreateSphere(), CreatePlane(), CreateEntity(), ScaleEntity(), CreateEntityBody(), PointJoint(), ApplyEntityImpulse(), DisableEntityBody(), FreeEntityJoints(), EntityRenderMode(), CreateCamera(), MoveCamera(), CameraLookAt(), RotateCamera(), CreateLight(), AmbientColor(), WorldGravity(), SkyDome(), CreateWater(), RenderWorld()

## Input/Output
- Loads: Wood.jpg, Dirt.jpg, sky.png, waternormal.png, foam.png, SphereMap/SphereMappedRustySteel script, Scene/GroundBlend script, desert.zip pack
- Displays: A rope bridge over water with objects falling on it, desert sky dome

## Logic Flow
1. Define constants, input variables, Plank array
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add archives; parse scripts
5. Create materials: wood, rusty steel (script), dirt, ground blend (script)
6. Create cube mesh; loop to create 30 plank entities, scale and position, add box bodies
7. Create point joints connecting planks on both sides (-5 and +5 on Z):
   - First plank anchored to world
   - Each plank connected to previous with point joints
   - Last plank anchored to world
8. Create sphere mesh; drop spheres and cubes onto bridge from above
9. Create camera looking at bridge
10. Create sky dome, water surface with normal and foam textures
11. Create ground plane below water, light, set gravity to -20
12. Main loop:
    - Space: apply upward impulse to middle plank
    - Return: disable body and free joints of planks sequentially
    - Arrow keys for camera movement
    - RenderWorld, FlipBuffers
13. Exit on Escape or right mouse button

## Important Notes
- Pas.f = 1.5 is the joint offset from plank center
- Bridge has joints on both sides (Z=-5 and Z=+5) for stability
- WorldGravity(-20) for stronger gravity effect
- CreateWater() with normal map and foam texture for water surface
- Variable C = Plank(1) used as reference for object positioning
- `toto` is an unused variable holding last joint ID (typical of example code)
- Plank variable reused (first as array, then as counter integer) - needs careful handling
