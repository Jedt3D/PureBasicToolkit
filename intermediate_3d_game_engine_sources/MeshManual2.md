# MeshManual2.pb - Intermediate Description

## Purpose
Demonstrates various manual mesh types: LineStrip, PointList, LineList with MeshVertexPosition/MeshVertexColor and MeshIndex. Shows planes, star fields, wireframe boxes, and grids using different primitive types.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Constants: #CameraSpeed = 1, #scale = 3
- Variables: KeyX, KeyY, MouseX, MouseY (floats), Plane, Stars, Box, Grid, Plane2, Box2 (node IDs from CreateNode #PB_Any), i (loop counter)

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts
- Mesh: CreateMesh (#PB_Mesh_LineStrip, #PB_Mesh_PointList, #PB_Mesh_LineList, #PB_Mesh_Static), MeshVertexPosition, MeshVertexColor, MeshIndex, AddSubMesh, FinishMesh, SetMeshMaterial
- Material: CreateMaterial, LoadTexture, DisableMaterialLighting
- Node: CreateNode (#PB_Any), AttachNodeObject, RotateNode, NodeX, NodeY, NodeZ
- Camera: CreateCamera, MoveCamera, CameraFOV, CameraLookAt, CameraBackColor
- Light: CreateLight, AmbientColor

## Input/Output
- Input: White.jpg texture
- Output: Multiple rotating manual mesh objects: colored plane outline, star field, wireframe box, grid, plus indexed versions

## Logic Flow
1. Initialize all subsystems
2. Open window and screen
3. Add archives for textures, fonts, scripts; parse scripts
4. Create white material with lighting disabled
5. Create Mesh 0 (LineStrip plane): 5 colored vertices forming a rectangle outline
6. Attach to node at (-40, 0, 0)
7. Create Mesh 1 (PointList stars): 10001 random yellow points
8. Attach to node at origin
9. Create Mesh 2 (LineStrip box): bottom ring + top ring as sub-meshes, vertical lines as LineList sub-mesh
10. Attach to node at (40, 0, 0)
11. Create Mesh 3 (LineList grid): horizontal and vertical lines in different colors
12. Attach to node at origin
13. Create Mesh 4 (LineStrip plane with MeshIndex): 4 vertices, 5 index references
14. Attach to node at (0, 30, 0)
15. Create Mesh 5 (LineList box with MeshIndex): 8 vertices, indices for all 12 edges
16. Attach to node at (0, -30, 0)
17. Create camera at (0, 40, 150) with FOV 40, looking at grid node
18. Create light and ambient color
19. Main loop: rotate all 6 nodes, render
20. Exit on Escape or Quit

## Important Notes
- Uses #PB_Mesh_Static flag for non-updating meshes
- MeshIndex() allows vertex reuse without duplication
- AddSubMesh() allows mixing primitive types within one mesh
- SetMeshMaterial() assigns material to non-entity meshes attached to nodes
- Node IDs come from CreateNode(#PB_Any) - returns dynamic IDs
