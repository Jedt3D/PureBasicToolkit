# MeshManualFlag.pb - Intermediate Description
## Purpose
Demonstrates dynamic mesh manipulation by creating a waving flag effect. Uses manual mesh creation and real-time vertex position updates to animate a sinusoidal wave across a grid mesh.
## Type
3D Engine Demo (complex game demo)
## Compiler Flags
None (GUI app with windowed screen)
## Structure
- Constants: #CameraSpeed=1, #NbX=30, #NbZ=30
- Globals: AngleVague, WaveFrequency=3, WavePeriodX=9, WavePeriodZ=11, WaveAmplitude=3 (all floats)
## Key Libraries/Functions
- Engine3D: InitEngine3D
- Manual Mesh: CreateMesh (#PB_Mesh_TriangleList, #PB_Mesh_Dynamic), UpdateMesh, FinishMesh, MeshVertexPosition, MeshVertexNormal, MeshVertexTextureCoordinate, MeshFace, SetMeshMaterial
- Materials: GetScriptMaterial ("Scene/GroundBlend"), MaterialCullingMode
- Node: CreateNode, AttachNodeObject, ScaleNode
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor, RotateCamera
- SkyBox, AmbientColor, CreateLight
## Input/Output
- Input: Keyboard (arrow keys for camera movement, Escape to quit), Mouse (look around)
- Output: 3D scene with animated waving flag mesh, skybox background
- Data: Textures directory, skybox.zip, Scripts directory
## Logic Flow
1. Define wave parameters as globals
2. Initialize engine, sprites, keyboard, mouse
3. Open window (80% desktop) and windowed screen
4. Add archives (Textures, skybox.zip, Scripts), parse scripts
5. Get script material "Scene/GroundBlend" with back-face culling
6. CreateMatrix(): Create dynamic mesh with triangle list, call DrawMatrix() to generate vertices and faces, finish mesh, set material, attach to scaled node
7. Create camera, light, ambient color, skybox
8. Main loop:
   a. Process window events
   b. Handle keyboard/mouse for camera movement
   c. UpdateMatrix(): Call UpdateMesh to begin update, redraw vertices with new wave positions, finish mesh
   d. Increment wave angle
   e. Render and flip
9. Exit on Escape
## Important Notes
- No EnableExplicit - uses implicit variables (y, Quit, dx, dy)
- DrawMatrix procedure creates a grid of (NbX+1)*(NbZ+1) vertices with sinusoidal Y displacement
- Face indices are computed from grid positions (P1,P2,P3,P4 pattern)
- Mesh is created as #PB_Mesh_Dynamic for efficient updates
- UpdateMesh(0, 0) resets vertex/face data for re-uploading
- The wave equation: y = Sin(Radian(AngleVague + a*WavePeriodX + b*WavePeriodZ)) * WaveAmplitude
- Node scaling (2,2,2) doubles the visible size
