# PointPick_2D3D.pb - Intermediate Description
## Purpose
Demonstrates converting 2D mouse screen coordinates to 3D world positions using PointPick. A particle emitter follows the mouse position in 3D space at a configurable depth, with a 2D sprite cursor overlay. Mouse wheel adjusts the depth factor.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Constants: #CameraSpeed=1
- Variables: KeyX, KeyY, MouseX, MouseY, Depth (float, initial 150), Mx, My, Quit
## Key Libraries/Functions
- PointPick: PointPick, PickX, PickY, PickZ
- Particle: CreateParticleEmitter, ParticleEmitterDirection, ParticleMaterial, ParticleTimeToLive, ParticleEmissionRate, ParticleVelocity, ParticleSize, ParticleColorRange, MoveParticleEmitter
- Camera: CreateCamera, MoveCamera, RotateCamera, CameraX, CameraY, CameraZ
- Sprite: LoadSprite, TransparentSpriteColor, DisplayTransparentSprite, SpriteWidth, SpriteHeight
- Material: CreateMaterial, LoadTexture, TextureID, MaterialID, DisableMaterialLighting, MaterialBlendingMode
- Mouse: MouseX(), MouseY(), MouseWheel
- Constants: #PB_Material_Add, #PB_Absolute
## Input/Output
- Loads: flare.png texture, Data/Textures/Geebee2.bmp sprite
- Displays: Particle emitter following mouse in 3D, 2D sprite cursor
- Controls: Mouse moves emitter, wheel adjusts depth, Esc to quit
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen
3. Add texture archive
4. Create flare material with additive blending
5. Create particle emitter with downward direction, green-yellow color range
6. Create camera at (0,0,200) rotated slightly
7. Load 2D sprite for cursor with magenta transparency
8. Main loop:
   a. Mouse wheel adjusts Depth variable
   b. Get mouse position (Mx, My)
   c. PointPick(0, Mx, My) to get 3D direction
   d. Move particle emitter to Camera + Pick*Depth (3D position)
   e. Render world, then display 2D sprite centered on mouse
9. Exit on Escape
## Important Notes
- Mixes 2D sprite rendering with 3D world rendering
- The Depth variable scales the pick direction to control distance from camera
- The sprite is loaded from "Data/Textures/Geebee2.bmp" (relative path in reference)
- RotateCamera(0,0,20,0) gives a slight angle to the camera
- DisplayTransparentSprite is called between RenderWorld and FlipBuffers
