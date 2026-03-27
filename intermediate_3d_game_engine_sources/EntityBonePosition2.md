# EntityBonePosition2.pb - Intermediate Description
## Purpose
Demonstrates EntityBoneX/Y/Z for a robot shooting system. Robot performs "Shoot" animation and spawns bullet entities from hand bone positions. Bullets are physics-enabled spheres that fly in the direction the robot faces.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
Structure Bullet { Bullet.i, timer.f, Speed.f, Life.l }. Global NewList Bullets.Bullet(). Macros: GetBonePosition, SubVector3.
## Key Libraries/Functions
- EntityBoneX/Y/Z for bone tracking
- CreateEntityBody() with #PB_Entity_SphereBody for bullet physics
- ApplyEntityImpulse() to launch bullets
- GetEntityAnimationTime(), SetEntityAnimationTime() for animation timing
- ElapsedMilliseconds() for shoot cooldown and bullet lifetime
- IsEntity(), FreeEntity() for bullet cleanup
- Normalize() custom procedure for direction vectors
- KeyboardMode(#PB_Keyboard_International)
## Input/Output
- Loads: Dirt.jpg, robot.mesh, desert07.jpg, script materials
- Displays: Robot that shoots ring patterns of bullets from hand
- Controls: Q/S/D/Z rotate robot, arrows move camera, PageUp/PageDown speed, Esc quit
## Logic Flow
1. Define Bullet structure, variables, declare procedures
2. Initialize subsystems, open window/screen
3. Add archives, parse scripts, set keyboard international mode
4. Set shadows, get script materials, create ground/robot/sphere mesh
5. Main loop:
   a. Process events, read mouse/keyboard
   b. Rotate robot with Q/S/D/Z keys, track RobotMove state
   c. Start/stop "Shoot" animation based on movement
   d. Advance animation time
   e. Check animation time window (280-310) with 500ms cooldown to call AddShoot()
   f. Call Shootbullet() to manage bullet lifetime
   g. Camera controls, render, flip
6. AddShoot: Gets Joint17/Joint18 positions, calculates direction, creates 8 bullets in ring pattern (0-315 deg step 45), applies physics impulse
7. Shootbullet: Iterates bullet list, frees entities older than 3 seconds
8. Normalize: Normalizes Vector3 in place
## Important Notes
- Uses Q/S/D/Z keys (AZERTY layout) for robot rotation
- Bullets spawn in a ring pattern (8 bullets per shot, 45 degree increments)
- Bullet positioning differs based on robot yaw (90/-90 vs other angles)
- 500ms cooldown between shots, 3 second bullet lifetime
- #CameraSpeed = 2 for camera movement
