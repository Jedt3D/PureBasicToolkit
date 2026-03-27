# TerrainBlend.pb - Intermediate Description
## Purpose
Demonstrates real-time terrain blend map modification. The user clicks on the terrain to select a point, then uses PageUp/PageDown to paint blend textures at that location.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Constants: #CameraSpeed=1, #TerrainMiniX=0, #TerrainMiniY=0, #TerrainMaxiX=0, #TerrainMaxiY=0, #NbSommet=36, #SizeCircle=70
- Procedures: InitBlendMaps(), Clamp(), Min(), Max(), DoTerrainModify(), AffichePolygone()
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- MaterialFilteringMode() with #PB_Material_Anisotropic
- CreateLight(#PB_Any) with #PB_Light_Directional
- SetupTerrains(), CreateTerrain(), AddTerrainTexture()
- DefineTerrainTile(), BuildTerrain(), UpdateTerrain()
- TerrainMousePick(), PickX(), PickY(), PickZ()
- TerrainHeight(), TerrainTileLayerMapSize()
- TerrainTilePointX(), TerrainTilePointY()
- GetTerrainTileLayerBlend(), SetTerrainTileLayerBlend(), UpdateTerrainTileLayerBlend()
- ShowGUI(), InputEvent3D()
- CreateLine3D() - draws selection circle on terrain
- SkyBox(), RenderWorld(), FlipBuffers()
## Input/Output
- Loads: Terrain textures, terrain513.png heightmap, desert pack, GUI data
- Displays: Terrain with blend painting circle indicator, real-time blend modification
## Logic Flow
1. Initialize engine and create windowed screen
2. Setup terrain with 3 texture layers
3. Build terrain with blend maps
4. Main loop:
   - Mouse click selects terrain point, shows circle polygon at selection
   - PageUp/PageDown modifies blend values around selected point
   - DoTerrainModify calculates brush falloff and paints blend values
   - Camera moves when mouse not clicked, follows terrain height
5. AffichePolygone draws a circle of 3D lines on terrain surface
6. Blend modification uses brush-like falloff based on distance
## Important Notes
- Uses TerrainMousePick for ray-terrain intersection
- DoTerrainModify uses image-space coordinates for blend map manipulation
- Circle visualization uses CreateLine3D with #NbSommet segments
- ShowGUI toggles mouse cursor visibility based on click state
- RenderWorld return value used as TimeSinceLastFrame
