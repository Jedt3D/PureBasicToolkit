;
; ------------------------------------------------------------
;
;   PureBasic - StatusBar example
;
;    Generated source - demonstrates status bar creation
;
; ------------------------------------------------------------
;

EnableExplicit

If OpenWindow(0, 100, 150, 300, 100, "PureBasic - StatusBar Example", #PB_Window_SystemMenu | #PB_Window_SizeGadget)

  ; Create a status bar attached to the window
  ;
  If CreateStatusBar(0, WindowID(0))
    AddStatusBarField(100)
    AddStatusBarField(50)
    AddStatusBarField(100)
  EndIf

  ; Set text for each field with different styles
  ;
  StatusBarText(0, 0, "Field 1")
  StatusBarText(0, 1, "Field 2", #PB_StatusBar_BorderLess)
  StatusBarText(0, 2, "Field 3", #PB_StatusBar_Right | #PB_StatusBar_Raised)

  ; Event loop - wait for the window to be closed
  ;
  Repeat
  Until WaitWindowEvent() = #PB_Event_CloseWindow

EndIf
