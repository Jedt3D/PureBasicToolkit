# Pendulum.pb - Intermediate Description
## Purpose
Simulates a pendulum wave experiment using physics engine. 16 pendulums of varying string lengths are attached to a support bar via PointJoint constraints. Each pendulum has a slightly different period, creating mesmerizing wave patterns.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Constants: #NBPENDULUM=16
- Global arrays: sph.i(#NBPENDULUM+1)
- Global variables: position.f, stringLength.f
- Local variables: sol, support, support2-5 (entity IDs via #PB_Any), KeyX, KeyY, keyz, dist, MouseX, MouseY (float), i
## Key Libraries/Functions
- Physics: CreateEntityBody, PointJoint, ApplyEntityImpulse
- Entity: CreateEntity, ScaleEntity, RotateEntity, MoveEntity, EntityX, EntityY, EntityZ
- Mesh: CreatePlane, CreateCube, CreateSphere, MeshID
- Material: CreateMaterial, LoadTexture, TextureID, MaterialID, MaterialShininess
- Line3D: CreateLine3D
- Node: (none directly - uses PointJoint for connections)
- Camera: CreateCamera, MoveCamera, CameraLookAt, RotateCamera
- Scene: WorldShadows, AmbientColor, CreateLight, RenderWorld, Parse3DScripts
- Math: Pow (for pendulum length calculation)
## Input/Output
- Loads: Wood.jpg texture
- Displays: 16 pendulums swinging in wave patterns under a wooden support structure
- Controls: Arrow keys move camera, mouse rotates camera, mouse wheel zooms, Esc quits
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen
3. Add archives and parse scripts; enable additive shadows
4. Create materials: wood material, gold-colored material for spheres, wood material variant for supports
5. Create ground plane
6. Create support structure: horizontal bar and 4 angled legs
7. For each pendulum (1 to 16):
   a. Calculate string length using physics formula: L = 980.6 * (15 / (2*pi*(24+i)))^2
   b. Calculate horizontal position
   c. Create sphere entity, position it, add sphere body
   d. Create PointJoint attaching sphere to support
   e. Create Line3D for visual string
   f. Apply initial impulse to start swinging
8. Set up camera and lighting
9. Main loop: handle mouse/keyboard input, redraw string lines each frame, render
10. Exit on Escape
## Important Notes
- The pendulum length formula creates different periods for each pendulum
- PointJoint connects entities with a fixed point constraint
- Line3D must be recreated each frame to update visual strings
- Uses Bool() for conditional key input
- MouseWheel() provides zoom control
- The variable 'dist' uses smoothing: dist+(keyz-dist)*0.1
- keyy variable is used but never assigned a nonzero value
