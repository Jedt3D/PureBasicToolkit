;
; ------------------------------------------------------------
;
;   PureBasic - Advanced Splitter Gadget Demonstration
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

#WinWidth  = 640
#WinHeight = 480

Define Event.i
Define k.i

Procedure OnSizeWindow()
  ResizeGadget(5, #PB_Ignore, #PB_Ignore, WindowWidth(0), WindowHeight(0) - 25)
EndProcedure

If OpenWindow(0, 0, 0, #WinWidth, #WinHeight, "PureBasic - Advanced Splitter Demonstration", #PB_Window_SystemMenu | #PB_Window_ScreenCentered | #PB_Window_SizeGadget)

  TextGadget(7, 10, 5, 700, 15, "PureBasic splitter demo with Editor, ScrollArea, ExplorerTree and Web gadgets.")

  ; Create a WebGadget - note: URL parameter usage varies by platform
  WebGadget(0, 10, 10, 300, 20, "http://www.google.com")

  ; Editor gadget with some text lines
  EditorGadget(1, 115, 10, 100, 190)
  For k = 1 To 10
    AddGadgetItem(1, k - 1, "Line " + Str(k))
  Next

  ; Explorer tree for directory browsing
  ExplorerTreeGadget(3, 115, 10, 100, 190, GetHomeDirectory(), #PB_Explorer_AlwaysShowSelection | #PB_Explorer_FullRowSelect | #PB_Explorer_MultiSelect)

  ; Scroll area with a button inside
  ScrollAreaGadget(6, 0, 0, 400, 400, 1000, 1000, 1)
    ButtonGadget(20, 20, 20, 200, 200, "Scroll Area !")
  CloseGadgetList()

  ; Create nested splitters
  SplitterGadget(2, 0, 0, #WinWidth / 2, #WinHeight / 2, 1, 0)
  SplitterGadget(4, 0, 0, #WinWidth, #WinHeight, 3, 2, #PB_Splitter_Vertical)
  SplitterGadget(5, 0, 25, #WinWidth, #WinHeight - 25, 4, 6, #PB_Splitter_Vertical)

  SetGadgetState(5, 500)

  ; Bind resize event for real-time handling
  BindEvent(#PB_Event_SizeWindow, @OnSizeWindow())

  Repeat
    Event = WaitWindowEvent()

    If Event = #PB_Event_Gadget

      Select EventGadget()
        Case 8
          SetGadgetState(5, 333)
          SetGadgetState(2, 333)

        Case 20
          Debug "Scroll area button clicked"

      EndSelect

    EndIf

  Until Event = #PB_Event_CloseWindow

EndIf

End
