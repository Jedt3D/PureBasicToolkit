# Terrain.pb - Intermediate Description
## Purpose
Demonstrates terrain rendering with a single terrain tile in a terrain group, including terrain texturing with blend maps, and camera that follows terrain height.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Constants: #CameraSpeed=2, #TerrainMiniX=0, #TerrainMiniY=0, #TerrainMaxiX=0, #TerrainMaxiY=0
- Procedure: InitBlendMaps(), Clamp(*var.float, min.f, max.f)
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- CreateLight(#PB_Any) with #PB_Light_Directional, SetLightColor(), LightDirection()
- AmbientColor()
- CreateCamera(), MoveCamera(), CameraBackColor()
- SetupTerrains() with #PB_Terrain_NormalMapping
- CreateTerrain(), AddTerrainTexture(), DefineTerrainTile(), BuildTerrain()
- TerrainHeight() - gets height at world position
- TerrainTileLayerMapSize(), TerrainTileHeightAtPosition()
- SetTerrainTileLayerBlend(), UpdateTerrainTileLayerBlend(), UpdateTerrain()
- SkyBox()
- RotateCamera(), RenderWorld(), FlipBuffers()
## Input/Output
- Loads: Terrain textures (dirt, grass, fungus diffuse/normal), terrain513.png heightmap, desert pack
- Displays: Textured terrain with blended layers, desert skybox
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window and windowed screen
3. Add archives for textures, nvidia textures, desert pack, main, terrain data
4. Create directional light with specular color
5. Create camera at (800,400,80)
6. Setup terrains with normal mapping, create terrain group (513 vertices, 12000 world size, 600 height)
7. Add 3 terrain texture layers with different scales
8. Define terrain tile from terrain513.png heightmap
9. Build terrain; if newly imported, initialize blend maps and update terrain
10. Set desert skybox
11. Main loop: keyboard and mouse input
12. Camera follows terrain height (always 20 units above)
13. Move and rotate camera
14. Render and flip until Escape
15. Clamp procedure constrains float values via pointer
16. InitBlendMaps procedure sets layer blends based on terrain height thresholds
## Important Notes
- Terrain uses a float pointer structure for the Clamp procedure
- Camera Y position is forced to terrain height + 20
- DefineTerrainTile returns whether the tile was freshly imported
- MouseWheel() used in camera movement calculation
