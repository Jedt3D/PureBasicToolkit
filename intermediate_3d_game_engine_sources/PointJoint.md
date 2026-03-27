# PointJoint.pb - Intermediate Description
## Purpose
Demonstrates PointJoint physics constraints. Three objects (two cubes and a sphere) are chained together via point joints hanging from a static platform. Pressing Space breaks the middle joint, causing the lower objects to fall freely.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Constants: #CameraSpeed=1
- Variables: KeyX, KeyY, MouseX, MouseY (float), i, Quit
## Key Libraries/Functions
- Physics: CreateEntityBody, PointJoint, FreeJoint, SetJointAttribute, ApplyEntityImpulse
- Entity: CreateEntity, ScaleEntity
- Mesh: CreateCube, CreateSphere, MeshID
- Material: CreateMaterial, LoadTexture, TextureID, MaterialID
- Camera: CreateCamera, MoveCamera, RotateCamera
- Scene: RenderWorld, Add3DArchive
- Constants: #PB_Entity_BoxBody, #PB_Entity_SphereBody, #PB_Entity_StaticBody, #PB_PointJoint_Tau, #PB_Absolute, #PB_Relative
## Input/Output
- Loads: Wood.jpg, Dirt.jpg textures, stevecube.jpg skybox
- Displays: Chain of 3 objects hanging from a platform
- Controls: Space to break middle joint, arrows/mouse for camera, Esc to quit
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen
3. Add archives for textures, models, skybox
4. Create wood and dirt materials
5. Create cube and sphere meshes
6. Create entities: two cubes at (2,0,0) and (2,-3,0), sphere at (2,-6,0), platform at (5,4,0) scaled 10x1x10
7. Create physics bodies: cubes=box body(mass 1), sphere=sphere body(mass 1), platform=static body
8. Create 3 PointJoints: platform->cube0, cube0->cube1, cube1->sphere
9. Set joint Tau attribute to 10 for all joints
10. Apply initial impulse to cube0
11. Main loop: Space key frees joint #1, camera control, render
12. Exit on Escape
## Important Notes
- PointJoint creates a ball-and-socket type constraint between two bodies
- FreeJoint(1) breaks the middle link when Space is pressed
- SetJointAttribute with #PB_PointJoint_Tau controls joint stiffness
- The platform is a static body (mass 0) that doesn't move
