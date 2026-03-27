; ------------------------------------------------------------
;
;   PureBasic - WorldShadows
;
;    (c) Fantaisie Software
;
; ------------------------------------------------------------

EnableExplicit

Define.f KeyX, KeyY, MouseX, MouseY

#CameraSpeed = 0.2

InitEngine3D()
InitSprite()
InitKeyboard()
InitMouse()

ExamineDesktops()
Define dx = DesktopWidth(0) * 0.8
Define dy = DesktopHeight(0) * 0.8
OpenWindow(0, 0, 0, DesktopUnscaledX(dx), DesktopUnscaledY(dy), " WorldShadows - [Esc] quit", #PB_Window_ScreenCentered)
OpenWindowedScreen(WindowID(0), 0, 0, dx, dy, 0, 0, 0)

Add3DArchive(#PB_Compiler_Home + "examples/3d/Data/Main",     #PB_3DArchive_FileSystem)
Add3DArchive(#PB_Compiler_Home + "examples/3d/Data/Models",   #PB_3DArchive_FileSystem)
Add3DArchive(#PB_Compiler_Home + "examples/3d/Data/Textures", #PB_3DArchive_FileSystem)
Add3DArchive(#PB_Compiler_Home + "examples/3d/Data/Packs/desert.zip", #PB_3DArchive_Zip)
Parse3DScripts()

WorldShadows(#PB_Shadow_Additive)
;WorldShadows(#PB_Shadow_TextureAdditive, 1, $444444, 2048)

; Camera
Define Camera = CreateCamera(#PB_Any, 0, 0, 100, 100)
MoveCamera(Camera, -10, 5, -20, #PB_Absolute)
CameraLookAt(Camera, 0, 0, 0)

; Light
CreateLight(#PB_Any, $ffffff, 40, 20, 20)

; Materials
Define WoodMaterial = CreateMaterial(#PB_Any, TextureID(LoadTexture(#PB_Any, "Wood.jpg")))
Define DirtMaterial = CreateMaterial(#PB_Any, TextureID(LoadTexture(#PB_Any, "Dirt.jpg")))

; Ground
Define MeshPlane = CreatePlane(#PB_Any, 100, 100, 10, 10, 15, 15)
Define Ground = CreateEntity(#PB_Any, MeshID(MeshPlane), MaterialID(DirtMaterial))

; Meshes
Define MeshCube   = CreateCube(#PB_Any, 4)
Define MeshSphere = CreateSphere(#PB_Any, 2)
Define MeshLogo   = LoadMesh(#PB_Any, "PureBasic.mesh")

; Entities
Define cube   = CreateEntity(#PB_Any, MeshID(MeshCube),   MaterialID(WoodMaterial),  5, 2, -5)
Define sphere = CreateEntity(#PB_Any, MeshID(MeshSphere),  MaterialID(WoodMaterial),  0, 2,  0)
Define Logo   = CreateEntity(#PB_Any, MeshID(MeshLogo),   MaterialID(WoodMaterial), -5, 3,  5)
ScaleEntity(Logo, 0.2, 0.2, 0.2)

; SkyBox
SkyBox("desert07.jpg")

AmbientColor($555555)

Define Quit

Repeat
  While WindowEvent() : Wend

  If ExamineMouse()
    MouseX = -MouseDeltaX() * 0.05
    MouseY = -MouseDeltaY() * 0.05
  EndIf

  If ExamineKeyboard()
    KeyX = (KeyboardPushed(#PB_Key_Right) - KeyboardPushed(#PB_Key_Left)) * #CameraSpeed
    KeyY = (KeyboardPushed(#PB_Key_Down)  - KeyboardPushed(#PB_Key_Up) - MouseWheel() * 10) * #CameraSpeed
  EndIf

  MoveCamera(Camera, KeyX, 0, KeyY)
  RotateCamera(Camera, MouseY, MouseX, 0, #PB_Relative)

  RotateEntity(Logo, 0, 1, 0, #PB_Relative)

  RenderWorld()
  FlipBuffers()
Until KeyboardPushed(#PB_Key_Escape) Or Quit = 1
