# Particle.pb - Intermediate Description
## Purpose
Demonstrates the PureBasic particle system with 6 different particle effects: fire, waterfall, snow, fireworks, multicolor torch, and a red circle. Each emitter uses different materials, colors, velocities, and behaviors.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Constants: #CameraSpeed=1
- Variables: KeyX, KeyY, MouseX, MouseY (float), a (float, angle counter), Quit
## Key Libraries/Functions
- Particle: CreateParticleEmitter, ParticleMaterial, ParticleSize, ParticleColorRange, ParticleColorFader, ParticleEmitterDirection, ParticleEmitterAngle, ParticleTimeToLive, ParticleVelocity, ParticleAcceleration, ParticleScaleRate, ParticleAngle, ParticleEmissionRate, MoveParticleEmitter
- Material: CreateMaterial, LoadTexture, TextureID, MaterialID, DisableMaterialLighting, MaterialBlendingMode, SetMaterialAttribute
- Mesh: CreatePlane, MeshID
- Entity: CreateEntity
- Camera: CreateCamera, CameraBackColor, MoveCamera, CameraLookAt
- Constants: #PB_Material_AlphaBlend, #PB_Material_Add, #PB_Material_TAM, #PB_Material_ClampTAM, #PB_Absolute
## Input/Output
- Loads: Dirt.jpg, smoke2.png, flare.png, flaretrail.png, water.png textures
- Displays: 6 particle effects on a dirt ground plane with orbiting camera
- Controls: Esc to quit
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen
3. Add texture archive, parse scripts
4. Create camera with custom back color
5. Create ground plane with dirt texture
6. Create 4 materials with various blending modes (alpha blend, additive)
7. Create 6 particle emitters:
   - #1: Fire (smoke texture, color fading, upward, at position 50,5,50)
   - #2: Waterfall (water texture, downward acceleration, at -50,0,50)
   - #3: Snow (flare texture, slow falling, at 50,40,-50)
   - #4: Fireworks (trail texture, upward burst with gravity, at -50,5,-50)
   - #5: Multicolor torch (smoke texture, dynamic direction, at origin)
   - #6: Red circle (flare texture, scaling down, at origin with moving position)
8. Main loop: orbit camera using cos/sin, animate torch direction and red circle position
9. Exit on Escape
## Important Notes
- Variable 'a' accumulates over time for camera orbit and particle direction animation
- The camera orbits at radius 120, height 30
- Particle emitters #5 and #6 have dynamic behavior updated each frame
- Multiple material blending modes are demonstrated
