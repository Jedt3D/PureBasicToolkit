; ------------------------------------------------------------
;
;   PureBasic - Camera
;
;    (c) Fantaisie Software
;
; ------------------------------------------------------------
;

EnableExplicit

#CameraSpeed = 1

Define.f KeyX, KeyY, MouseX, MouseY
Define.i Quit
Define.i dx, dy

InitEngine3D()

InitSprite()
InitKeyboard()
InitMouse()

ExamineDesktops()
dx = DesktopWidth(0) * 0.8
dy = DesktopHeight(0) * 0.8
OpenWindow(0, 0, 0, DesktopUnscaledX(dx), DesktopUnscaledY(dy), "Camera - [Esc] quit", #PB_Window_ScreenCentered)
OpenWindowedScreen(WindowID(0), 0, 0, dx, dy, 0, 0, 0)

Add3DArchive(#PB_Compiler_Home + "examples/3d/Data/Textures", #PB_3DArchive_FileSystem)
Add3DArchive(#PB_Compiler_Home + "examples/3d/Data/Models", #PB_3DArchive_FileSystem)

AmbientColor(RGB(0, 200, 0))

CreateMaterial(0, LoadTexture(0, "r2skin.jpg"))
CreateEntity(0, LoadMesh(0, "robot.mesh"), MaterialID(0))
StartEntityAnimation(0, "Walk")

CreateCamera(0, 0, 0, 100, 50)
MoveCamera(0, 0, 20, 250, #PB_Absolute)
CameraBackColor(0, RGB(55, 0, 0))

CreateCamera(1, 0, 50, 100, 50)
MoveCamera(1, 0, 20, -250, #PB_Absolute)
CameraBackColor(1, RGB(25, 25, 25))
RotateCamera(1, 180, 0, 0)

CameraRenderMode(1, #PB_Camera_Wireframe)

Repeat
  While WindowEvent() : Wend

  If ExamineMouse()
    MouseX = -MouseDeltaX() * #CameraSpeed * 0.05
    MouseY = -MouseDeltaY() * #CameraSpeed * 0.05
  EndIf

  If ExamineKeyboard()
    KeyX = (KeyboardPushed(#PB_Key_Right) - KeyboardPushed(#PB_Key_Left)) * #CameraSpeed
    KeyY = (KeyboardPushed(#PB_Key_Down) - KeyboardPushed(#PB_Key_Up)) * #CameraSpeed
  EndIf

  RotateEntity(0, 0, 0.1, 0, #PB_Relative)

  RotateCamera(0, MouseY, MouseX, 0, #PB_Relative)
  MoveCamera(0, KeyX, 0, KeyY)

  RotateCamera(1, -MouseY, -MouseX, 0, #PB_Relative)
  MoveCamera(1, KeyX, 0, KeyY)

  RenderWorld()
  FlipBuffers()
Until KeyboardPushed(#PB_Key_Escape) Or Quit = 1
