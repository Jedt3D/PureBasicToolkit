# Skeleton.pb - Intermediate Description
## Purpose
Demonstrates skeleton/bone creation and manual bone control. Creates a cylindrical mesh, assigns a skeleton with joints, sets vertex-bone weights, and animates bones manually to create a waving/snake-like motion.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
Uses built-in MeshVertex structure for mesh data array.
## Key Libraries/Functions
- Engine3D: InitEngine3D, RenderWorld
- Skeleton: CreateSkeleton, CreateBone, VertexBoneAssignment, FinishBoneAssignment, EnableManualEntityBoneControl, RotateEntityBone, EntityBoneX, EntityBoneY, EntityBoneZ
- Mesh: CreateDataMesh, CreateSphere
- Material: CreateShaderMaterial, SetMaterialColor, MaterialShininess, MaterialCullingMode, MaterialShadingMode
- Entity: CreateEntity, MoveEntity
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor, RotateCamera
- Light: CreateLight, AmbientColor
- Math: Cos, Sin, Mod, Int
- Constants: #PB_Material_ColorShader, #PB_Material_AmbientColor, #PB_Material_DiffuseColor, #PB_Material_NoCulling, #PB_Material_Wireframe, #PB_Material_Solid, #PB_Absolute, #PB_Relative
## Input/Output
- No external textures loaded
- Displays: Animated skeletal mesh (tube/worm) with small sphere markers at bone positions
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window and windowed screen
3. Create camera, light, ambient color
4. Create color shader material with blue ambient/diffuse, no culling
5. Define parameters: ns=4 sections, lgs=2 section length, r=0.2 radius, ni=8, nj=16
6. Create mesh data array Dim t.MeshVertex with cylindrical tube geometry:
   - Loop through sections (s), rows (j), columns (i)
   - Calculate x,z from cosine/sine for circular cross-section
   - Calculate y from section + row offset * length
   - Set UVs, color, normals
7. CreateDataMesh(0, t()) to build mesh from array
8. Create skeleton with ns+1 joints:
   - CreateSkeleton(0)
   - Loop s=0 to ns: CreateBone with parent chain, positioned along Y axis
   - Create small sphere entities at each bone position for visualization
9. Assign vertex bone weights:
   - For each vertex, calculate which bone(s) it belongs to based on position
   - VertexBoneAssignment with weight blending between adjacent bones
   - FinishBoneAssignment
10. Create main entity with the skeletal mesh
11. Enable manual bone control for all joints
12. Main loop:
    - Camera movement with keyboard/mouse/mousewheel
    - F12 toggles wireframe/solid rendering
    - Animate angle
    - For each bone: calculate rotation using Sin with phase offset, alternate direction
    - RotateEntityBone for Z-axis rotation
    - Move sphere marker entities to bone world positions
    - RenderWorld, FlipBuffers
13. Exit on Escape or middle mouse button
## Important Notes
- CreateDataMesh creates mesh directly from a 2D array of MeshVertex
- Vertex bone assignment uses weight blending (1-w and w) for smooth deformation
- Mod() used for weight calculation - on arm64, ensure integer operands
- The skeleton creates a hierarchical chain of bones
- Small spheres act as visual bone position markers
- Wireframe toggle helps visualize mesh deformation
