;
; ------------------------------------------------------------
;
;   PureBasic - 2D Drawing example file
;
;    (c) Generated PureBasic Example
;
; ------------------------------------------------------------
;

EnableExplicit

Define Event.i
Define k.i

If OpenWindow(0, 100, 200, 300, 200, "2D Drawing Test")

  ; Create an offscreen image with shapes and text
  ;
  If CreateImage(0, DesktopScaledX(300), DesktopScaledY(200))
    If StartDrawing(ImageOutput(0))
      Circle(100, 100, 50, RGB(0, 0, 255))    ; Blue circle

      Box(150, 20, 20, 20, RGB(0, 255, 0))    ; Green box

      FrontColor(RGB(255, 0, 0))               ; Red lines
      For k = 0 To 20
        LineXY(10, 10 + k * 8, 200, 0)
      Next

      DrawingMode(#PB_2DDrawing_Transparent)
      BackColor(RGB(0, 155, 155))
      FrontColor(RGB(255, 255, 255))
      DrawText(10, 50, "Hello, this is a test")

      StopDrawing()
    EndIf
  EndIf

  ; Display the image in a gadget
  ;
  ImageGadget(0, 0, 0, 0, 0, ImageID(0))

  ; Event loop
  ;
  Repeat
    Event = WaitWindowEvent()
  Until Event = #PB_Event_CloseWindow

EndIf

End
