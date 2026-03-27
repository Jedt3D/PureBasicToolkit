# CameraView.pb - Intermediate Description

## Purpose
Demonstrates CameraViewX/Y/Width/Height() functions to position a 2D crosshair sprite centered in a camera viewport that occupies only part of the screen.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures.

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), Parse3DScripts(), CreateMaterial(), LoadTexture(), GetScriptMaterial(), CreatePlane(), CreateCube(), CreateEntity(), EntityRenderMode(), CreateCamera(), MoveCamera(), CameraBackColor(), CameraViewX(), CameraViewY(), CameraViewWidth(), CameraViewHeight(), RotateCamera(), MoveCamera(), CreateLight(), AmbientColor(), RenderWorld()
- Sprite: InitSprite(), OpenWindowedScreen(), FlipBuffers()
- Image: UsePNGImageDecoder(), LoadImage(), ResizeImage(), CreateSprite(), StartDrawing(SpriteOutput()), DrawImage(), TransparentSpriteColor(), DisplayTransparentSprite(), SpriteWidth(), SpriteHeight()

## Input/Output
- Loads: Dirt.jpg, Color/Blue script material, viseur-jeux.png (crosshair image), Desert.zip pack
- Displays: A blue cube on dirt ground viewed through a centered camera viewport with a crosshair sprite overlay

## Logic Flow
1. Define input variables including SpriteX, SpriteY
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add archives for textures, models, scripts, desert pack; parse scripts
5. Create ground plane with dirt, blue cube at (0,50,0)
6. Create Camera 1: tiny viewport (50,50,1,1) - hidden helper camera
7. Create Camera 0: viewport at (25,25,50,50) centered, camera at (0,120,500), red background
8. Setup light and ambient color
9. Load crosshair PNG image, resize proportionally using CameraViewWidth ratio
10. Create sprite from image, draw image on sprite, set white as transparent
11. Calculate sprite position: center of camera viewport using CameraViewX/Y + (CameraViewWidth/Height - SpriteWidth/Height) / 2
12. Main loop:
    - Read mouse and keyboard input
    - Rotate and move camera
    - RenderWorld
    - Display transparent crosshair sprite at calculated position
    - FlipBuffers
13. Exit on Escape

## Important Notes
- Camera 1 (tiny 1x1 viewport) is a workaround for an Ogre bug where single camera would be zoomed
- Camera viewport is percentage-based: (25,25,50,50) means centered 50% size
- UsePNGImageDecoder() required before loading PNG files
- Crosshair loaded as image, resized, drawn onto sprite (LoadImage -> CreateSprite -> DrawImage)
- LoadImage uses relative path "Data/Textures/viseur-jeux.png" (not through archive)
- SpriteX/SpriteY calculated once before the loop since viewport doesn't change
