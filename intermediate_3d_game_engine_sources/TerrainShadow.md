# TerrainShadow.pb - Intermediate Description
## Purpose
Demonstrates terrain shadow casting, where a sphere can be placed on the terrain by mouse click and casts shadows on the terrain surface.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Constants: #CameraSpeed=2, #TerrainMiniX/Y=0, #TerrainMaxiX/Y=0
- Procedure: Clamp()
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- SetupTerrains(), CreateTerrain(), AddTerrainTexture(), DefineTerrainTile(), BuildTerrain()
- TerrainTileLayerMapSize(), TerrainTileHeightAtPosition()
- SetTerrainTileLayerBlend(), UpdateTerrainTileLayerBlend(), UpdateTerrain()
- TerrainRenderMode() with #PB_Terrain_CastShadows
- WorldShadows() with #PB_Shadow_Modulative
- TerrainMousePick(), PickX(), PickY(), PickZ()
- CreateSphere(), CreateEntity(#PB_Any)
- EntityRenderMode() with #PB_Entity_CastShadow
- MoveEntity(), InputEvent3D(), MouseButton()
- SkyBox(), RenderWorld(), FlipBuffers()
## Input/Output
- Loads: Terrain textures, desert pack
- Displays: Terrain with shadow-casting sphere that follows mouse clicks
## Logic Flow
1. Initialize engine, create windowed screen
2. Define Clamp procedure upfront
3. Setup terrain with modulative world shadows
4. Build terrain and initialize blend maps inline (not in separate procedure)
5. Enable terrain shadow casting with TerrainRenderMode
6. Create sphere entity with #Null material, set to cast shadows
7. Set desert skybox
8. Main loop:
   - Arrow keys move camera
   - Mouse click performs terrain pick, moves sphere to picked position
   - InputEvent3D for GUI/mouse handling
   - Render and flip until Escape
## Important Notes
- Uses Global for ball entity variable
- TerrainRenderMode(0, #PB_Terrain_CastShadows) enables shadow casting on terrain
- EntityRenderMode with #PB_Entity_CastShadow enables shadow casting for the sphere
- Blend maps initialized inline rather than in a separate procedure call
- Ball placed at PickY()+20 to sit above terrain surface
