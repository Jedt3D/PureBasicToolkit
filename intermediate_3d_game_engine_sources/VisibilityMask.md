# VisibilityMask.pb - Intermediate Description
## Purpose
Demonstrates visibility masks that control which entities are visible to which cameras, enabling split-screen views where each camera sees different objects.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Constants: #Mask1 = 1 << 0, #Mask2 = 1 << 1, #Mask3 = 1 << 2
- Macro: CreateTexture2(No, Color, Texte) - creates labeled textures
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- WorldShadows() with #PB_Shadow_Modulative
- LoadFont(), CreateTexture(), StartDrawing(), TextureOutput(), DrawingFont(), DrawText()
- CreateMaterial(), GetScriptMaterial()
- CreateCube(), CreateEntity() with visibility mask parameter
- CreateBillboardGroup() with visibility mask parameter, AddBillboard()
- CreateCamera() with visibility mask parameter - 4 cameras for split screen
- CreateLight(), AmbientColor()
- SkyBox()
- RenderWorld(), FlipBuffers()
## Input/Output
- Loads: Dirt.jpg texture, desert pack, script materials
- Displays: 4 viewports showing different combinations of 3 colored cubes based on visibility masks
## Logic Flow
1. Initialize engine, create windowed screen
2. Load font, define mask constants using bit shifts
3. Define CreateTexture2 macro for generating labeled textures
4. Add archives, parse scripts, enable shadows
5. Create ground plane (always visible, default mask)
6. Create 3 colored cubes with different visibility masks (#Mask1, #Mask2, #Mask3)
7. Create 3 labeled billboard groups with matching masks
8. Create 4 cameras at different viewport positions:
   - Camera 0 (top-left 50x50): sees #Mask1 (blue cube)
   - Camera 1 (top-right 50x50): sees #Mask2 (green cube)
   - Camera 2 (bottom-left 50x50): sees #Mask3 (red cube)
   - Camera 3 (bottom-right 50x50): sees #Mask1 | #Mask3 (blue and red)
9. Create light, set ambient color, set skybox
10. Simple main loop: render and flip until Escape
## Important Notes
- Visibility masks use bit flags for efficient camera-entity matching
- Ground entity has default mask ($FFFFFFFF) so it's visible to all cameras
- Billboard groups also support visibility masks
- Camera viewport parameters create split-screen layout
- #Mask1 | #Mask3 combines masks for camera 3
