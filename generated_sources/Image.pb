;
; ------------------------------------------------------------
;
;   PureBasic - Image Creation and Manipulation Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

Define Event.i
Define k.i

If OpenWindow(0, 100, 100, 500, 300, "PureBasic - Image")

  If CreateImage(0, 255, 255)

    StartDrawing(ImageOutput(0))

    For k = 0 To 255
      FrontColor(RGB(k, 0, k))
      Line(0, k, 255, 1)
    Next

    DrawingMode(#PB_2DDrawing_Transparent)
    FrontColor(RGB(255, 255, 255))
    DrawText(40, 50, "An image easily created !")

    StopDrawing()

  EndIf

  ; Copy and resize
  CopyImage(0, 1)
  ResizeImage(1, 100, 100)

  ; Grab a portion of the original
  GrabImage(0, 2, 100, 60, 150, 40)

  ; Display all three images
  ImageGadget(0,  20,  10, 255, 255, ImageID(0))
  ImageGadget(1, 320,  80, 100, 100, ImageID(1))
  ImageGadget(2, 320, 200, 150,  40, ImageID(2))

  Repeat
    Event = WaitWindowEvent()
  Until Event = #PB_Event_CloseWindow

EndIf

End
