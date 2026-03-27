# ShaderCubicEnv.pb - Intermediate Description
## Purpose
Demonstrates CreateShaderMaterial() with the built-in #PB_Material_CubicEnvBumpShader for cubic environment mapping with bump mapping. Creates 10 entities with varying bump/gloss/color parameters orbiting in a desert skybox scene.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures.
## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld, SkyBox
- Shader: CreateShaderMaterial, MaterialShaderTexture, MaterialShaderParameter
- Material: SetMaterialAttribute, SetMaterialColor, MaterialShininess
- Mesh: CreateCylinder, CreateCapsule, CreateSphere, CreateTorus, CreateCube
- Entity: CreateEntity, MoveEntity, RotateEntity
- Camera: CreateCamera, MoveCamera, CameraLookAt, RotateCamera
- Light: CreateLight, AmbientColor
- Math: Cos, Sin, Pow, Random
- Constants: #PB_Material_CubicEnvBumpShader, #PB_Material_TAM, #PB_Material_ClampTAM, #PB_Shader_Fragment, #PB_Shader_Float, #PB_Absolute, #PB_Relative, #PB_Any
## Input/Output
- Loads: Textures, nvidia textures, desert.zip pack
- Textures: desert07.jpg (cubic env), dirt_grayrocky_diffusespecular.jpg, dirt_grayrocky_normalheight.jpg
- Displays: 10 orbiting objects with cubic environment reflections and bump mapping
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window and windowed screen
3. Add archives for Textures, nvidia textures, desert.zip; parse scripts
4. Set skybox desert07.jpg
5. Load 3 textures: cubic env, diffuse/specular, normal/height
6. Create camera, light, ambient color
7. Create 5 different mesh types: cylinder, capsule, sphere, torus, cube
8. Loop i=0 to 9:
   - CreateShaderMaterial with CubicEnvBumpShader
   - Set shader textures (cubic, diffuse, normal)
   - Set material attributes (clamp TAM)
   - Random color, random shininess (32*2^random(5))
   - Random bumpy and glossy shader parameters
   - Create entity with mesh i%5, random rotation
9. Main loop:
   - Camera movement with keyboard/mouse/mousewheel
   - Increment angle da
   - Move all 10 entities in circular orbit (radius 8, y=2)
   - Rotate each entity
   - RenderWorld, FlipBuffers
10. Exit on Escape or middle mouse button
## Important Notes
- Uses #PB_Material_CubicEnvBumpShader built-in shader
- Entities cycle through 5 mesh types using modulo (i%5)
- Smooth acceleration for camera zoom: dist+(depz-dist)*0.05
- SetMaterialColor parameter 3 = ambient/diffuse color
