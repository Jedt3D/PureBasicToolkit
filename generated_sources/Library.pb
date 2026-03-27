;
; ------------------------------------------------------------
;
;   PureBasic - Shared Library Loading Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

Define *FuncPtr
Define *Buffer

CompilerSelect #PB_Compiler_OS

  CompilerCase #PB_OS_Windows

    If OpenLibrary(0, "USER32.DLL")
      *FuncPtr = GetFunction(0, "MessageBoxW")
      If *FuncPtr
        CallFunctionFast(*FuncPtr, 0, @"Body", @"Title", 0)
      EndIf
      CloseLibrary(0)
    EndIf

  CompilerCase #PB_OS_Linux

    If OpenLibrary(0, "libc.so")
      *FuncPtr = GetFunction(0, "malloc")
      If *FuncPtr
        *Buffer = CallCFunctionFast(*FuncPtr, 128)
        If *Buffer
          Debug "Buffer allocated successfully"
          CallCFunction(0, "free", *Buffer)
        EndIf
      EndIf
      CloseLibrary(0)
    EndIf

  CompilerCase #PB_OS_MacOS

    If OpenLibrary(0, "libc.dylib")
      *FuncPtr = GetFunction(0, "malloc")
      If *FuncPtr
        *Buffer = CallCFunctionFast(*FuncPtr, 128)
        If *Buffer
          Debug "Buffer allocated successfully"
          CallCFunction(0, "free", *Buffer)
        EndIf
      EndIf
      CloseLibrary(0)
    EndIf

CompilerEndSelect
