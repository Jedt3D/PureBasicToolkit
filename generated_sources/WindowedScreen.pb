;
; ------------------------------------------------------------
;
;   PureBasic - Windowed Screen example
;
;    Generated source - demonstrates sprites in a windowed screen
;
; ------------------------------------------------------------
;

EnableExplicit

If InitSprite() = 0 Or InitKeyboard() = 0 Or InitMouse() = 0
  MessageRequester("Error", "Cannot initialize sprite system", 0)
  End
EndIf

Define Event.i
Define Quit.i
Define Gadget.i
Define direction.i
Define playerX.i
Define playerY.i
Define mX.i
Define mY.i
Define x.l
Define InputReleased.i
Define clipW.l
Define posInv.l

If OpenWindow(0, 0, 0, 340, 285, "Gadgets and Sprites!", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
  ButtonGadget(1, 10, 10, 100, 25, "Grab input")
  ButtonGadget(2, 120, 10, 100, 25, "Button 2")
  ButtonGadget(3, 230, 10, 100, 25, "Button 3")
  TextGadget(4, 10, 40, 300, 30, "Mouse and keyboard released")

  If OpenWindowedScreen(WindowID(0), DesktopScaledX(10), DesktopScaledX(70), DesktopScaledX(320), DesktopScaledX(200), 0, 0, 0)
    LoadSprite(0, #PB_Compiler_Home + "examples/sources/Data/PureBasicLogo.bmp")

    direction = 1
    playerX = 1
    playerY = 1

    ; Center the mouse-driven sprite
    ;
    mX = (ScreenWidth() - SpriteWidth(0)) / 2
    mY = (ScreenHeight() - SpriteHeight(0)) / 2
    MouseLocate(mX, mY)

    ; Start with released input
    ;
    ReleaseMouse(#True)
    InputReleased = 1

    Repeat
      ; Process all pending window events
      ;
      Repeat
        Event = WindowEvent()

        Select Event
          Case #PB_Event_CloseWindow
            Quit = 1

          Case #PB_Event_Gadget
            Gadget = EventGadget()

            Select Gadget
              Case 1  ; Grab input button
                InputReleased = 0
                ReleaseMouse(#False)
                SetGadgetText(4, "Press F1 to release keyboard and mouse")

              Case 2, 3
                SetGadgetText(4, "Button " + Str(Gadget) + " pressed.")
            EndSelect

        EndSelect

      Until Event = 0

      ExamineKeyboard()

      If InputReleased = 0

        If ExamineMouse()
          mX = MouseX()
          mY = MouseY()
        EndIf

        ; Arrow key movement for the player sprite
        ;
        If KeyboardPushed(#PB_Key_Up)    And playerY > 0   : playerY - 3 : EndIf
        If KeyboardPushed(#PB_Key_Down)  And playerY < 280 : playerY + 3 : EndIf
        If KeyboardPushed(#PB_Key_Left)  And playerX > 0   : playerX - 3 : EndIf
        If KeyboardPushed(#PB_Key_Right) And playerX < 300 : playerX + 3 : EndIf

        If KeyboardPushed(#PB_Key_F1)
          ReleaseMouse(#True)
          InputReleased = 1
          SetGadgetText(4, "Mouse and keyboard released")
        EndIf
      EndIf

      ; Clear and render sprites
      ;
      ClearScreen(RGB(0, 0, 0))

      clipW = x / 8
      ClipSprite(0, 0, 0, x, clipW)
      DisplaySprite(0, x, 100)
      DisplaySprite(0, x, x)

      posInv = 300 - x
      DisplaySprite(0, posInv, x)
      DisplaySprite(0, playerX, playerY)

      ClipSprite(0, #PB_Default, #PB_Default, #PB_Default, #PB_Default)
      DisplaySprite(0, mX, mY)

      x + direction
      If x > 300 : direction = -1 : EndIf
      If x < 0   : direction =  1 : EndIf

      FlipBuffers()

    Until Quit Or KeyboardPushed(#PB_Key_Escape)
  Else
    MessageRequester("Error", "Cannot open windowed screen!", 0)
  EndIf
EndIf
