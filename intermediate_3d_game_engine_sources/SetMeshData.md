# SetMeshData.pb - Intermediate Description
## Purpose
Demonstrates SetMeshData() for dynamic mesh modification. Creates a grid mesh and animates it with sine-wave displacement each frame, producing an animated wave/water surface effect.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
Uses built-in MeshVertex structure for mesh data storage.
## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld, SkyBox
- Mesh: CreateMesh, MeshVertex (position/normal/texcoord), MeshFace, FinishMesh, GetMeshData, SetMeshData, MeshVertexCount, SetMeshMaterial
- Entity: CreateEntity, ScaleEntity
- Material: GetScriptMaterial, MaterialCullingMode
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor, RotateCamera
- Light: CreateLight, AmbientColor
- Math: Sin, Radian
- Constants: #PB_Mesh_Vertex, #PB_Material_None, #PB_Absolute, #PB_Relative
## Input/Output
- Loads: Textures, Scripts, skybox.zip archives
- Uses material: "Scene/GroundBlend"
- Displays: Animated wave mesh surface with skybox
## Logic Flow
1. Define constants: #CameraSpeed=1, #NbX=30, #NbZ=30, mesh/camera/entity/light/material IDs
2. Define global wave parameters: WaveFrequency=3, WavePeriodX=9, WavePeriodZ=11, WaveAmplitude=3
3. Define global Dim MeshData.MeshVertex(0) for mesh data storage
4. Forward-declare UpdateMatrix and CreateMatrix procedures
5. Initialize engine, sprite, keyboard, mouse
6. Open window and windowed screen
7. Add archives; parse scripts
8. Get "Scene/GroundBlend" material, set culling mode
9. Call CreateMatrix() to build initial mesh
10. Create camera, light, skybox
11. Main loop:
    - Camera movement with keyboard and mouse
    - Call UpdateMatrix() to modify vertex Y positions using sine waves
    - Increment AngleVague by WaveFrequency
    - RenderWorld and FlipBuffers
12. Procedures:
    - DrawMatrix: creates vertex grid and face indices for NbX*NbZ grid
    - CreateMatrix: calls CreateMesh, DrawMatrix, FinishMesh, SetMeshMaterial, CreateEntity, GetMeshData
    - UpdateMatrix: modifies Y of each vertex using Sin(), then calls SetMeshData
13. Exit on Escape
## Important Notes
- MeshVertex structure is a built-in PureBasic structure (not user-defined)
- GetMeshData reads vertex data into array, SetMeshData writes it back after modification
- Wave animation uses combined X and Z periods for complex wave pattern
- Grid is (NbX+1)*(NbZ+1) vertices with NbX*NbZ*2 triangles
