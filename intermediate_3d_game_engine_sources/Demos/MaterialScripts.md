# MaterialScripts.pb - Intermediate Description
## Purpose
Demonstrates advanced shader material scripts including per-pixel lighting, bump mapping, water reflection via render-to-texture (RTT), and animated grass/foliage. Includes a comprehensive procedural texture generation library with noise, blur, emboss, gradient, and outline functions.
## Type
3D Engine Demo (complex game demo)
## Compiler Flags
None (GUI app with windowed screen)
## Structure
- `f2`: 2D float vector (x, y)
- `f3`: 3D float vector (x, y, z)
- `PB_MeshVertexV`: Mesh vertex with position(f3), normal(f3), tangent(f3), u, v floats, color long
- Macros: vec3d, sub3D, add3d for vector math
- Constants: #n=1, #ecart=8
- Globals: diff=1, spec=1, rotL=1, rotG=1, fdf=0
## Key Libraries/Functions
- Engine3D: InitEngine3D(#PB_Engine3D_DebugLog), CreateEntity, RotateEntity, MoveEntity
- Textures: CreateTexture, StartDrawing/StopDrawing(TextureOutput), CopyMemory to DrawingBuffer
- Materials: GetScriptMaterial, MaterialTextureAliases, MaterialCullingMode, MaterialFilteringMode, MaterialBlendingMode, SetMaterialColor, MaterialShininess, ScaleMaterial
- Mesh: CreateDataMesh, BuildMeshTangents, CreatePlane
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor, CameraRenderMode, CameraReflection, RotateCamera
- RTT: CreateRenderTexture
- Sprites: CreateSprite, StartDrawing(SpriteOutput), DisplayTransparentSprite
- Fog, SkyBox, AmbientColor
## Input/Output
- Input: Keyboard (F1-F4 toggles, F12 wireframe, arrows+mouse for camera, Escape to quit)
- Output: 3D scene with shader-lit torus knot, bump-mapped torus knot, reflective water plane, animated grass
- Data: MaterialScriptsGeneric scripts directory, desert.zip skybox
## Logic Flow
1. Define extensive procedural texture library:
   - Noise2d: Perlin-like 2D noise with octaves
   - blur2D: Box blur with variable kernel size
   - Embos2D: Emboss/edge detection filter
   - grad2D: Gradient (Laplacian) filter
   - superpose: Random offset superposition
   - outline2d: Transfer function with interpolated profile
   - GradientToArray: Parse gradient string to color palette
   - textureArrayToColor: Convert float array to colored texture
   - textureArrayToNM: Convert float array to normal map texture
   - texturediffuse/texturenormal: High-level texture generation
2. Define mesh generation procedures:
   - mesh_node: Torus knot mesh with parametric equations
   - mesh_foliage: Flat foliage quad mesh with wind parameters in vertex color
3. Initialize engine with debug log, sprites, keyboard, mouse
4. Open window and screen (80% desktop)
5. Add archives (MaterialScriptsGeneric, desert.zip), parse scripts
6. Create camera, ambient color, skybox, fog (required for shaders)
7. Create light
8. Generate torus knot mesh
9. Create per-pixel material with procedural diffuse texture
10. Create bump material with procedural diffuse and normal map textures
11. Create entities for each material
12. Create water RTT: second camera, render texture, water material with normal map and RTT, water plane entity
13. Create underwater ground plane
14. Generate grass texture procedurally, use foliage shader material, create multiple grass entities
15. Create HUD sprite with controls info
16. Main loop:
    a. Process events, keyboard toggles (F1-F4, F12)
    b. Update entity rotations, camera movement
    c. CameraReflection for water RTT
    d. Render, display HUD sprite, flip
17. Exit on mouse click or Escape
## Important Notes
- No EnableExplicit - extensive use of implicit variables
- Very complex procedural texture generation library
- Uses custom shader materials from "MaterialScriptsGeneric" directory
- MaterialTextureAliases used to bind procedural textures to script materials
- CameraReflection used for real-time water reflection
- Foliage shader uses vertex color channels for wind animation parameters
- Uses Global Dim and nested procedures with shared state
- defmatrot/calcmatrot procedures compute rotation matrices using global variables lo_p, lo_q, lo_r
