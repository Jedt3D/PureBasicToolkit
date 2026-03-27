# EnvironmentMapping.pb - Intermediate Description
## Purpose
Demonstrates environment/cubic reflection mapping on 3D objects. Creates a grid of objects with cube map textures reflecting the environment, plus ground plane reflection using render-to-texture.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures. Uses Dim tx_Cubic(50) array for cube map textures.
## Key Libraries/Functions
- CreateShaderMaterial() with #PB_Material_CubicEnvBumpShader
- CreateCubeMapTexture() with #PB_Texture_ManualUpdate
- MaterialShaderTexture() - assigns cube map, diffuse, normal textures
- EntityCubeMapTexture() - associates entity position with cube map
- UpdateRenderTexture() - updates cube map renders
- MaterialShaderParameter() for bumpy/glossy values
- SetMaterialAttribute() with #PB_Material_TAM, #PB_Material_ClampTAM
- CameraReflection() for ground reflections
- CreateRenderTexture(), AddMaterialLayer()
- SetMaterialAttribute() with #PB_Material_ProjectiveTexturing
- SkyDome(), Fog()
- CreateSphere/Capsule/Cylinder/Torus/Cube meshes
- MaterialFilteringMode() with #PB_Material_Anisotropic
## Input/Output
- Loads: sky.png, MRAMOR6X6.jpg, dirt_grayrocky_diffusespecular.jpg, dirt_grayrocky_normalheight.jpg, desert.zip
- Displays: 7x7 grid of reflective objects on reflective marble floor with sky dome and fog
- Controls: Arrow keys/mouse wheel move, mouse rotates camera, Esc quit
## Logic Flow
1. Define variables, initialize subsystems
2. Open window/screen, add archives (Textures, nvidia textures, desert zip, current directory)
3. Parse scripts
4. Create camera, light, ambient color, fog
5. Load sky texture, create SkyDome
6. Create ground: marble texture with anisotropic filtering, plane, entity
7. Create 5 mesh types (sphere, capsule, cylinder, torus, cube)
8. Load rock diffuse and normal textures
9. Loop 7x7 grid: create shader material with cubic env bump shader, create cube map texture, assign textures, set random colors, random bumpy/glossy, create entity at grid position, rotate randomly, associate cube map
10. Pre-render cube maps (2 passes)
11. Create reflection camera and render texture for ground
12. Add render texture as material layer on ground, set projective texturing
13. Main loop: process events, keyboard/mouse input, move/rotate camera, update ground reflection, render, flip
14. Exit on Escape or mouse button 3
## Important Notes
- Complex demo with many advanced features
- Uses GetCurrentDirectory() as archive path
- Ground reflection uses CameraReflection() with secondary camera
- UpdateRenderTexture() called in pre-render and in main loop for ground
- 49 objects with individual cube map textures
- Uses c as counter variable (implicit integer)
- Tab indentation uses actual tab characters in reference
