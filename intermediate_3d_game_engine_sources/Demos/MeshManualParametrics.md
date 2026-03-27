# MeshManualParametrics.pb - Intermediate Description
## Purpose
Demonstrates dynamic parametric mesh generation using superquadric equations. Allows real-time modification of superquadric parameters (epsilon1, epsilon2) via keyboard, with optional wireframe/solid rendering and vertex coloring.
## Type
3D Engine Demo (complex game demo)
## Compiler Flags
None (GUI app with windowed screen)
## Structure
- Constants: #Color=#True, #TwoPi=2*PI, #CameraSpeed=1, #Scale=20, #Delta=1.0/10.0
- Globals: Epsilon1=1.0, Epsilon2=1.0
- Macros: Vertex (generates vertex position and optional color), SuperCos/SuperSin (signed power functions), Text3D (creates 3D text with node), Convert2DTo3D (screen to world coordinate conversion)
## Key Libraries/Functions
- Engine3D: InitEngine3D, CreateEntity
- Manual Mesh: CreateMesh (#PB_Mesh_TriangleList, #PB_Mesh_Dynamic), UpdateMesh, FinishMesh, MeshVertexPosition, MeshVertexColor, MeshFace, VertexIndex
- Materials: CreateMaterial, LoadTexture, DisableMaterialLighting, MaterialShadingMode (#PB_Material_Wireframe, #PB_Material_Solid)
- Text3D: CreateText3D, Text3DColor, Text3DAlignment, Text3DCaption, ScaleText3D
- Node: CreateNode, AttachNodeObject, ScaleNode, RotateNode
- Camera: CreateCamera, MoveCamera, CameraFOV, CameraLookAt, CameraBackColor, PointPick, CameraViewWidth/Height
## Input/Output
- Input: Keyboard (Left/Right adjusts Epsilon2, Up/Down adjusts Epsilon1, F2 wireframe, F3 solid, Escape to quit), Mouse (look around)
- Output: 3D scene with rotating superquadric shape, FPS display, instruction text
- Data: Textures (White.jpg), fonts, Scripts
## Logic Flow
1. Define superquadric math procedures (CalculateX/Y/Z, CalculateNX/NY/NZ using SuperCos/SuperSin macros)
2. Initialize engine, sprites, keyboard, mouse
3. Open window (80% desktop) and windowed screen
4. Add archives (Textures, fonts, Scripts), parse scripts
5. Create initial superquadric mesh, create wireframe material, attach to scaled/rotating node
6. Create camera, lights (two colored), ambient color
7. Create 3D text elements (FPS counter, title, instructions) positioned via Convert2DTo3D macro
8. Main loop:
   a. Process window events, mouse input
   b. Handle keyboard: F2/F3 for rendering mode, arrows adjust epsilon values
   c. UpdateSuperQuadratics(): Rebuild mesh with current epsilon values
   d. Rotate node, update FPS text
   e. Render and flip
9. Exit on Escape
## Important Notes
- No EnableExplicit - uses implicit variables (Centre, Co, VertexIndex, Quit, dx, dy)
- Superquadric equation uses Pow with Abs and Sign for signed power function
- The mesh is fully regenerated each frame via UpdateMesh/FinishMesh
- Uses .d (double precision) for calculation procedures
- VertexIndex is an implicitly declared variable incremented in SuperQuadratics() procedure
- Co is computed as #scale*8 for color scaling
- The Delta constant controls mesh tessellation density (smaller = more triangles)
- Text3D macro combines CreateText3D, node creation, and scaling
