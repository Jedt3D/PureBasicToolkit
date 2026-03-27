; PureBasic Example: File I/O Operations
; Demonstrates reading and writing files
; If you run this from the PureBasic IDE, set:
; Compiler > Compiler Options > Executable Format = Console

EnableExplicit

Procedure.i WriteSampleFile(filename.s)
  Protected file.i
  
  file = CreateFile(#PB_Any, filename)
  If file
    WriteStringN(file, "PureBasic File I/O Example")
    WriteStringN(file, "===========================")
    WriteStringN(file, "")
    WriteStringN(file, "This is a sample file.")
    WriteStringN(file, "It contains multiple lines.")
    WriteStringN(file, "")
    WriteStringN(file, "Numbers: 1, 2, 3, 4, 5")
    WriteStringN(file, "Date: " + FormatDate("%yyyy-%mm-%dd", Date()))
    
    CloseFile(file)
    ProcedureReturn #True
  Else
    ProcedureReturn #False
  EndIf
EndProcedure

Procedure ReadFileContent(filename.s)
  Protected file.i, content.s, line.s
  
  If FileSize(filename) >= 0
    file = ReadFile(#PB_Any, filename)
    If file
      PrintN("File contents:")
      PrintN("---------------")
      
      While Not Eof(file)
        line = ReadString(file)
        PrintN(line)
      Wend
      
      CloseFile(file)
      ProcedureReturn #True
    Else
      PrintN("Error: Could not open file for reading")
      ProcedureReturn #False
    EndIf
  Else
    PrintN("Error: File does not exist")
    ProcedureReturn #False
  EndIf
EndProcedure

Procedure.i GetFileSize(filename.s)
  Protected file.i, size.i
  
  If FileSize(filename) >= 0
    file = ReadFile(#PB_Any, filename)
    If file
      size = Lof(file)
      CloseFile(file)
      ProcedureReturn size
    EndIf
  EndIf
  
  ProcedureReturn -1
EndProcedure

Procedure Main()
  Protected filename.s = "sample.txt"
  Protected size.i
  
  If Not OpenConsole()
    End
  EndIf
  
  PrintN("PureBasic File I/O Example")
  PrintN("===========================")
  PrintN("")
  
  ; Check if file exists
  If FileSize(filename) >= 0
    PrintN("File already exists: " + filename)
    PrintN("Size: " + Str(GetFileSize(filename)) + " bytes")
    PrintN("")
  EndIf
  
  ; Write sample file
  PrintN("Writing to file...")
  If WriteSampleFile(filename)
    PrintN("File written successfully")
  Else
    PrintN("Error writing to file")
    End
  EndIf
  
  PrintN("")
  
  ; Read file size
  size = GetFileSize(filename)
  If size >= 0
    PrintN("File size: " + Str(size) + " bytes")
  EndIf
  
  PrintN("")
  
  ; Read and display file
  ReadFileContent(filename)
  
  PrintN("")
  PrintN("File operations completed")
  PrintN("Press Enter to exit...")
  Input()
  CloseConsole()
EndProcedure

Main()

; IDE Options = PureBasic 6.30 - C Backend (MacOS X - arm64)
; ExecutableFormat = Console
; CursorPosition = 9
; FirstLine = 88
; Folding = -
; EnableXP
; DPIAware
