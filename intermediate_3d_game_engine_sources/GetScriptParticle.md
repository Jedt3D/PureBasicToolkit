# GetScriptParticle.pb - Intermediate Description

## Purpose
Demonstrates loading and displaying particle effects from script files using GetScriptParticleEmitter(). Cycles through 21 different particle effects every 2.5 seconds.

## Type
3D Engine Demo

## Compiler Flags
None (GUI/3D subsystem auto-detected)

## Structure
- Constants: #CameraSpeed = 10, #MAX = 20
- Variables: KeyX, KeyY, MouseX, MouseY (floats), Time, Particle, Quit (integers), Particle$ (string), i (loop)

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, GetScriptParticleEmitter, HideParticleEmitter, RenderWorld
- Screen: InitSprite, OpenWindowedScreen, FlipBuffers
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed, KeyboardMode
- Mouse: InitMouse, ExamineMouse, MouseDeltaX, MouseDeltaY
- Camera: CreateCamera, MoveCamera, RotateCamera
- DataSection: Restore, Read.s for particle script names

## Input/Output
- Input: Particle script files from OPE/particle_scripts and Scripts directories, textures from OPE/textures
- Output: Displays cycling particle effects in a windowed 3D screen

## Logic Flow
1. Initialize engine, sprite, keyboard, mouse subsystems
2. Calculate desktop-proportional window size (80%)
3. Open window and windowed screen
4. Add 3D archives for textures, models, scripts, particles, OPE resources
5. Parse 3D scripts
6. Restore DataSection "Particles" and load 21 particle emitters via GetScriptParticleEmitter, hiding all initially
7. Create camera at position (0, 0, 100)
8. Main loop:
   a. Process window events
   b. Read mouse movement for camera rotation
   c. Read keyboard for camera movement (arrow keys)
   d. Every 2.5 seconds: hide current particle, advance to next (wrapping at #MAX), show new particle
   e. Rotate and move camera
   f. Render and flip
9. Exit on Escape key or Quit flag

## Important Notes
- Uses DataSection with 21 particle script name strings
- Restore/Read pattern for loading particle names
- Variables Time, Particle, Quit, i are implicitly declared in the reference (need explicit declaration)
- The variable 'dx' and 'dy' are used inline after ExamineDesktops()
