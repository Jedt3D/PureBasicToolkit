# ConvertWorldToLocalPosition.pb - Intermediate Description

## Purpose
Demonstrates ConvertWorldToLocalPosition() for converting world coordinates to entity local space. Allows drawing on a mesh surface using mouse raycasting - the user draws on a rotating quad by clicking with the mouse.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Uses built-in Vector3 (P.Vector3) global.

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld, ConvertWorldToLocalPosition, GetX, GetZ, PickX, PickY, PickZ, MouseRayCast
- Entity: CreateEntity, ScaleEntity, RotateEntity, AttachEntityObject (not used but entity is created)
- Mesh: CreateMesh, MeshVertex, MeshFace, FinishMesh
- Material: CreateMaterial, MaterialBlendingMode, DisableMaterialLighting, MaterialCullingMode, MaterialFilteringMode
- Texture: CreateTexture, TextureOutput
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor, CameraViewWidth, CameraViewHeight
- Light: CreateLight
- Image: CreateImage, ImageOutput
- Drawing: StartDrawing, StopDrawing, Box, DrawingMode, DrawingFont, DrawText, LineXY, DrawImage
- Mouse: InitMouse, ExamineMouse, MouseX, MouseY, MouseButton, MouseDeltaX, MouseDeltaY, MouseLocate, InputEvent3D
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed
- Font: LoadFont
- GUI: ShowGUI
- SkyBox
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers

## Input/Output
- Loads: stevecube.jpg (skybox)
- Creates: Custom quad mesh, image texture for drawing
- Displays: A rotating mesh surface that the user can draw on with left mouse button, clear with right

## Logic Flow
1. Declare DrawOnWhiteBoard procedure
2. Define globals: Entity (entity ID), P (Vector3)
3. Load font, define macro InitImage() for drawing instructions on image
4. Initialize engine, sprite, keyboard, mouse
5. Open windowed screen, add archives, parse scripts
6. Create custom quad mesh (4 vertices, 4 faces - front and back)
7. Create 320x240 image with instructions drawn on it
8. Create 320x240 texture, create material with alpha blending and no culling
9. Create entity from mesh with material, scale to 80x1x60
10. Create light, camera, set background color, skybox
11. Show GUI for mouse cursor, center mouse
12. Main loop:
    a. Process events, mouse input with InputEvent3D
    b. If MouseRayCast hits the entity, call DrawOnWhiteBoard
    c. Rotate entity slightly each frame
    d. Copy image to texture each frame via TextureOutput
    e. Move camera, render, flip
13. DrawOnWhiteBoard procedure:
    a. On left button: ConvertWorldToLocalPosition with pick coordinates
    b. Convert local position to image pixel coordinates
    c. Draw lines between consecutive mouse positions
    d. On right button: clear image with InitImage macro
14. Exit on Escape

## Important Notes
- CreateMesh(0) / MeshVertex / MeshFace / FinishMesh(1) for custom mesh creation
- MeshVertex(x, y, z, u, v, color, nx, ny, nz) - 9 parameters
- MouseRayCast(camera, mouseX, mouseY, mask) returns entity ID or -1
- PickX/Y/Z() return the world position of the ray hit
- ConvertWorldToLocalPosition(EntityID, x, y, z) then GetX/GetZ for local coords
- Macro InitImage() used for image reset
- The procedure has Static variables for line drawing continuity
- #PB_Material_Add for additive blending
- MaterialCullingMode(0, 1) for specific culling
- #PB_2DDrawing_Outlined for box outline
- Uses #PB_Relative|#PB_World combined flags for rotation
