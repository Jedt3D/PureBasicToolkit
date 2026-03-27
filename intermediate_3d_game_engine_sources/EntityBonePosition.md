# EntityBonePosition.pb - Intermediate Description
## Purpose
Demonstrates EntityBoneX/Y/Z functions to track bone positions on an animated robot mesh. Two colored spheres follow specific bones (hands) as the robot walks.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
Uses built-in Vector3 structure. Macros: GetBonePosition (gets bone XYZ), SubVector3 (subtracts vectors).
## Key Libraries/Functions
- EntityBoneX(), EntityBoneY(), EntityBoneZ() - get bone world positions with offsets
- Define.Vector3 for bone position variables
- MoveEntity() with #PB_Absolute to position spheres at bone locations
- GetScriptMaterial() for Color/Red and Color/Green materials
- CreateSphere() for tracking spheres
- EntityAnimationStatus(), StartEntityAnimation(), StopEntityAnimation(), AddEntityAnimationTime()
## Input/Output
- Loads: Dirt.jpg, robot.mesh, desert07.jpg, script materials
- Displays: Robot with red and green spheres tracking hand bones
- Controls: Arrow keys move robot, PageUp/PageDown speed, Mouse camera, Esc quit
## Logic Flow
1. Define variables including Vector3 Bone1, Bone2
2. Define macros for bone position and vector subtraction
3. Initialize subsystems, open window/screen
4. Add archives, parse scripts, set shadows
5. Get red and green script materials
6. Create ground plane, load robot mesh and sphere mesh
7. Create robot entity and two sphere entities with colored materials
8. Create skybox, camera, light
9. Main loop:
   a. Process events, mouse/keyboard input
   b. Move robot with arrow keys, track RobotMove state
   c. Start/stop Walk animation based on movement
   d. Advance animation time
   e. Get bone positions: Joint18 with offset (10,-8,-5) and Joint15 with offset (10,-8,0)
   f. Move spheres to bone positions using #PB_Absolute
   g. Rotate/move camera, render, flip
10. Exit on Escape
## Important Notes
- Bone names are "Joint18" and "Joint15" (specific to robot.mesh skeleton)
- EntityBoneX/Y/Z take entity, bone name, and XYZ offset parameters
- RollZ used in RotateCamera but never assigned (defaults to 0)
- Spheres are radius 10 (CreateSphere(2, 10))
