; OnError.pb - Generated PureBasic Source
; Demonstrates runtime error handling with the OnError library

EnableExplicit

; This example requires the debugger to be turned off
CompilerIf #PB_Compiler_Debugger
  CompilerError "The debugger must be turned OFF for this example to work"
CompilerEndIf

; Error handler procedure - called when a runtime error occurs
Procedure ErrorHandler()
  Protected ErrorMsg$

  ErrorMsg$ = "A runtime error was caught:" + Chr(13) + Chr(13)
  ErrorMsg$ + "Error Message:  " + ErrorMessage() + Chr(13)
  ErrorMsg$ + "Error Code:     " + Str(ErrorCode()) + Chr(13)
  ErrorMsg$ + "Code Address:   " + Str(ErrorAddress()) + Chr(13)

  ; Check if this was an invalid memory access
  If ErrorCode() = #PB_OnError_InvalidMemory
    ErrorMsg$ + "Target Address: " + Str(ErrorTargetAddress()) + Chr(13)
  EndIf

  ; Display source line information if available
  If ErrorLine() = -1
    ErrorMsg$ + "Source Line:    Enable OnError line support for line info." + Chr(13)
  Else
    ErrorMsg$ + "Source Line:    " + Str(ErrorLine()) + Chr(13)
    ErrorMsg$ + "Source File:    " + ErrorFile() + Chr(13)
  EndIf

  ErrorMsg$ + Chr(13)
  ErrorMsg$ + "Register contents:" + Chr(13)

  ; Display CPU registers based on processor architecture
  CompilerSelect #PB_Compiler_Processor
    CompilerCase #PB_Processor_x86
      ErrorMsg$ + "EAX = " + Str(ErrorRegister(#PB_OnError_EAX)) + Chr(13)
      ErrorMsg$ + "EBX = " + Str(ErrorRegister(#PB_OnError_EBX)) + Chr(13)
      ErrorMsg$ + "ECX = " + Str(ErrorRegister(#PB_OnError_ECX)) + Chr(13)
      ErrorMsg$ + "EDX = " + Str(ErrorRegister(#PB_OnError_EDX)) + Chr(13)
      ErrorMsg$ + "EBP = " + Str(ErrorRegister(#PB_OnError_EBP)) + Chr(13)
      ErrorMsg$ + "ESI = " + Str(ErrorRegister(#PB_OnError_ESI)) + Chr(13)
      ErrorMsg$ + "EDI = " + Str(ErrorRegister(#PB_OnError_EDI)) + Chr(13)
      ErrorMsg$ + "ESP = " + Str(ErrorRegister(#PB_OnError_ESP)) + Chr(13)

    CompilerCase #PB_Processor_x64
      ErrorMsg$ + "RAX = " + Str(ErrorRegister(#PB_OnError_RAX)) + Chr(13)
      ErrorMsg$ + "RBX = " + Str(ErrorRegister(#PB_OnError_RBX)) + Chr(13)
      ErrorMsg$ + "RCX = " + Str(ErrorRegister(#PB_OnError_RCX)) + Chr(13)
      ErrorMsg$ + "RDX = " + Str(ErrorRegister(#PB_OnError_RDX)) + Chr(13)
      ErrorMsg$ + "RBP = " + Str(ErrorRegister(#PB_OnError_RBP)) + Chr(13)
      ErrorMsg$ + "RSI = " + Str(ErrorRegister(#PB_OnError_RSI)) + Chr(13)
      ErrorMsg$ + "RDI = " + Str(ErrorRegister(#PB_OnError_RDI)) + Chr(13)
      ErrorMsg$ + "RSP = " + Str(ErrorRegister(#PB_OnError_RSP)) + Chr(13)
      ErrorMsg$ + "(Registers R8-R15 not shown)" + Chr(13)

  CompilerEndSelect

  MessageRequester("OnError Handler", ErrorMsg$)
  End

EndProcedure

; Register the error handler
OnErrorCall(@ErrorHandler())

; Intentionally trigger an invalid memory access error
Define a.l
PokeS(123, "Writing to an invalid memory address")

; Intentionally trigger a division by zero
a = 0
a = 1 / a

; Manually raise an error
RaiseError(#PB_OnError_IllegalInstruction)

; This message should never be displayed
MessageRequester("OnError Demo", "This should not appear - errors should have been caught.")
End
