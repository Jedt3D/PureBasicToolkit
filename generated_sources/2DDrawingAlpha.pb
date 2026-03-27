;
; ------------------------------------------------------------
;
;   PureBasic - 2D Drawing Alpha Channel example file
;
;    (c) Generated PureBasic Example
;
; ------------------------------------------------------------
;

EnableExplicit

Define Width.i, Height.i, x.i, y.i, i.i, Alpha.i
Define w.i, h.i

#box_size = 7

If OpenWindow(0, 0, 0, 800, 600, "Alphachannel demo", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
  LoadFont(0, "Impact", 30)

  ; Create a small test image programmatically (replaces embedded PNG)
  ;
  If CreateImage(2, DesktopScaledX(48), DesktopScaledY(48), 32)
    If StartDrawing(ImageOutput(2))
      DrawingMode(#PB_2DDrawing_AllChannels)
      Box(0, 0, OutputWidth(), OutputHeight(), RGBA(0, 0, 0, 0))
      DrawingMode(#PB_2DDrawing_AlphaBlend)
      Circle(OutputWidth() / 2, OutputHeight() / 2, OutputWidth() / 3, RGBA(255, 128, 0, 200))
      Box(OutputWidth() / 4, OutputHeight() / 4, OutputWidth() / 2, OutputHeight() / 2, RGBA(0, 128, 255, 150))
      StopDrawing()
    EndIf
  EndIf

  ; Alpha channel output image
  ;
  If CreateImage(0, DesktopScaledX(800), DesktopScaledY(600), 32) And StartDrawing(ImageOutput(0))

    Width  = OutputWidth()
    Height = OutputHeight()

    ; Make the whole image transparent
    ;
    DrawingMode(#PB_2DDrawing_AlphaChannel)
    Box(0, 0, Width, Height, $00000000)

    ; The classic overlapping circles
    ;
    DrawingMode(#PB_2DDrawing_AlphaBlend)
    Circle( 75,  75, 50, RGBA(255,   0,   0, 128))
    Circle(125,  75, 50, RGBA(  0, 255,   0, 128))
    Circle(100, 125, 50, RGBA(  0,   0, 255, 128))

    ; DrawAlphaImage with decreasing alpha
    DrawingMode(#PB_2DDrawing_Default)
    x = 20
    For Alpha = 255 To 0 Step -20
      DrawAlphaImage(ImageID(2), x, 210, Alpha)
      x + 20
    Next Alpha

    ; Some DrawText with alpha
    ;
    DrawingFont(FontID(0))
    w = TextWidth("Alphachannel demo")
    h = TextHeight("Alphachannel demo")

    DrawingMode(#PB_2DDrawing_AlphaBlend | #PB_2DDrawing_Transparent)

    ; Draw the text semi-transparent
    DrawText(25, 275, "Alphachannel demo", $40FF0000)
    DrawText(50, 300, "Alphachannel demo", $80FF0000)
    DrawText(75, 325, "Alphachannel demo", $A0FF0000)

    ; Show gradient lines
    ;
    DrawingMode(#PB_2DDrawing_AlphaBlend)
    y = 400
    For i = 0 To 255 Step 4
      Line(25, y, 500, 1, RGBA(0, 0, 255, 255 - i))
      y + 1
    Next i

    ; Labels for drawing mode comparison
    DrawingFont(#PB_Default)
    DrawText( 50, 380, "Default",      $FF000000, $00000000)
    DrawText(150, 380, "AlphaBlend",   $FF000000, $00000000)
    DrawText(250, 380, "AlphaClip",    $FF000000, $00000000)
    DrawText(350, 380, "AlphaChannel", $FF000000, $00000000)
    DrawText(450, 380, "AllChannels",  $FF000000, $00000000)

    ; Compare drawing modes with the test image
    DrawingMode(#PB_2DDrawing_Default)
    DrawImage(ImageID(2), 50, 410)

    DrawingMode(#PB_2DDrawing_AlphaBlend)
    DrawImage(ImageID(2), 150, 410)

    DrawingMode(#PB_2DDrawing_AlphaClip)
    DrawImage(ImageID(2), 250, 410)

    DrawingMode(#PB_2DDrawing_AlphaChannel)
    DrawImage(ImageID(2), 350, 410)

    DrawingMode(#PB_2DDrawing_AllChannels)
    DrawImage(ImageID(2), 450, 410)

    ; Gradient text demonstration
    ;
    DrawingFont(FontID(0))
    DrawingMode(#PB_2DDrawing_AlphaBlend | #PB_2DDrawing_Transparent | #PB_2DDrawing_Gradient)
    LinearGradient(310, 10, 310 + TextWidth("Alphachannel Gradient demo"), 10 + TextHeight("Alphachannel Gradient demo"))
    GradientColor(0.0,  $80FF0000)
    GradientColor(0.25, $FF00FF00)
    GradientColor(0.50, $8000FFFF)
    GradientColor(0.75, $FF0000FF)
    GradientColor(1.0,  $80FF0000)
    DrawText(310, 10, "Alphachannel Gradient demo")

    ; Outlined shapes with gradient fill
    ;
    DrawingMode(#PB_2DDrawing_AlphaBlend | #PB_2DDrawing_Outlined)
    Box(350, 75, 400, 150, $FF0000FF)
    Circle(400, 125, 20, $FF0000FF)
    Circle(600, 125, 20, $FF0000FF)
    Circle(500, 175, 40, $FF0000FF)
    Circle(700, 150, 40, $FFFF0000)
    Box(430, 80, 15, 140, $FF0000FF)

    DrawingMode(#PB_2DDrawing_AlphaBlend | #PB_2DDrawing_Gradient)
    ConicalGradient(550, 150, 0)
    ResetGradientColors()
    GradientColor(0.0,  $FF0000FF)
    GradientColor(0.25, $8000FF00)
    GradientColor(0.5,  $FFFF0000)
    GradientColor(0.75, $8000FFFF)
    GradientColor(1.0,  $FF0000FF)
    FillArea(360, 80, -1)

    StopDrawing()
  EndIf

  ; Solid image for display with checkerboard background
  ;
  If CreateImage(1, DesktopScaledX(800), DesktopScaledY(600), 24) And StartDrawing(ImageOutput(1))

    Width  = OutputWidth()
    Height = OutputHeight()
    Box(0, 0, Width, Height, $FFFFFF)
    For y = 0 To Height Step #box_size * 2
      For x = 0 To Width Step #box_size * 2
        Box(x, y, #box_size, #box_size, $C0C0C0)
        Box(x + #box_size, y + #box_size, #box_size, #box_size, $C0C0C0)
      Next x
    Next y

    ; Draw the alpha image on top
    DrawAlphaImage(ImageID(0), 0, 0)
    StopDrawing()
  EndIf

  ImageGadget(0, 0, 0, 0, 0, ImageID(1))

  Repeat
  Until WaitWindowEvent() = #PB_Event_CloseWindow
EndIf
