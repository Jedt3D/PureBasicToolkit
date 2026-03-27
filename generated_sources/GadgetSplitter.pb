;
; ------------------------------------------------------------
;
;   PureBasic - Splitter Gadget Demonstration
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
  ResizeGadget(5, #PB_Ignore, #PB_Ignore, WindowWidth(0) - 10, WindowHeight(0) - 45)
EndProcedure

If OpenWindow(0, 100, 120, #WinWidth, #WinHeight, "PureBasic - Splitter Demonstration", #PB_Window_SystemMenu | #PB_Window_ScreenCentered | #PB_Window_SizeGadget)

  HyperLinkGadget(7, 10, 5, 180, 30, "This is a green hyperlink", RGB(0, 255, 0))
  HyperLinkGadget(8, 200, 5, 120, 30, "Click me !", RGB(255, 0, 0))

  SetGadgetFont(8, LoadFont(0, "Courier", 10, #PB_Font_Underline | #PB_Font_Bold))

  TextGadget( 9, 350, 5, 50, 30, "Pos:")
  TextGadget(10, 400, 5, 50, 30, "-")
  TextGadget(11, 450, 5, 50, 30, "-")
  TextGadget(12, 500, 5, 50, 30, "-")

  ; Create the gadgets that will go into splitter panes
  ListIconGadget(0, 115, 10, 100, 190, "Test", 100)
  For k = 0 To 10
    AddGadgetItem(0, -1, "Element " + Str(k))
  Next

  ExplorerListGadget(1, 115, 10, 100, 190, GetHomeDirectory(), #PB_Explorer_AlwaysShowSelection | #PB_Explorer_FullRowSelect | #PB_Explorer_MultiSelect)

  TreeGadget(3, 115, 10, 100, 190)
  For k = 0 To 10
    AddGadgetItem(3, -1, "Hello " + Str(k))
  Next

  PanelGadget(6, 0, 0, 400, 400)
    For k = 1 To 5
      AddGadgetItem(6, -1, "Line " + Str(k))
      ButtonGadget(12 + k, 10, 10, 100, 20, "Test" + Str(k))
    Next
  CloseGadgetList()

  ; Create nested splitters
  SplitterGadget(2, 0, 0, #WinWidth / 2, #WinHeight / 2, 1, 0)
  SplitterGadget(4, 0, 0, #WinWidth, #WinHeight, 3, 2, #PB_Splitter_Vertical | #PB_Splitter_Separator)
  SplitterGadget(5, 5, 40, #WinWidth - 10, #WinHeight - 45, 4, 6, #PB_Splitter_Vertical)

  SetGadgetState(5, 500)

  ; Bind resize event for real-time resizing
  BindEvent(#PB_Event_SizeWindow, @OnSizeWindow())

  Repeat
    Event = WaitWindowEvent()

    If Event = #PB_Event_Gadget

      Select EventGadget()
        Case 8
          SetGadgetState(5, 333)
          SetGadgetState(2, 333)
          SetGadgetText(12, Str(GetGadgetState(5)))

        Case 2
          SetGadgetText(10, Str(GetGadgetState(2)))

        Case 4
          SetGadgetText(11, Str(GetGadgetState(4)))

        Case 5
          SetGadgetText(12, Str(GetGadgetState(5)))

      EndSelect
    EndIf

  Until Event = #PB_Event_CloseWindow
EndIf

End
