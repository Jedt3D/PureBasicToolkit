;
; ------------------------------------------------------------
;
;   PureBasic - UTF-8 String Detection example
;
;    Generated source - demonstrates UTF-8 detection in memory buffers
;
; ------------------------------------------------------------
;

EnableExplicit

; Procedure to check if a memory buffer contains valid UTF-8 encoded text
; Returns #True if multi-byte UTF-8 sequences are detected, #False otherwise
;
Procedure SeemsUtf8(*StrMem, iLen.i)
  Protected iCnt.i
  Protected byteVal.a
  Protected iNext.i
  Protected iCnt2.i
  Protected iUtf8Found.i = #False

  ; Walk through each byte in the buffer
  ;
  For iCnt = 0 To iLen - 1

    ; Read the current byte value
    ;
    byteVal = PeekA(*StrMem + iCnt)

    ; Determine number of continuation bytes expected based on leading bits
    ; UTF-8 sequences: 1 byte (0xxxxxxx), 2 bytes (110xxxxx),
    ; 3 bytes (1110xxxx), 4 bytes (11110xxx), etc.
    ;
    If (byteVal < $80)
      iNext = 0                                      ; 0xxxxxxx - single byte ASCII
    ElseIf ((byteVal & $E0) = $C0)
      iNext = 1                                      ; 110xxxxx - 2 byte sequence
    ElseIf ((byteVal & $F0) = $E0)
      iNext = 2                                      ; 1110xxxx - 3 byte sequence
    ElseIf ((byteVal & $F8) = $F0)
      iNext = 3                                      ; 11110xxx - 4 byte sequence
    ElseIf ((byteVal & $FC) = $F8)
      iNext = 4                                      ; 111110xx - 5 byte sequence
    ElseIf ((byteVal & $FE) = $FC)
      iNext = 5                                      ; 1111110x - 6 byte sequence
    Else
      ProcedureReturn #False                         ; Invalid leading byte
    EndIf

    ; Validate continuation bytes (must match 10xxxxxx pattern)
    ;
    If iNext > 0
      iUtf8Found = #True
      For iCnt2 = 1 To iNext
        If iCnt + iCnt2 > iLen Or (PeekA(*StrMem + iCnt + iCnt2) & $C0) <> $80
          ProcedureReturn #False
        EndIf
      Next
      iCnt + iCnt2 - 1
    EndIf

  Next

  ProcedureReturn iUtf8Found
EndProcedure


; --- Test the procedure with various encodings ---

Define unicodeStr.s = "Hele"
Define *Mem0
Define *Mem1
Define *Mem2

*Mem0 = AllocateMemory(4)
PokeS(*Mem0, "Hele", 4, #PB_UTF8)         ; UTF-8 buffer with ASCII-only content

*Mem1 = Ascii("Hele")                      ; ASCII buffer
*Mem2 = UTF8("Hele")                       ; UTF-8 buffer (ASCII-only content)

Debug "--- Testing with ASCII-only content ---"
Debug SeemsUtf8(@unicodeStr, 4)            ; #False - unicode internal format
Debug SeemsUtf8(*Mem0, 4)                  ; #False - pure ASCII chars in UTF-8
Debug SeemsUtf8(*Mem1, 4)                  ; #False - ASCII buffer
Debug SeemsUtf8(*Mem2, 4)                  ; #False - ASCII chars only

; Now test with accented characters that produce multi-byte UTF-8
;
PokeS(*Mem0, "He le", 7, #PB_UTF8)
*Mem2 = UTF8("He le")

Debug "--- Testing with multi-byte UTF-8 content ---"
Debug SeemsUtf8(*Mem0, 5)                  ; May detect multi-byte if present
Debug SeemsUtf8(*Mem2, 5)                  ; May detect multi-byte if present
