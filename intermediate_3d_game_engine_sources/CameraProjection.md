# CameraProjection.pb - Intermediate Description

## Purpose
Demonstrates CameraProjectionX() and CameraProjectionY() to project 3D coordinates onto 2D screen space. A sprite is displayed at the projected screen position of a particle emitter.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Constants:
- `#CameraSpeed = 1`

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), LoadTexture(), CreateMaterial(), DisableMaterialLighting(), MaterialBlendingMode(), CreateParticleEmitter(), ParticleMaterial(), ParticleTimeToLive(), ParticleEmissionRate(), ParticleVelocity(), ParticleSize(), ParticleColorRange(), MoveParticleEmitter(), ParticleEmitterDirection(), ParticleEmitterX/Y/Z(), CreateCamera(), MoveCamera(), RotateCamera(), CameraProjectionX(), CameraProjectionY(), RenderWorld()
- Sprite: InitSprite(), OpenWindowedScreen(), LoadSprite(), TransparentSpriteColor(), DisplayTransparentSprite(), SpriteWidth(), SpriteHeight(), FlipBuffers()

## Input/Output
- Loads: flare.png texture, Geebee2.bmp sprite
- Displays: Red particle fountain with a 2D sprite overlaid at the emitter's projected screen position

## Logic Flow
1. Define input variables and camera speed constant
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add textures archive
5. Load flare texture, create material with lighting disabled and additive blending
6. Create particle emitter: 10x1x1 box, 80 particles/sec, velocity 100, size 8x8, red-to-black color range
7. Position emitter at (-50,0,0), direction (0,-1,0)
8. Create camera at (0,0,200)
9. Load Geebee2.bmp sprite, set transparent color to magenta
10. Main loop:
    - Read mouse/keyboard input
    - Rotate and move camera
    - RenderWorld()
    - Project emitter 3D position to screen: CameraProjectionX/Y(0, emitterX, emitterY, emitterZ)
    - Center sprite on projected position (subtract half sprite width/height)
    - DisplayTransparentSprite at projected position
    - FlipBuffers
11. Exit on Escape

## Important Notes
- CameraProjectionX/Y must be called after RenderWorld() for accurate results
- Sprite is centered on projection point by subtracting half dimensions
- RollZ variable used in RotateCamera but never initialized (defaults to 0)
- Particle emitter direction is (0,-1,0) - pointing downward
- #PB_Particle_Velocity constant used for ParticleVelocity
