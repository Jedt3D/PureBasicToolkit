;
; Program to demonstrate the capabilities of the PureBasic compiler.
;

EnableExplicit

; Standard typed variables
;
Define MyByte.b   = 2        ; Byte (8 bit) variable
Define MyWord.w   = 3000     ; Word (16 bit) variable
Define MyLong.l   = 400000   ; Long (32 bit) variable
Define MyFloat.f  = 125.545  ; Float (32 bit) variable

Define Binary.i = %1011      ; 11 in binary format
Define Hexa.i   = $FF        ; 255 in hexadecimal format

; Variable arithmetic
;
Define Result.l = MyByte + MyWord + MyLong * MyByte

; Structures
;
Structure BasicStructure
  Field1.b
  Field2.w
  Field3.l
EndStructure

; Linked lists
;
NewList TestList.BasicStructure()

AddElement(TestList())
TestList()\Field2 = 1

AddElement(TestList())
TestList()\Field3 = 2

ForEach TestList()
  Debug TestList()\Field2
  Debug TestList()\Field3
Next

End
