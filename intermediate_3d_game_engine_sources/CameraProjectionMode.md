# CameraProjectionMode.pb - Intermediate Description

## Purpose
Demonstrates CameraProjectionMode() with orthographic projection. Creates a mathematical curve (rose-like pattern) using a line strip mesh, displayed with orthographic camera projection that rotates.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. No named constants.

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), CreateMaterial(), LoadTexture(), DisableMaterialLighting(), CreateMesh(), MeshVertexPosition(), MeshVertexColor(), FinishMesh(), SetMeshMaterial(), CreateNode(), AttachNodeObject(), RotateNode(), CreateCamera(), MoveCamera(), CameraLookAt(), CameraBackColor(), CameraProjectionMode(), RenderWorld()
- Sprite: InitSprite(), OpenWindowedScreen(), FlipBuffers()
- Keyboard: InitKeyboard(), ExamineKeyboard()

## Input/Output
- Loads: White.jpg texture
- Displays: A rotating mathematical curve (parametric rose) rendered as red line strip on green background with orthographic projection

## Logic Flow
1. Define input variables
2. Initialize engine, sprite, keyboard (no mouse needed)
3. Open window and windowed screen
4. Add textures archive
5. Create white material with lighting disabled
6. Create mesh as line strip (#PB_Mesh_LineStrip, #PB_Mesh_Static)
7. Generate parametric curve: loop t from 0 to 2*PI in 0.001 steps
   - x = Cos(t) - Cos(k*t)/2 + Sin(14*t)/3 (k=6)
   - y = Cos(14*t)/3 + Sin(t) - Sin(k*t)/2
   - z = 0
   - Each vertex colored red
8. FinishMesh(#False)
9. Set mesh material, create node, attach mesh to node
10. Create camera at (0,0,1) looking at origin
11. Set green back color
12. Set orthographic projection: width = 2*PI, height = (600/800)*width
13. Main loop:
    - Rotate node slowly (0.5 degrees Z per frame)
    - RenderWorld, FlipBuffers, ExamineKeyboard
14. Exit on Escape

## Important Notes
- CameraProjectionMode(0, #PB_Camera_Orthographic, Width, Height) sets orthographic mode
- Height calculated as aspect ratio * width (600/800 ratio)
- Mesh is attached to node for rotation (meshes can't be rotated directly)
- Line strip mesh with #PB_Mesh_Static flag
- Variable `quit` (lowercase) referenced in exit condition
- k=6 creates the specific parametric pattern
