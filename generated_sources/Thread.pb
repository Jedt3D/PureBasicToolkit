;
; ------------------------------------------------------------
;
;   PureBasic - Thread example
;
;    Generated source - demonstrates background thread creation
;
; ------------------------------------------------------------
;

EnableExplicit

; Thread procedure that runs in the background
; Outputs a debug message every 2 seconds
;
Procedure AlertThread(Parameter.i)

  Repeat
    Debug "Alert from thread!"
    Delay(2000)
  ForEver

EndProcedure

; Start the background thread
;
CreateThread(@AlertThread(), 0)

; The main thread blocks here until the user clicks OK
;
MessageRequester("Info", "The thread displays an alert every 2 seconds." + #LF$ + "Click OK to end the program.", 0)
