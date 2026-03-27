# FetchEntityMaterial.pb - Intermediate Description
## Purpose
Demonstrates FetchEntityMaterial() to copy a material from one entity to another. Creates a sphere with a clouds texture, fetches its material, and applies it to a cube.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures. Uses named constants for all resource IDs (#Camera, #Entity0, #Entity1, #Light, #Material0, #Material1, #Mesh0, #Mesh1, #Texture0).
## Key Libraries/Functions
- FetchEntityMaterial() - copies material from entity to new material ID
- CreateSphere(), CreateCube()
- CreateMaterial(), LoadTexture()
- CreateEntity(), CreateCamera(), CreateLight()
- CameraBackColor(), AmbientColor()
## Input/Output
- Loads: clouds.jpg
- Displays: Sphere and cube side by side, both with clouds texture
- Controls: Esc to quit
## Logic Flow
1. Define constants for all resource IDs
2. Define float variables for input (unused in this simple demo)
3. Initialize subsystems, open window/screen
4. Add textures archive
5. Create material 0 from clouds.jpg texture
6. Create sphere mesh, create entity 0 at x=-60 with material 0
7. FetchEntityMaterial(entity 0, material 1) - copies material
8. Create cube mesh, create entity 1 at x=60 with fetched material 1
9. Create camera with dark red background, position looking at origin
10. Create light, set ambient to 0
11. Main loop: process events, examine keyboard, render, flip
12. Exit on Escape
## Important Notes
- Very simple/clean demo - good example of FetchEntityMaterial usage
- Entity 0 at x=-60, Entity 1 at x=60
- Camera at y=100, z=300 looking at origin
- No mouse interaction, keyboard only for exit
