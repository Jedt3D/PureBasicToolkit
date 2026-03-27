# ShaderSkyWaterBump.pb - Intermediate Description
## Purpose
Demonstrates CreateShaderMaterial() with #PB_Material_WaterShader and #PB_Material_BumpShader built-in shaders. Creates a water plane with sky dome and 10 orbiting objects with bump-mapped materials.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures.
## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld, SkyDome, Fog
- Shader: CreateShaderMaterial, MaterialShaderTexture, MaterialShaderParameter
- Material: SetMaterialColor, MaterialShininess, MaterialFilteringMode
- Mesh: CreatePlane, CreateSphere, CreateTorus, CreateCube, CreateCylinder, CreateCapsule
- Entity: CreateEntity, MoveEntity, RotateEntity
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor, RotateCamera, CameraX, CameraZ
- Light: CreateLight, AmbientColor
- Math: Cos, Sin, Pow, Random
- Constants: #PB_Material_WaterShader, #PB_Material_BumpShader, #PB_Material_Anisotropic, #PB_Shader_Fragment, #PB_Shader_Float, #PB_Absolute, #PB_Relative, #PB_Any
## Input/Output
- Loads: Textures, nvidia textures, current directory
- Textures: waternormal.png, sky.png, dirt_grayrocky_diffusespecular.jpg, dirt_grayrocky_normalheight.jpg
- Displays: Water plane, sky dome, 10 orbiting bump-mapped objects
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window and windowed screen (no trailing parameters on OpenWindowedScreen)
3. Add archives; parse scripts
4. Define #end_distance = 1000
5. Load textures: water normal, sky, rock diffuse, rock normal
6. Create camera, light, ambient color, fog, background color
7. Create water shader material (ID 0) with water normal texture, water colors, shininess, anisotropic
8. Create water plane (end_distance*2 x end_distance*2), entity 0
9. SkyDome with sky texture, horizon colors, curvature parameters
10. Create 5 mesh types: sphere, torus, cube, cylinder, capsule
11. Loop i=0 to 9: create bump shader materials (ID i+2) with varying parameters
    - Set diffuse/normal textures, random color, random shininess
    - Random bumpy parameter
    - Create entity (ID i+2) with mesh i%5+2
12. Main loop:
    - Camera movement
    - Animate entities in circular orbit
    - Move water plane to follow camera X/Z position
    - RenderWorld, FlipBuffers
13. Exit on Escape or middle mouse button
## Important Notes
- Water plane follows camera position for infinite water illusion
- SkyDome uses TextureID directly (not material)
- Fog creates distance fade effect matching sky color
- OpenWindowedScreen has only 4 trailing parameters (no last two zeros)
- Material IDs start at 2 for bump entities to avoid conflict with water (0)
