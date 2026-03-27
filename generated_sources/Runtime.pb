;
; ------------------------------------------------------------
;
;   PureBasic - Runtime example
;
;    Generated source - demonstrates Runtime feature
;
; ------------------------------------------------------------
;

EnableExplicit

; Declare a procedure accessible at runtime by name
;
Runtime Procedure MyRuntimeProc()
  Debug "This is a runtime-accessible procedure"
EndProcedure

; Create a variable and expose it at runtime.
Global RuntimeVar.i = 128
Runtime RuntimeVar

Procedure Main()
  ; Show the address of the runtime procedure.
  Debug "MyRuntimeProc() address: " + GetRuntimeInteger("MyRuntimeProc()")

  ; Read the variable value through the runtime system.
  Debug "RuntimeVar value: " + GetRuntimeInteger("RuntimeVar")

  ; Modify the variable through the runtime system.
  SetRuntimeInteger("RuntimeVar", 256)

  ; Confirm the internal variable was changed.
  Debug "RuntimeVar after SetRuntimeInteger: " + RuntimeVar
EndProcedure

Main()
