; Mouse.pb - Generated PureBasic Source
; Demonstrates fullscreen mouse input with sprite following cursor

EnableExplicit

Define x.l, y.l
Define Event.l

; Initialize required subsystems
If InitMouse() = 0 Or InitSprite() = 0 Or InitKeyboard() = 0
  MessageRequester("Error", "Cannot initialize graphics subsystems", 0)
  End
EndIf

; Display instructions
MessageRequester("Mouse Demo", "The sprite will follow your mouse cursor." + #LF$ +
                               "Mouse wheel adjusts horizontal offset." + #LF$ +
                               "Middle button centers cursor." + #LF$ +
                               "Press left or right mouse button to exit.", 0)

; Open fullscreen
If OpenScreen(1920, 1080, 32, "Mouse Demo") = 0
  MessageRequester("Error", "Cannot open screen at 1920x1080x32", 0)
  End
EndIf

; Load a sprite to display at mouse position
LoadSprite(0, #PB_Compiler_Home + "examples/sources/Data/PureBasic.bmp")

; Initialize starting position
x = 400
y = 300

; Main rendering loop
Repeat
  FlipBuffers()
  ClearScreen(RGB(20, 20, 40))

  ExamineKeyboard()
  ExamineMouse()

  ; Get current mouse position
  x = MouseX()
  y = MouseY()

  ; Apply mouse wheel for horizontal offset
  x + MouseWheel() * 10

  ; Middle button centers the cursor on screen
  If MouseButton(#PB_MouseButton_Middle)
    MouseLocate(ScreenWidth() / 2, ScreenHeight() / 2)
  EndIf

  ; Draw the sprite centered on mouse position
  DisplaySprite(0, x - SpriteWidth(0) / 2, y - SpriteHeight(0) / 2)

Until MouseButton(#PB_MouseButton_Left) Or MouseButton(#PB_MouseButton_Right)

End
