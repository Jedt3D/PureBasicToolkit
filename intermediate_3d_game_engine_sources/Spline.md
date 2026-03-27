# Spline.pb - Intermediate Description
## Purpose
Demonstrates spline-based path following where a robot smoothly follows a predefined spline path through checkpoints, and a ninja follows a dynamic spline that updates each frame.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Variables: Time.f, TimeN.f, pas.f = 1, x.f, y.f, z.f, TimeSinceLastFrame.f
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- WorldShadows() with #PB_Shadow_Modulative
- CreateMaterial(), LoadTexture(), CreatePlane(), CreateCylinder()
- CreateEntity(), ScaleEntity(), LoadMesh()
- StartEntityAnimation(), AddEntityAnimationTime() with #PB_EntityAnimation_Manual
- EntityLookAt(), MoveEntity()
- CreateCamera(), MoveCamera(), CameraFOV(), CameraBackColor(), CameraLookAt()
- AmbientColor(), CreateLight()
- CreateSpline(#PB_Any), AddSplinePoint(), ComputeSpline()
- SplineX(), SplineY(), SplineZ(), UpdateSplinePoint()
- EntityX(), EntityY(), EntityZ()
- RenderWorld(), FlipBuffers()
## Input/Output
- Loads: Dirt.jpg texture, robot.mesh, ninja.mesh models
- Displays: Ground plane, cylinder checkpoints, robot following spline path, ninja tracking robot
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window and windowed screen
3. Add archives and parse scripts, enable modulative shadows
4. Create ground plane with dirt texture
5. Create cylinder checkpoints at 5 positions
6. Load robot mesh, create entity, start Walk animation
7. Load ninja mesh, create entity, start Walk animation (manual mode)
8. Create camera with narrow FOV looking down at scene
9. Create light with low ambient color
10. Create robot spline with 7 points through checkpoints (cyclic path)
11. Create ninja spline with 2 points (ninja position to robot position)
12. Main loop:
    - Compute robot spline at current time, move robot along path
    - Increment time, reset when > 1
    - Compute ninja spline, move ninja toward robot
    - Update ninja animation time manually
    - Update ninja spline endpoints to current positions
    - RenderWorld returns TimeSinceLastFrame
13. Exit on Escape
## Important Notes
- ComputeSpline must be called before SplineX/Y/Z
- Ninja uses manual animation with AddEntityAnimationTime
- UpdateSplinePoint dynamically changes spline endpoints for the ninja
- RenderWorld() return value is used as time delta (divided by 1000)
- EntityLookAt with extra parameters (1,0,0) for robot orientation
