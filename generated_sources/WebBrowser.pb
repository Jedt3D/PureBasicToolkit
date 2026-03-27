;
; ------------------------------------------------------------
;
;   PureBasic - MiniBrowser
;
;    Generated source - demonstrates WebGadget-based browser
;
; ------------------------------------------------------------
;

EnableExplicit

; Procedure to handle window resizing - adjusts gadgets to match new size
;
Procedure ResizeWebWindow()
  ResizeGadget(10, #PB_Ignore, #PB_Ignore, WindowWidth(0), WindowHeight(0) - 52)
  ResizeGadget(4, #PB_Ignore, #PB_Ignore, WindowWidth(0) - 185, #PB_Ignore)
  ResizeGadget(5, WindowWidth(0) - 25, #PB_Ignore, #PB_Ignore, #PB_Ignore)
  ResizeGadget(6, #PB_Ignore, #PB_Ignore, WindowWidth(0), #PB_Ignore)
EndProcedure


If OpenWindow(0, 100, 200, 500, 300, "PureBasic MiniBrowser", #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget | #PB_Window_SizeGadget)

  Define Event.i

  ; Create status bar
  ;
  CreateStatusBar(0, WindowID(0))
    AddStatusBarField(#PB_Ignore)
    StatusBarText(0, 0, "Welcome to the MiniBrowser!", 0)

  ; Navigation buttons
  ;
  ButtonGadget(1,   0, 3, 50, 25, "Back")
  ButtonGadget(2,  50, 3, 50, 25, "Next")
  ButtonGadget(3, 100, 3, 50, 25, "Stop")

  ; URL input field
  ;
  StringGadget(4, 155, 5, 0, 20, "http://www.google.com")

  ; Go button
  ;
  ButtonGadget(5, 0, 3, 25, 25, "Go")

  ; Separator line
  ;
  FrameGadget(6, 0, 30, 0, 2, "", 2)

  ; Web content gadget
  ;
  If WebGadget(10, 0, 31, 0, 0, "http://www.google.com") = 0
    CompilerIf #PB_Compiler_OS <> #PB_OS_Windows
      MessageRequester("Error", "Webkit library not found", 0)
    CompilerEndIf
    End
  EndIf

  ; Enter key shortcut for URL navigation
  ;
  AddKeyboardShortcut(0, #PB_Shortcut_Return, 0)

  ; Bind resize event for real-time gadget adjustment
  ;
  BindEvent(#PB_Event_SizeWindow, @ResizeWebWindow())
  ResizeWebWindow()

  ; Main event loop
  ;
  Repeat
    Event = WaitWindowEvent()

    Select Event
      Case #PB_Event_Gadget
        Select EventGadget()
          Case 1  ; Back button
            SetGadgetState(10, #PB_Web_Back)
          Case 2  ; Next button
            SetGadgetState(10, #PB_Web_Forward)
          Case 3  ; Stop button
            SetGadgetState(10, #PB_Web_Stop)
          Case 5  ; Go button
            SetGadgetText(10, GetGadgetText(4))
        EndSelect

      Case #PB_Event_Menu  ; Enter key shortcut
        SetGadgetText(10, GetGadgetText(4))

    EndSelect

  Until Event = #PB_Event_CloseWindow

EndIf
