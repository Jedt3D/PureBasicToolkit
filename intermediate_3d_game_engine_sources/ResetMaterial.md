# ResetMaterial.pb - Intermediate Description
## Purpose
Demonstrates how to dynamically change a material script at runtime using ResetMaterial() and ReloadMaterial(). Creates a material script file, loads a robot mesh with that material, and pressing F5 regenerates the script with a different texture, reloads it, and resets the material on all entities using it.
## Type
3D Engine Demo
## Compiler Flags
None (GUI/subsystem auto-detected)
## Structure
No custom structures. Uses a forward-declared procedure CreateMaterialScript().
## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, GetScriptMaterial, ReloadMaterial, ResetMaterial, RenderWorld
- Entity: CreateEntity, MeshID, MaterialID
- Mesh: LoadMesh
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor
- Light: AmbientColor, CreateLight
- File: CreateFile, WriteStringN, CloseFile
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardReleased, KeyboardPushed
- Constants: #PB_Engine3D_DebugOutput, #PB_Engine3D_Entity, #PB_Absolute, #PB_3DArchive_FileSystem, #PB_Window_ScreenCentered, #PB_Material_None
## Input/Output
- Loads: robot.mesh, r2skin.jpg, nskingr.jpg (textures)
- Writes: ResetMaterial.material script file to Data/Scripts
- Displays: Three robots with swappable material, one robot with no material
## Logic Flow
1. Forward-declare CreateMaterialScript procedure
2. Call CreateMaterialScript("r2skin.jpg") to create initial material script
3. Define constant #PB_Engine3D_Entity = 2
4. Initialize engine, sprite, keyboard, mouse
5. Open window and windowed screen at 80% desktop size
6. Add 3D archives for Models, Textures, Scripts; parse scripts
7. Get script material "TestReset" as material 0
8. Load robot mesh as mesh 0
9. Create 4 entities: 3 with material 0 at different positions, 1 with #PB_Material_None
10. Create camera at (150,90,150) looking at (0,50,0), dark blue background
11. Create ambient light and directional light
12. Main loop: process window events, check keyboard
    - On F5: call CreateMaterialScript("nskingr.jpg"), ReloadMaterial, GetScriptMaterial, ResetMaterial
    - RenderWorld and FlipBuffers
13. Exit on Escape
14. Procedure CreateMaterialScript: creates an Ogre material script file with given texture name
## Important Notes
- The procedure is called BEFORE InitEngine3D - it only creates a file, no engine required
- Uses #PB_Engine3D_Entity constant defined locally as value 2
- ResetMaterial applies to all entities that use the given material type flag
- The 4th entity uses #PB_Material_None so it is unaffected by ResetMaterial
