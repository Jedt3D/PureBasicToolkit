# VertexAnimation.pb - Intermediate Description
## Purpose
Demonstrates vertex (morph target / shape key) animation where a mesh smoothly transitions between poses using programmatic animation control.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Constants: #Mesh = 1
- Macro: Clamp(num, min, max) - inline clamp macro
- Variables: MouseX.f, MouseY.f, Pose.f, Offset.f
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- WorldShadows() with #PB_Shadow_Modulative
- LoadMesh(), MeshPoseName() - gets pose name from mesh
- CreateVertexAnimation(), CreateVertexTrack(), CreateVertexPoseKeyFrame()
- StartEntityAnimation(), UpdateVertexPoseReference(), UpdateEntityAnimation()
- CreateEntity(), ScaleEntity(), EntityX/Y/Z()
- CreateMaterial(), LoadTexture(), CreatePlane()
- CreateCamera(), MoveCamera(), CameraLookAt()
- CreateLight(), AmbientColor()
- SkyBox()
- RotateCamera(), RenderWorld(), FlipBuffers()
## Input/Output
- Loads: Shapekey.mesh model, Dirt.jpg texture, desert pack
- Displays: Animated mesh morphing between poses with auto-oscillation
## Logic Flow
1. Initialize engine, create windowed screen
2. Add archives, parse scripts, enable modulative shadows
3. Create ground plane with dirt texture
4. Load Shapekey.mesh, get pose name from mesh at index 0
5. Create vertex animation, track, and pose keyframe
6. Create entity from mesh, scale 3x, start animation
7. Set skybox, create camera looking at entity, create light
8. Main loop:
   - Examine keyboard, mouse
   - Auto-oscillate Pose between 0 and 1 using Offset
   - UpdateVertexPoseReference sets current pose weight
   - UpdateEntityAnimation applies the changes
   - Mouse rotates camera
   - Render and flip
## Important Notes
- CreateVertexAnimation/Track/KeyFrame creates animation infrastructure
- UpdateVertexPoseReference controls the morph weight (0-1)
- UpdateEntityAnimation must be called to apply pose changes
- Pose auto-oscillates using Offset that flips at boundaries
- Clamp is a macro (not procedure) for inline value clamping
- MeshPoseName gets the name of vertex poses embedded in the mesh
