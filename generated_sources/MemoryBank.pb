; MemoryBank.pb - Generated PureBasic Source
; Demonstrates memory allocation, reallocation, string operations in memory

EnableExplicit

Define *Buffer
Define *Pointer
Define *BigBuffer

; Allocate an initial memory buffer
*Buffer = AllocateMemory(512)
If *Buffer = 0
  Debug "Error: Failed to allocate memory"
  End
EndIf

; Write strings into the buffer using CopyMemoryString
*Pointer = *Buffer
CopyMemoryString("PureBasic ", @*Pointer)
CopyMemoryString("Memory ")
CopyMemoryString("Demo")

; Read back the string from the buffer
Debug "Content of buffer: " + PeekS(*Buffer)

; Show the allocated size
Debug "Original buffer size: " + Str(MemorySize(*Buffer)) + " bytes"

; Write some byte values directly
PokeB(*Buffer + 400, 42)
Debug "Poked byte value at offset 400: " + Str(PeekB(*Buffer + 400))

; Write and read a long value
PokeL(*Buffer + 404, 123456)
Debug "Poked long value at offset 404: " + Str(PeekL(*Buffer + 404))

; Reallocate to a bigger buffer
*BigBuffer = ReAllocateMemory(*Buffer, 2048)
If *BigBuffer
  ; Reallocation succeeded - the old content is preserved
  Debug ""
  Debug "Reallocation succeeded"
  Debug "New buffer size: " + Str(MemorySize(*BigBuffer)) + " bytes"
  Debug "Old string content preserved: " + PeekS(*BigBuffer)
  Debug "Old byte value preserved: " + Str(PeekB(*BigBuffer + 400))
  Debug "Old long value preserved: " + Str(PeekL(*BigBuffer + 404))

  ; Fill part of the new memory area
  FillMemory(*BigBuffer + 512, 100, $FF)
  Debug "Filled 100 bytes at offset 512 with 0xFF"

  ; Free the reallocated buffer
  FreeMemory(*BigBuffer)
  Debug "Memory freed successfully"
Else
  ; Reallocation failed - original buffer is still valid
  Debug "Reallocation failed, freeing original buffer"
  FreeMemory(*Buffer)
EndIf

End
