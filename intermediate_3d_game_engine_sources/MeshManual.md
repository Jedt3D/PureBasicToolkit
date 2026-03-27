# MeshManual.pb - Intermediate Description

## Purpose
Demonstrates creating a manual mesh (pyramid) from vertices and faces using MeshVertex() and MeshFace(). Shows both a textured view and wireframe view using two cameras.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Constants: #CameraSpeed = 0.1
- Variables: KeyX, KeyY, MouseX, MouseY, x, y, z, nx, ny, nz, u, v (floats), Co (long), t1, t2, t3 (words), Quit (integer)

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive
- Mesh: CreateMesh (#PB_Mesh_TriangleList), MeshVertex, MeshFace, FinishMesh, NormalizeMesh
- Material: CreateMaterial, LoadTexture, SetMaterialColor, MaterialCullingMode (#PB_Material_NoCulling)
- Entity: CreateEntity, RotateEntity
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor, CameraRenderMode (#PB_Camera_Wireframe), RotateCamera
- Light: CreateLight, AmbientColor

## Input/Output
- Input: Caisse.png texture
- Output: Split-screen: textured pyramid (left) and wireframe pyramid (right), auto-rotating

## Logic Flow
1. Initialize all subsystems
2. Open window and screen
3. Add textures archive
4. Create manual mesh 0 as TriangleList:
   a. Define 5 vertices with positions, UV coords, color, normals
   b. Base: (-1,0,1), (1,0,1), (-1,0,-1), (1,0,-1)
   c. Top: (0,1.4,0)
   d. Define faces: base quad (4 vertices), 4 side triangles
5. FinishMesh with #True, NormalizeMesh
6. Create material with Caisse texture, no culling, ambient+diffuse color set to -1
7. Create entity from manual mesh
8. Create camera 0 (left half, normal view)
9. Create camera 1 (right half, wireframe mode)
10. Create light and ambient color
11. Main loop: rotate entity, apply camera rotations to both cameras, render
12. Exit on Escape or Quit

## Important Notes
- MeshVertex takes: x, y, z, u, v, color, nx, ny, nz
- MeshFace with 4 args creates a quad face, with 3 args creates a triangle
- FinishMesh(#True) calculates bounding box
- NormalizeMesh recalculates normals
- SetMaterialColor with -1 sets white (all bits set)
- Two cameras show same scene: textured vs wireframe
