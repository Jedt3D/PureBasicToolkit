# PinBall.pb - Intermediate Description
## Purpose
Demonstrates a pinball game using the Bullet physics engine. Features a ball, flippers controlled by keyboard, bumpers, and boundary walls. The ball is constrained to 2D movement with physics impulses and hinge joints for flipper control.
## Type
3D Engine Demo (complex game demo)
## Compiler Flags
None (GUI app with windowed screen)
## Structure
- Macros: CreateCadre (creates scaled box entity with physics body), CreateBumper (creates cylinder entity with physics body)
- Constants: #CameraSpeed=1
- Define variables: KeyX, KeyY, MouseX, MouseY, Angle=145
## Key Libraries/Functions
- Engine3D: InitEngine3D, CreateEntity, ScaleEntity, RotateEntity, MoveEntity, EntityZ, CreateEntityBody, ApplyEntityImpulse, EntityLinearFactor, SetEntityAttribute (#PB_Entity_MaxVelocity), EntityRenderMode
- Physics: HingeJoint, EnableHingeJointAngularMotor, HingeJointMotorTarget, DisableEntityBody
- Mesh: CreatePlane, CreateCube, CreateSphere, CreateCylinder
- Materials: CreateMaterial, LoadTexture, GetScriptMaterial
- Camera: CreateCamera, MoveCamera, CameraFOV, CameraLookAt
- Shadows: WorldShadows (#PB_Shadow_Modulative)
## Input/Output
- Input: Keyboard (LeftShift/LeftControl for left flipper, RightShift/RightControl for right flipper, Space for impulse, Escape to quit)
- Output: 3D pinball table viewed from above with ball, flippers, bumpers, and walls
- Data: Main, Textures (Wood.jpg, Caisse.png), Scripts, desert.zip
## Logic Flow
1. Initialize engine, sprites, keyboard, mouse
2. Open window (80% desktop) and windowed screen
3. Add archives, parse scripts
4. Enable modulative shadows
5. Create materials (wood, sphere-mapped rusty steel, blue color, ground blend)
6. Create ground plane with static body, disable shadow for ground
7. Create meshes (cube, sphere, cylinder)
8. Create ball entity (sphere) with sphere body, constrain to XZ plane via EntityLinearFactor(1,0,1)
9. Create boundary walls (Cadre) using macros with various positions, rotations, and physics settings
10. Create 3 bumpers (cylinders) with high restitution
11. Create left and right flippers:
    a. Each is a scaled box entity with box body
    b. Connected to ground via HingeJoint on Y axis
    c. Angular motor enabled for automatic return
12. Create camera (overhead view), skybox, light
13. Main loop:
    a. Process events, examine mouse/keyboard
    b. Left flipper: LeftShift/LeftControl triggers motor target one way, release triggers return
    c. Right flipper: RightShift/RightControl triggers motor target, release returns
    d. Space applies downward impulse to ball
    e. If ball goes beyond Z=50, reset to start position
    f. Apply constant slight upward impulse (0.1), cap velocity
    g. Render (40ms timestep) and flip
14. Exit on Escape
## Important Notes
- No EnableExplicit - uses implicit variables (Cadre, Cylinder, Sphere, FlipL, FlipR, Quit, dx, dy)
- EntityLinearFactor constrains ball to XZ plane (no vertical movement)
- HingeJointMotorTarget used for smooth flipper rotation
- RenderWorld(40) specifies fixed physics timestep
- Ball reset when it falls off the bottom (EntityZ > 50)
- Constant upward force (ApplyEntityImpulse(Sphere, 0, 0, 0.1)) simulates table tilt
- DisableEntityBody used to wake up flipper when activated
