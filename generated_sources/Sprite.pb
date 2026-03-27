;
; ------------------------------------------------------------
;
;   PureBasic - Sprite example
;
;    Generated source - demonstrates sprite display and animation
;
; ------------------------------------------------------------
;

EnableExplicit

If InitSprite() = 0 Or InitKeyboard() = 0
  MessageRequester("Error", "Sprite system cannot be initialized", 0)
  End
EndIf

Define x.l
Define clipW.l
Define posY.l
Define invX.l

If OpenScreen(800, 600, 32, "Sprite Demo")

  ; Load a sprite from PureBasic's example data
  ;
  LoadSprite(0, #PB_Compiler_Home + "examples/sources/Data/PureBasic.bmp")
  CopySprite(0, 1, 0)

  Repeat

    ; Swap front and back buffers
    ;
    FlipBuffers()

    ; Clear the back buffer to black
    ;
    ClearScreen(RGB(0, 0, 0))

    ; Clip sprite 0 based on current x position
    ;
    clipW = x / 8
    ClipSprite(0, 0, 0, x, clipW)

    ; Display sprites at various positions
    ;
    DisplaySprite(0, x, 100)
    DisplaySprite(1, x, x)

    ; Use temp variable for expression involving subtraction
    ;
    invX = 600 - x
    DisplaySprite(0, invX, x)

    x + 1

    ExamineKeyboard()
  Until KeyboardPushed(#PB_Key_Escape)

Else
  MessageRequester("Error", "Cannot open an 800x600 32-bit screen!", 0)
EndIf
