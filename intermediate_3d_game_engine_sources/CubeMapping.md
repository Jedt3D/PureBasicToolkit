# CubeMapping.pb - Intermediate Description

## Purpose
Demonstrates cube map texturing (environment mapping) on a robot mesh. The robot reflects its surroundings (4 orbiting colored spheres and a desert skybox) using a cube map texture updated automatically.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Uses #PB_Any for camera creation.

## Key Libraries/Functions
- Engine3D: InitEngine3D, RenderWorld
- Texture: CreateCubeMapTexture, LoadTexture
- Material: CreateShaderMaterial, MaterialShaderTexture, MaterialShininess
- Mesh: LoadMesh, CreateSphere
- Entity: CreateEntity, MoveEntity, EntityCubeMapTexture
- Camera: CreateCamera, MoveCamera, CameraLookAt
- Light: CreateLight
- SkyBox
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers

## Input/Output
- Loads: robot.mesh, r2skin.jpg, desert07.jpg (skybox)
- Displays: Robot with reflective cube-mapped surface surrounded by orbiting colored spheres

## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen, add archives (textures, models, desert skybox), parse scripts
3. Create camera, light
4. Create cube map texture (256, auto-update)
5. Load r2skin texture
6. Create shader material with #PB_Material_CubicEnvShader
7. Set shader textures (cube map + skin texture)
8. Load robot mesh, create entity with shader material
9. Assign cube map texture to entity via EntityCubeMapTexture
10. Create sphere mesh, create 4 spheres with random colors and shininess
11. Create skybox
12. Main loop:
    a. Process events
    b. Increment angle, position 4 spheres in circular orbit
    c. RenderWorld and FlipBuffers
    d. Examine keyboard
13. Exit on Escape

## Important Notes
- CreateCubeMapTexture(id, size, #PB_Texture_AutomaticUpdate, "") creates auto-updating cube map
- CreateShaderMaterial(id, #PB_Material_CubicEnvShader) for environment mapping shader
- MaterialShaderTexture(matID, tex0, tex1, tex2, tex3) sets shader textures
- EntityCubeMapTexture(entity, textureID) links entity to cube map
- CreateMaterial(i, 0, Random($ffffff)) creates colored material without texture
- Spheres orbit using cos/sin with incremented angle
- #PB_Texture_AutomaticUpdate constant for automatic cube map refresh
