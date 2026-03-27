# TerrainHeight.pb - Intermediate Description
## Purpose
Demonstrates real-time terrain height modification. The user clicks to select a point and uses PageUp/PageDown to raise/lower the terrain at that location. F5 reinitializes blend maps.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Constants: #CameraSpeed=1, #TerrainMiniX/Y=0, #TerrainMaxiX/Y=0, #NbSommet=36
- Procedures: InitBlendMaps(), Clamp(), Min(), Max(), DoTerrainModify(), DisplayPolygon()
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- SetupTerrains(), CreateTerrain(), AddTerrainTexture(), DefineTerrainTile(), BuildTerrain()
- TerrainMousePick(), PickX(), PickY(), PickZ()
- TerrainTileSize(), TerrainTilePointX(), TerrainTilePointY()
- GetTerrainTileHeightAtPoint(), SetTerrainTileHeightAtPoint()
- UpdateTerrain() - called after height changes
- TerrainHeight()
- InputEvent3D(), ShowGUI()
- CreateLine3D()
- SkyBox(), RenderWorld(), FlipBuffers()
## Input/Output
- Loads: Terrain textures, terrain513.png, desert pack, GUI data
- Displays: Terrain with height modification circle, real-time deformation
## Logic Flow
1. Initialize engine, create windowed screen
2. Setup terrain with 3 texture layers, build terrain
3. Main loop:
   - Mouse click selects terrain point with DisplayPolygon circle
   - PageUp/PageDown modifies terrain height at selected point
   - DoTerrainModify: calculates brush, gets/sets terrain point heights
   - UpdateTerrain called after each height change
   - F5 reinitializes blend maps
   - Camera follows terrain height
4. Height modification uses weighted brush with falloff
5. DisplayPolygon shows selection area on terrain
## Important Notes
- Uses TerrainTileSize instead of TerrainTileLayerMapSize (differs from TerrainBlend)
- SetTerrainTileHeightAtPoint directly modifies terrain geometry
- UpdateTerrain must be called to apply height changes
- TimeSinceLastFrame scaled by 0.2 for slower modification speed
- InputEvent3D has additional parameters compared to TerrainBlend
