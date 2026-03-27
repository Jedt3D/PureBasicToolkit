# NodeAnimation.pb - Intermediate Description
## Purpose
Demonstrates using NodeAnimation with spline interpolation to make a camera node smoothly follow a predefined path around a barrel entity. The camera orbits along keyframed positions with smooth spline-based movement.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Variables: Duration (float, 10000), Time (float, Duration/4), NodeAnimation, TimeSinceLastFrame
- Forward declaration: AddPath(NodeAnimation) - declared but never defined/used
## Key Libraries/Functions
- Engine3D: InitEngine3D, CreateNode, AttachNodeObject, NodeID, CameraID
- NodeAnimation: CreateNodeAnimation, CreateNodeAnimationKeyFrame, StartNodeAnimation, AddNodeAnimationTime
- Mesh: LoadMesh, MeshID
- Entity: CreateEntity, EntityX, EntityY, EntityZ
- Camera: CreateCamera, CameraLookAt
- Scene: SkyBox, AmbientColor, CreateLight, RenderWorld, Add3DArchive, Parse3DScripts
- Constants: #PB_NodeAnimation_Spline, #PB_NodeAnimation_LinearRotation, #PB_3DArchive_Zip, #PB_Material_None, #PB_Any
## Input/Output
- Loads: Barrel.mesh model, desert07.jpg skybox
- Displays: Camera animating along a spline path around a barrel
- Controls: Esc to quit
## Logic Flow
1. Declare forward reference AddPath (unused)
2. Initialize engine, sprite, keyboard, mouse
3. Open windowed screen
4. Add 3D archives (data, textures, models, scripts, desert pack)
5. Parse 3D scripts
6. Create barrel entity (mesh #1, material none, scaled 9x)
7. Create camera, create node, attach camera to node
8. Set up lighting and skybox
9. Create node animation with 5 keyframes and spline interpolation
10. Start the node animation
11. Main loop: advance animation time, camera looks at barrel, render
12. Exit on Escape
## Important Notes
- The Declare AddPath is present but never used/defined in this file
- TimeSinceLastFrame is returned by RenderWorld()
- Uses #PB_Any for CreateNodeAnimation
- Camera follows barrel by calling CameraLookAt each frame
