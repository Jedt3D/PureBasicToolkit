# EnableManualEntityBoneControl.pb - Intermediate Description

## Purpose
Demonstrates EnableManualEntityBoneControl() for manually rotating and moving individual bones of a skeletal mesh. A wireframe robot with numbered bones that can be manipulated with keyboard controls.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Uses Dim Bone.s(18) array for bone names.

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld
- Entity: CreateEntity, RotateEntity, EnableManualEntityBoneControl, RotateEntityBone, MoveEntityBone
- Mesh: LoadMesh
- Material: CreateMaterial, MaterialShadingMode, LoadTexture
- Text3D: CreateText3D, Text3DColor, Text3DAlignment, ScaleText3D, AttachEntityObject
- Camera: CreateCamera, MoveCamera
- SkyBox
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed, KeyboardReleased
- Mouse: InitMouse, ExamineMouse, MouseDeltaX, MouseDeltaY
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers

## Input/Output
- Loads: robot.mesh, r2skin.jpg, stevecube.jpg (skybox), font resources
- Displays: Wireframe robot with numbered bone labels, manipulable with keyboard

## Logic Flow
1. Define macro Text3D for creating and configuring 3D text labels
2. Initialize engine, sprite, keyboard, mouse
3. Open windowed screen, add archives (textures, fonts, models, skybox, scripts), parse scripts
4. Load robot mesh, create material with wireframe shading
5. Create robot entity
6. Loop through 18 bones (Joint1 to Joint18):
   a. Enable manual bone control for position and rotation
   b. Create numbered Text3D label attached to each bone
7. Rotate robot -70 degrees on Y axis
8. Create skybox and camera
9. Main loop:
    a. Process events, mouse, keyboard
    b. F5 disables manual control for bone 0 (note: Bone(0) is empty - likely a bug in reference)
    c. Left/Right arrows: rotate bone 10 on Y axis
    d. Up/Down arrows: rotate bones 14 and 17 on Z axis
    e. PageUp/PageDown: move bone 7 on X axis
    f. RenderWorld and FlipBuffers
10. Exit on Escape

## Important Notes
- EnableManualEntityBoneControl(entity, boneName$, positionControl, rotationControl)
- RotateEntityBone(entity, boneName$, x, y, z, mode) for bone rotation
- MoveEntityBone(entity, boneName$, x, y, z, mode) for bone translation
- #PB_Material_Wireframe for wireframe rendering mode
- Dim Bone.s(18) creates string array for bone names
- Macro Text3D used to simplify text3D creation (4 params: No, Texte, Color, Alignment)
- Bone names follow pattern "Joint1" through "Joint18"
- #PB_Text3D_HorizontallyCentered | #PB_Text3D_VerticallyCentered for text alignment
- AttachEntityObject(entity, boneName$, Text3DID(i)) attaches text to bone
