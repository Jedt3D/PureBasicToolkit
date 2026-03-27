# Shader.pb - Intermediate Description
## Purpose
Demonstrates CreateShader() and CreateShaderMaterial() for custom GLSL shaders. Creates vertex and fragment shaders with custom lighting, fog, and texture blending. A torus with the custom shader material smoothly blends between two textures using a sine-animated parameter.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures.
## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld
- Shader: CreateShader, CreateShaderMaterial, MaterialShaderTexture, MaterialShaderParameter
- Material: MaterialShininess, ScaleMaterial, MaterialFilteringMode
- Mesh: CreateTorus
- Entity: CreateEntity, RotateEntity
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor, RotateCamera
- Light: CreateLight, AmbientColor
- Math: Sin, Bool
- Constants: #PB_Shader_Fragment, #PB_Shader_Float, #PB_Material_Anisotropic, #PB_Relative
## Input/Output
- Loads: grass.jpg, RustySteel.jpg textures
- Displays: Rotating torus with custom shader blending two textures
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse (chained calls)
2. Open window and windowed screen
3. Add Textures archive and current directory; parse scripts
4. Create camera, light, ambient color, background color
5. Build vertex shader string (GLSL #version 130) with:
   - Model-view-projection transform
   - View/light direction calculation
   - Light attenuation
   - UV coordinate passing
   - Fog factor calculation
6. Build fragment shader string with:
   - Diffuse/specular lighting
   - Two texture sampling with blend parameter
   - Fog mixing
7. Replace "%" with newlines in shader strings
8. CreateShader(0, vert_pg, frag_pg)
9. CreateShaderMaterial(0, 0) - link shader to material
10. Load two textures, set shader textures, shininess, scale, filtering
11. Create torus mesh and entity
12. Main loop:
    - Camera movement with keyboard/mouse/mousewheel
    - Rotate entity
    - Animate blend value using Sin(val) mapped to 0..1
    - MaterialShaderParameter to update blend uniform
    - RenderWorld, FlipBuffers
13. Exit on Escape or middle mouse button
## Important Notes
- Shader source uses "%" as newline placeholder, replaced with #LF$ before compilation
- GLSL uniform naming convention: P25 = MVP matrix, P80 = camera pos, P46 = light pos, etc.
- Custom "blend" uniform for texture interpolation
- Uses GetCurrentDirectory() for additional archive path
- Exit also on MouseButton(3) (middle button)
