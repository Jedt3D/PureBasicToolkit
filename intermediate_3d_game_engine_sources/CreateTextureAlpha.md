# CreateTextureAlpha.pb - Intermediate Description

## Purpose
Demonstrates creating textures with alpha channel transparency. Three semi-transparent cubes (red, blue, green) with circular holes cut out via alpha, rotating in front of a skybox.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Uses a Procedure to encapsulate cube creation.

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld, AmbientColor
- Texture: CreateTexture, TextureOutput
- Material: CreateMaterial, MaterialBlendingMode, MaterialCullingMode
- Mesh: CreateCube
- Entity: CreateEntity, RotateEntity
- Camera: CreateCamera, MoveCamera, CameraLookAt
- Drawing: StartDrawing, StopDrawing, DrawingMode, Box, Circle
- SkyBox
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed, KeyboardMode
- Mouse: InitMouse, ExamineMouse, MouseDeltaX, MouseDeltaY
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers

## Input/Output
- Loads: desert07.jpg (skybox)
- Displays: Three semi-transparent colored cubes with circular alpha cutouts rotating

## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen, add archives (textures, models, desert skybox), parse scripts
3. Set keyboard to international mode, set white ambient color
4. Create cube mesh (size 30)
5. Define cube() procedure that:
   a. Creates 256x256 texture with #PB_2DDrawing_AllChannels | #PB_2DDrawing_AlphaBlend
   b. Fills with opaque black, then semi-transparent color overlay
   c. Cuts transparent circle in center using RGBA(0,0,0,0)
   d. Creates material with #PB_Material_AlphaBlend and no culling
   e. Creates entity at given position
6. Call cube() three times for red (alpha 127), blue (alpha 127), green (alpha 127)
7. Create camera at (0, 10, 150) looking at (0, 0, 1)
8. Create skybox
9. Main loop:
    a. Process events, mouse, keyboard
    b. Rotate all 3 entities with different speeds
    c. Move/rotate camera
    d. RenderWorld and FlipBuffers
10. Exit on Escape

## Important Notes
- #PB_2DDrawing_AllChannels enables writing to alpha channel
- #PB_2DDrawing_AlphaBlend enables alpha blending during drawing
- RGBA(0, 0, 0, 0) creates fully transparent pixels
- #PB_Material_AlphaBlend for material transparency
- #PB_Material_NoCulling to render both sides of faces
- Procedure parameters: cube(i, x.f, y.f, z.f, color)
- KeyboardMode(#PB_Keyboard_International) set before main loop
