;
; ------------------------------------------------------------
;
;   PureBasic - Unicode/UTF-8/ASCII Conversion example
;
;    Generated source - demonstrates string encoding conversions
;
; ------------------------------------------------------------
;

EnableExplicit

; Helper procedure: store an ASCII representation inside a unicode variable
;
Procedure$ ConvertToAscii(InputStr.s)
  Protected outStr.s = Space(Len(InputStr))
  PokeS(@outStr, InputStr, -1, #PB_Ascii)
  ProcedureReturn outStr
EndProcedure

; Helper procedure: recover a unicode string from ASCII-in-unicode storage
;
Procedure$ ConvertFromAscii(InputStr.s)
  ProcedureReturn PeekS(@InputStr, -1, #PB_Ascii)
EndProcedure

Procedure PauseForDebugger()
  Debug "----- Hit F7 To Continue -----"
  Debug ""
  CallDebugger
EndProcedure

; --- Unicode strings (default in PB 5.50+) ---

Procedure Main()
  Protected MyUnicodeStr.s = "Hello"
  Protected Size.i
  Protected *AsciiBuffer
  Protected *Utf8Buffer
  Protected AsciiInUnicode.s
  Protected RecoveredText.s

  ; Display unicode string.
  Debug "=== UNICODE ==="
  Size = StringByteLength(MyUnicodeStr)
  Debug MyUnicodeStr
  Debug "Byte length: " + Str(Size)
  ShowMemoryViewer(@MyUnicodeStr, Size)
  PauseForDebugger()

  ; Unicode -> ASCII conversion.
  Debug "=== Unicode -> ASCII ==="
  *AsciiBuffer = Ascii(MyUnicodeStr)
  Size = MemorySize(*AsciiBuffer)
  Debug PeekS(*AsciiBuffer, -1, #PB_Ascii)
  Debug "Buffer size: " + Str(Size)
  ShowMemoryViewer(*AsciiBuffer, Size)
  PauseForDebugger()

  ; Unicode -> UTF-8 conversion.
  Debug "=== Unicode -> UTF-8 ==="
  *Utf8Buffer = UTF8(MyUnicodeStr)
  Size = MemorySize(*Utf8Buffer)
  Debug PeekS(*Utf8Buffer, -1, #PB_UTF8)
  Debug "Buffer size: " + Str(Size)
  ShowMemoryViewer(*Utf8Buffer, Size)
  PauseForDebugger()

  ; ASCII -> Unicode conversion.
  Debug "=== ASCII -> Unicode ==="
  MyUnicodeStr = PeekS(*AsciiBuffer, MemorySize(*AsciiBuffer), #PB_Ascii)
  Size = StringByteLength(MyUnicodeStr)
  Debug MyUnicodeStr
  Debug "Byte length: " + Str(Size)
  ShowMemoryViewer(@MyUnicodeStr, Size)
  PauseForDebugger()

  ; UTF-8 -> Unicode conversion.
  Debug "=== UTF-8 -> Unicode ==="
  MyUnicodeStr = PeekS(*Utf8Buffer, MemorySize(*Utf8Buffer), #PB_UTF8)
  Size = StringByteLength(MyUnicodeStr)
  Debug MyUnicodeStr
  Debug "Byte length: " + Str(Size)
  ShowMemoryViewer(@MyUnicodeStr, Size)
  PauseForDebugger()

  ; ToAscii / FromAscii helper demo.
  Debug "=== ConvertToAscii ==="
  AsciiInUnicode = ConvertToAscii("Hello")
  Debug AsciiInUnicode
  Size = StringByteLength(AsciiInUnicode)
  Debug "Byte length: " + Str(Size)
  ShowMemoryViewer(@AsciiInUnicode, Size)
  PauseForDebugger()

  Debug "=== ConvertFromAscii ==="
  RecoveredText = ConvertFromAscii(AsciiInUnicode)
  Debug RecoveredText
  Size = StringByteLength(RecoveredText)
  Debug "Byte length: " + Str(Size)
  ShowMemoryViewer(@RecoveredText, Size)

  If *AsciiBuffer
    FreeMemory(*AsciiBuffer)
  EndIf

  If *Utf8Buffer
    FreeMemory(*Utf8Buffer)
  EndIf

  Debug ""
  Debug "END"
EndProcedure

Main()
