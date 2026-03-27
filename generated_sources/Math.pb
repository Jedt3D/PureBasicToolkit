; Math.pb - Generated PureBasic Source
; Demonstrates trigonometric math functions with animated spiral drawing

EnableExplicit

Define Event.l
Define a.f
Define X.f, Y.f
Define x2.f, y2.f
Define imgW.l, imgH.l

If OpenWindow(0, 200, 200, 400, 400, "Math Functions Demo")

  ImageGadget(0, 0, 0, 400, 400, 0)

  imgW = DesktopScaledX(400)
  imgH = DesktopScaledY(400)
  CreateImage(0, imgW, imgH)

  ; Set initial radius with some randomness
  X = 30 + Random(50)
  Y = X

  ; Create a timer for animation at ~100 fps
  AddWindowTimer(0, 0, 10)

  Repeat
    Event = WaitWindowEvent()

    If Event = #PB_Event_Timer
      ; Increment angle slowly
      a + 0.01

      If StartDrawing(ImageOutput(0))
        ; Random color each frame
        FrontColor(RGB(Random(255), 0, Random(255)))

        ; Compute rotated coordinates using trig
        x2 = X * Cos(a) + Y * Sin(a)
        y2 = X * Sin(a) - Y * Cos(a)

        ; Plot a point at center + offset
        Plot(imgW / 2 + x2, imgH / 2 + y2)

        ; Plot a mirrored point for symmetry
        Plot(imgW / 2 - x2, imgH / 2 - y2)

        StopDrawing()
      EndIf

      ; Update the gadget with new image
      SetGadgetState(0, ImageID(0))
    EndIf

  Until Event = #PB_Event_CloseWindow

EndIf
