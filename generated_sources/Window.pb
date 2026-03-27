;
; ------------------------------------------------------------
;
;   PureBasic - Window example
;
;    Generated source - demonstrates basic window operations
;
; ------------------------------------------------------------
;

EnableExplicit

Define Event.i
Define Quit.i

If OpenWindow(0, 100, 200, 195, 260, "PureBasic Window", #PB_Window_SystemMenu | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)

  ; Demonstrate moving the window
  ;
  MessageRequester("Information", "Click to move the window", 0)
  ResizeWindow(0, 200, 200, #PB_Ignore, #PB_Ignore)

  ; Demonstrate resizing the window
  ;
  MessageRequester("Information", "Click to resize the window", 0)
  ResizeWindow(0, #PB_Ignore, #PB_Ignore, 320, 200)

  ; Event loop - process user actions
  ;
  Repeat
    Event = WaitWindowEvent()

    If Event = #PB_Event_CloseWindow
      Quit = 1
    EndIf

  Until Quit = 1

EndIf

End
