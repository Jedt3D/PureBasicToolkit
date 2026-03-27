;
; ------------------------------------------------------------
;
;   PureBasic - XML Expat API example
;
;    Generated source - demonstrates low-level Expat XML parsing
;
; ------------------------------------------------------------
;

EnableExplicit

; Use INTPTR instead of INTEGER to avoid conflict with PureBasic resident
;
Structure INTPTR
  i.i
EndStructure

; Callback for start element events (C calling convention)
; Displays element name and attributes with indentation
;
ProcedureC StartElementHandler(*UserData, *Name, *Args)
  Protected *Depth.INTPTR = *UserData
  Protected *Arg.INTPTR = *Args
  Protected Indent$
  Protected AttName$
  Protected AttValue$

  Indent$ = Space(6 * *Depth\i)
  Debug Indent$ + "Start: " + PeekS(*Name)

  ; Iterate through attribute name/value pairs (null-terminated array)
  ;
  While *Arg\i <> 0
    AttName$ = PeekS(*Arg\i)
    *Arg + SizeOf(Integer)
    AttValue$ = PeekS(*Arg\i)
    *Arg + SizeOf(Integer)
    Debug Indent$ + "             " + AttName$ + "=" + AttValue$
  Wend

  *Depth\i + 1
EndProcedure

; Callback for end element events
;
ProcedureC EndElementHandler(*UserData, *Name)
  Protected *Depth.INTPTR = *UserData
  *Depth\i - 1
  Debug Space(6 * *Depth\i) + "End: " + PeekS(*Name)
EndProcedure


; --- Main program ---

Define Parser.i
Define Depth.i
Define BufferSize.i
Define BytesRead.i
Define *Buffer

If ReadFile(0, #PB_Compiler_Home + "examples/sources/Data/ui.xml")

  ; Initialize parser
  ;
  Parser = pb_XML_ParserCreate_(0)
  Depth = 0
  pb_XML_SetUserData_(Parser, @Depth)
  pb_XML_SetStartElementHandler_(Parser, @StartElementHandler())
  pb_XML_SetEndElementHandler_(Parser, @EndElementHandler())

  ; Small buffer for demonstration (use 1MB+ for real files)
  ;
  BufferSize = 20
  *Buffer = AllocateMemory(BufferSize)

  ; Read and parse in blocks
  ;
  While Not Eof(0)
    BytesRead = ReadData(0, *Buffer, BufferSize)
    If BytesRead > 0
      If pb_XML_Parse_(Parser, *Buffer, BytesRead, #False) = #XML_STATUS_ERROR
        Debug "Parser Error (Line " + Str(pb_XML_GetCurrentLineNumber_(Parser)) + "): " + PeekS(pb_XML_ErrorString_(pb_XML_GetErrorCode_(Parser)), -1, #PB_Ascii)
        Break
      EndIf
    EndIf
  Wend

  ; Finalize parsing
  ;
  pb_XML_Parse_(Parser, *Buffer, 0, #True)
  pb_XML_ParserFree_(Parser)

  FreeMemory(*Buffer)
  CloseFile(0)
Else
  Debug "Cannot open file"
EndIf
