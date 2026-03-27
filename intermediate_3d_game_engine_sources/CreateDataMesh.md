# CreateDataMesh.pb - Intermediate Description

## Purpose
Demonstrates CreateDataMesh() which creates a mesh from a 2D array of MeshVertex structures. Generates a mathematical shell/spiral surface using parametric equations with exponential decay.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
Uses Dim t.MeshVertex(nx, ny) - the built-in MeshVertex structure with fields: x, y, z, u, v, color, nx, ny, nz.

## Key Libraries/Functions
- Engine3D: InitEngine3D, RenderWorld
- Mesh: CreateDataMesh
- Material: CreateMaterial, CopyMaterial, SetMaterialColor, MaterialFilteringMode, MaterialShininess, ScaleMaterial, MaterialCullingMode, MaterialShadingMode
- Texture: LoadTexture
- Entity: CreateEntity, RotateEntity, AttachEntityObject
- Camera: CreateCamera, MoveCamera, CameraLookAt
- Light: CreateLight, AmbientColor
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed, KeyboardReleased
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers

## Input/Output
- Loads: Dirt.jpg
- Displays: A mathematical shell shape that rotates, with wireframe toggle via F12

## Logic Flow
1. Define custom constant #PB_Mesh_Normalize = 8
2. Initialize engine, sprite, keyboard, mouse
3. Open windowed screen, add textures archive, parse scripts
4. Create camera, light
5. Create material 0 with dirt texture, configure filtering/shininess/scale
6. Copy material 0 to material 1, set red diffuse/ambient color, set anti-clockwise culling
7. Define parametric surface: Dim MeshVertex array (32 x 256)
8. Fill array with shell coordinates using parametric equations:
   - x = (a + b*cos(v)) * exp(c*u) * cos(u)
   - y = (a + b*cos(v)) * exp(c*u) * sin(u)
   - z = (3a + b*sin(v)) * exp(c*u) - 5
9. CreateDataMesh(mesh, array, flags) with diagonal closest normal + normalize
10. Create two entities (front and back faces), attach entity 1 to entity 0
11. Main loop:
    a. Process events, keyboard
    b. Toggle wireframe on F12
    c. Rotate entity
    d. RenderWorld and FlipBuffers
12. Exit on Escape

## Important Notes
- #PB_Mesh_Normalize = 8 is defined as a constant in the source
- CreateDataMesh(meshID, array(), flags) takes a 2D MeshVertex array
- #PB_Mesh_DiagonalClosestNormal is a built-in constant for mesh generation
- MeshVertex structure fields accessed via With/EndWith block
- u*4 modifies u in-place after initial calculation
- CopyMaterial creates back-face material with #PB_Material_AntiClockWiseCull
- AttachEntityObject(0, "", EntityID(1)) attaches entity 1 to entity 0 with no bone
- Variable 'mesh' is used but not explicitly defined (implicit)
- Wireframe toggle variable also implicit
