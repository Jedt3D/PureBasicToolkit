# ShaderPointSpriteSphere.pb - Intermediate Description
## Purpose
Demonstrates CreateShaderMaterial() with #PB_Material_PointSpriteSphereShader for rendering a point cloud as lit spheres. Creates 100001 random points forming a particle cloud that the camera flies through.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures.
## Key Libraries/Functions
- Engine3D: InitEngine3D, RenderWorld
- Shader: CreateShaderMaterial, SetMaterialAttribute
- Material: MaterialShininess
- Mesh: CreateMesh (#PB_Mesh_PointList), MeshVertex, FinishMesh
- Entity: CreateEntity
- Camera: CreateCamera, MoveCamera, CameraLookAt, RotateCamera
- Light: CreateLight, AmbientColor
- Math: Random, Bool
- Constants: #PB_Mesh_PointList, #PB_Material_PointSpriteSphereShader, #PB_Material_PointSprite, #PB_Relative
## Input/Output
- No external textures loaded
- Displays: Point cloud of 100001 colored spheres
## Logic Flow
1. Define helper function POM(v.f): returns random value in range -v to +v
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Create camera at (0, 2, -100) looking at origin; create light at origin; set ambient
5. Create mesh 0 as point list (#PB_Mesh_PointList):
   - Loop 100001 times
   - MeshVertex with random position (pom(200)), random size as U coord (random 8-64 * 0.05), random RGB color
6. FinishMesh(1)
7. CreateShaderMaterial(0, #PB_Material_PointSpriteSphereShader)
8. SetMaterialAttribute(0, #PB_Material_PointSprite, 1)
9. MaterialShininess(0, 64, $ffffff)
10. Create entity with point cloud mesh and shader material
11. Define fly=1 for automatic forward movement
12. Main loop:
    - Camera movement with keyboard/mouse/mousewheel plus automatic fly-forward
    - Smooth camera zoom acceleration
    - RenderWorld, FlipBuffers
13. Exit on Escape or middle mouse button
## Important Notes
- #PB_Mesh_PointList mode creates point-only geometry (no faces)
- MeshVertex U coordinate encodes point sprite size
- fly=1 provides constant forward camera movement
- POM procedure generates plus-or-minus random values
