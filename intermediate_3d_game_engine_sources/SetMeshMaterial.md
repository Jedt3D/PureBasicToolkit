# SetMeshMaterial.pb - Intermediate Description
## Purpose
Demonstrates SetMeshMaterial() for assigning different materials to sub-meshes. Creates a manually defined mesh with two sub-meshes (recto/verso of a card) and assigns different textures to each side, creating a playing card effect.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures.
## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, RenderWorld
- Mesh: CreateMesh, MeshVertex, MeshFace, AddSubMesh, FinishMesh, NormalizeMesh, SetMeshMaterial
- Entity: CreateEntity, ScaleEntity, RotateEntity
- Material: CreateMaterial, LoadTexture, SetMaterialColor, MaterialFilteringMode
- Camera: CreateCamera, MoveCamera, CameraBackColor
- Constants: #PB_Material_SelfIlluminationColor, #PB_Material_Anisotropic, #PB_Material_None, #PB_Default, #PB_Relative
## Input/Output
- Loads: ValetCoeur.jpg, DosCarte.png textures
- Displays: Rotating card with different textures on each side
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window and windowed screen
3. Add Textures archive
4. Set default material filtering to anisotropic x8
5. Create material 0 with ValetCoeur.jpg, self-illumination white
6. Create material 1 with DosCarte.png
7. Create mesh 0 manually:
   - SubMesh 0 (Recto): 4 vertices forming a quad, 1 face (2 triangles via MeshFace with 4 indices)
   - AddSubMesh for SubMesh 1 (Verso): same 4 vertices, face with reversed winding
8. FinishMesh with multimaterial flag, NormalizeMesh
9. SetMeshMaterial(0, MaterialID(0), 0) - front material
10. SetMeshMaterial(0, MaterialID(1), 1) - back material
11. Create entity with #PB_Material_None (materials come from mesh), scale 300x1x200
12. Create camera at (0, 0, 500)
13. Main loop: RotateEntity(0, 1.1, 0.3, 1.0, #PB_Relative), RenderWorld, FlipBuffers
14. Exit on Escape
## Important Notes
- MeshFace with 4 indices creates a quad (two triangles)
- FinishMesh(#True) enables multi-material support
- Entity uses #PB_Material_None because materials are assigned at mesh level via SetMeshMaterial
- MeshVertex uses 6 parameters: x, y, z, u, v, color
