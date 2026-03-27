# Ribbon.pb - Intermediate Description
## Purpose
Demonstrates the RibbonEffect (ribbon trail) system by creating a moving node with a ribbon trail and billboard attached, orbiting through a desert scene with a ground plane and skybox.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures.
## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld, SkyBox
- RibbonEffect: CreateRibbonEffect, RibbonEffectColor, RibbonEffectWidth, AttachRibbonEffect
- Billboard: CreateBillboardGroup, AddBillboard, AttachNodeObject, BillboardGroupID
- Node: CreateNode, MoveNode, NodeID
- Mesh: CreatePlane
- Material: GetScriptMaterial
- Entity: CreateEntity
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraFOV, RotateCamera
- Math: Cos, ElapsedMilliseconds
## Input/Output
- Loads: desert.zip pack, Scripts and Textures archives
- Uses materials: "Scene/GroundBlend", "Scene/RibbonTrail", "Scene/burst"
- Displays: Desert ground plane, skybox, moving ribbon trail with billboard
## Logic Flow
1. Define float variables for yaw, X, Y, Z, FOV and Timer integer
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add archives for Textures, Scripts, desert.zip pack; parse scripts
5. Create ground plane (10000x10000) with GroundBlend material
6. Create node 0 at position (0, 500, 0)
7. Create ribbon effect: material "Scene/RibbonTrail", 1 chain, 80 elements, 1750 max length
8. Set ribbon color from white/opaque to blue/opaque, width from 50 to 3
9. Attach ribbon to node 0
10. Create billboard group with "Scene/burst" material, 512x512 size, add one billboard
11. Attach billboard group to node 0
12. Create camera at (2000, 100, 2000) looking at (0, 1500, 0), FOV 60
13. Set skybox desert07.jpg
14. Main loop:
    - Increment yaw based on timer intervals (every 5ms)
    - Calculate X, Y, Z positions using Cos with different periods
    - Move node to (X, Y, Z)
    - Animate camera FOV between 30 and 90, rotate camera, look at node
    - RenderWorld and FlipBuffers
15. Exit on Escape
## Important Notes
- Variable bGrp is used but undefined in AttachNodeObject call - should be 0
- Timer-based yaw increment for smooth rotation
- Cosine functions on ElapsedMilliseconds create smooth orbital motion
