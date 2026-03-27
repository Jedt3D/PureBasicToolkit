# EntityCustomParameter.pb - Intermediate Description
## Purpose
Demonstrates EntityCustomParameter() to pass custom shader parameters (inflate value and color) to entities using a custom GLSL shader. Each entity has independently animated inflate/color values.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures. Uses custom GLSL shader code in strings.
## Key Libraries/Functions
- CreateShader() - creates a custom shader from vertex/fragment GLSL source
- CreateShaderMaterial() - creates material from shader
- EntityCustomParameter() - passes per-entity custom values to shader uniforms
- MaterialShininess()
- CreateTorus() for mesh
- Red(), Green(), Blue() color extraction functions
- RGB(), Random(), Sin(), Radian() math functions
## Input/Output
- Loads: Nothing external (uses custom shaders)
- Displays: 5 torus entities with animated inflate effect and color cycling
- Controls: Esc to quit, mouse button 3 also quits
## Logic Flow
1. Initialize subsystems, open window/screen
2. Create camera, light, set ambient and back color
3. Define vertex and fragment GLSL shader source strings (with % as newline separator)
4. CreateShader from vertex/fragment source
5. CreateShaderMaterial from shader
6. Set material shininess
7. CreateTorus mesh
8. Create 5 entities in a row (x positions -6 to +6, step 3)
9. Main loop:
   a. Process events, examine keyboard/mouse
   b. Increment angle
   c. For each entity: rotate, set custom inflate parameter (Sin wave), set custom color parameter (RGB from Sin waves with phase offsets)
   d. Render and flip
10. Exit on Escape release or mouse button 3
## Important Notes
- Shader source uses % as newline delimiter (replaced internally)
- EntityCustomParameter takes: entity, material layer (0), uniform index, and 4 float values
- Uniform indices in shader comments: einflate is index 1, ecolor is index 2
- Color values must be converted to 0-1 float range for shader
- Uses KeyboardReleased instead of KeyboardPushed for exit
- Uses MouseButton(3) for alternate exit
