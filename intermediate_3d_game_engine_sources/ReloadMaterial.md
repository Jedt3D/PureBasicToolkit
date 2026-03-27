# ReloadMaterial.pb - Intermediate Description
## Purpose
Demonstrates dynamically reloading materials at runtime. A robot model is displayed, and pressing F5 creates a material script file on disk and reloads it, changing the robot's appearance. Shows how to use ReloadMaterial, GetScriptMaterial, and SetEntityMaterial for live material editing.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Forward declaration: CreateMaterialScript()
- Procedure: CreateMaterialScript() writes a .material script file
## Key Libraries/Functions
- Material: ReloadMaterial, GetScriptMaterial, SetEntityMaterial, MaterialID
- Mesh: LoadMesh, MeshID
- Entity: CreateEntity
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor
- Light: AmbientColor, CreateLight
- FileIO: CreateFile, WriteStringN, CloseFile
- Scene: RenderWorld, Parse3DScripts, Add3DArchive
- Constants: #PB_Material_None, #PB_Absolute, #LF$, #True
## Input/Output
- Loads: robot.mesh model, various script materials
- Creates: ReloadMaterial.material script file in Data/Scripts
- Displays: Robot model that changes material on F5 press
- Controls: F5 to reload material, Esc to quit
## Logic Flow
1. Declare CreateMaterialScript procedure
2. Initialize engine, sprite, keyboard, mouse
3. Open windowed screen
4. Add archives (models, textures, scripts); parse scripts
5. Load robot mesh
6. Create robot entity with no material
7. Set up camera (120,90,90 looking at 0,50,0) with dark blue back color
8. Create light and set ambient
9. Main loop:
    a. On F5 press: call CreateMaterialScript(), then ReloadMaterial("Test", "ReloadMaterial.material", #True), GetScriptMaterial(0, "Test"), SetEntityMaterial(0, MaterialID(0))
    b. Render
10. Exit on Escape
11. CreateMaterialScript procedure:
    a. Create file at compiler home + "examples/3d/Data/Scripts/ReloadMaterial.material"
    b. Write OGRE material script defining "Test" material with nskingr.jpg texture
    c. Close file
## Important Notes
- This demo writes to the PureBasic installation directory (examples/3d/Data/Scripts/)
- The material script uses OGRE material format
- ReloadMaterial takes material name, filename, and a flag (#True) for forced reload
- The material script string uses tabs and LF for formatting
- #LF$ is used as line separator in the material script
