; PureBasic Example: Hello World
; Demonstrates basic syntax and GUI programming

EnableExplicit

; Main procedure
Procedure.i CreateMainWindow()
  Protected window.i
  
  ; Create window with title and size
  window = OpenWindow(#PB_Any, 0, 0, 400, 300, "Hello World", 
                     #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
  
  If window
    ; Add a button
    ButtonGadget(1, 150, 130, 100, 30, "Click Me")
    
    ; Add a text label
    TextGadget(2, 150, 170, 100, 20, "Status: Ready")
  EndIf
  
  ProcedureReturn window
EndProcedure

; Main event loop
Procedure Main()
  Protected window.i, event.i, clickCount.i = 0
  
  window = CreateMainWindow()
  
  If window = 0
    MessageRequester("Error", "Failed to create window")
    End
  EndIf
  
  Repeat
    event = WaitWindowEvent()
    
    Select event
      Case #PB_Event_Gadget
        Select EventGadget()
          Case 1 ; Button clicked
            clickCount + 1
            SetGadgetText(2, "Clicked: " + Str(clickCount))
        EndSelect
        
      Case #PB_Event_CloseWindow
        If EventWindow() = window
          Break
        EndIf
    EndSelect
    
  ForEver
  
  CloseWindow(window)
EndProcedure

Main()
