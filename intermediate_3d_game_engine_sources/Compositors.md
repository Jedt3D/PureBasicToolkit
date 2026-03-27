# Compositors.pb - Intermediate Description

## Purpose
Demonstrates compositor post-processing effects (Radial Blur, Bloom, Glass, Embossed, Sharpen Edges, Posterize, Laplace, Tiling) that can be applied to the camera view. Users switch between effects using F1-F8 keys.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures.

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld
- Compositor: CreateCompositorEffect
- Entity: CreateEntity, RotateEntity
- Mesh: CreateTorus
- Material: CreateMaterial, MaterialShininess
- Camera: CreateCamera, MoveCamera, CameraLookAt, RotateCamera
- Light: CreateLight
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed, KeyboardReleased
- Mouse: InitMouse, ExamineMouse, MouseDeltaX, MouseDeltaY, MouseWheel
- SkyBox

## Input/Output
- Loads: desert07.jpg (skybox), compositor scripts from Data/Compositors
- Displays: 101 randomly colored tori spinning with selectable post-processing effects

## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen at 80% desktop size
3. Add archives for textures, desert skybox, and compositors
4. Parse 3D scripts
5. Create torus mesh, then 101 entities with random colors and positions
6. Create skybox, camera at (100,0,0), light
7. Apply initial "Radial Blur" compositor effect
8. Main loop:
    a. Process window events, mouse, keyboard
    b. Check F1-F8 for compositor switching
    c. Rotate camera with mouse, move with arrow keys
    d. Rotate all 101 entities slightly each frame
    e. RenderWorld and FlipBuffers
9. Exit on Escape

## Important Notes
- CreateMaterial(i, (0), Random($ffffff)) creates material with no texture but a diffuse color
- CreateCompositorEffect(0, 0, "name") - first param is effect ID, second is camera, third is script name
- Mouse wheel affects forward/backward movement via KeyY calculation
