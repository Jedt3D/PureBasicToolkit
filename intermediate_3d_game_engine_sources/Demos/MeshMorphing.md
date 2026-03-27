# MeshMorphing.pb - Intermediate Description
## Purpose
Demonstrates mesh morphing between different parametric 3D surfaces with custom GLSL shaders and dual-texture blending. Cycles through 16 different parametric shapes (torus, sphere, shell, pillow, tetrahedra, flower, etc.) with smooth cosine-interpolated transitions.
## Type
3D Engine Demo (complex game demo)
## Compiler Flags
None (GUI app with windowed screen)
## Structure
- `PB_MeshVertexV`: Mesh vertex with position(vector3), normal(vector3), tangent(vector3), u, v, color
- Global n=64, n2=n/2: Grid resolution
- Global Dim p0/p1.vector3(n,n): Source and target morph positions
- Global Dim t.PB_MeshVertexv(n,n): Vertex data array
- Timing: dt_trans=60*4 (transition frames), dt_tot=60*6 (total cycle frames)
## Key Libraries/Functions
- Engine3D: InitEngine3D, CreateEntity, RotateEntity
- Shader: CreateShader, CreateShaderMaterial, MaterialShaderTexture, MaterialShaderParameter (#PB_Shader_Float)
- Mesh: CreateDataMesh (with flags 8+2 = tangent+rebuild normals), BuildMeshTangents
- Materials: MaterialShininess, MaterialCullingMode (#PB_Material_AntiClockWiseCull), MaterialFilteringMode, ScaleMaterial, SetMaterialColor
- Textures: LoadTexture
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor, CameraRenderMode
## Input/Output
- Input: Keyboard (Space pauses morphing, F12 wireframe, Escape to quit), Mouse (right button pauses, middle button quits)
- Output: 3D scene with morphing parametric surface rendered with dual custom shaders
- Data: Dirt.jpg, soil_wall.jpg, MRAMOR6X6.jpg, Wood.jpg, DosCarte.png, RustySteel.jpg
## Logic Flow
1. Define structures and globals for mesh vertex data
2. Define ColorBlend, material creation, Mix3D (linear interpolation) procedures
3. Define mesh_morph: Interpolates between p0 and p1 arrays, creates mesh with CreateDataMesh
4. Define geometry procedure: 12 different parametric surface equations (double torus, sphere, shell, pillow, tetrahedra, flower, hollow dice, thing, drop, octahedra, berlingo, sort thing)
5. Define sample procedure: Maps 16 sample indices to geometry configurations
6. Initialize engine, sprites, keyboard, mouse
7. Open window and screen (80% desktop)
8. Add textures archive, parse scripts, load 6 textures
9. Create camera, light with specular, ambient color
10. Define GLSL vertex and fragment shader strings (per-pixel lighting with fog, dual texture blend)
11. Create shader from vertex/fragment programs
12. Initialize UV coordinates and vertex colors
13. Main loop:
    a. On cycle start (cpt=0): Copy p1 to p0, generate new random target shape in p1, randomize colors and textures, create materials with shader
    b. During transition (cpt<=dt_trans): Cosine-interpolate morph factor, update mesh, update shader blend parameter, blend colors and background
    c. Handle keyboard/mouse input
    d. Rotate entities, render, flip
    e. Increment counter modulo dt_tot
14. Exit on Escape or middle mouse
## Important Notes
- No EnableExplicit - many implicit variables
- Custom GLSL shader with vertex/fragment programs embedded as PureBasic strings
- The "%" characters in shader strings represent newlines (CreateShader convention)
- MaterialShaderParameter used to pass blend factor to fragment shader
- CreateDataMesh with flags 8+2 rebuilds normals and tangents from vertex data
- Two entities (0 and 1) with different materials but same mesh for front/back faces
- Cosine interpolation: trans=(1-Cos(cpt/dt_trans*PI))/2
- 16 different parametric surfaces available for morphing
