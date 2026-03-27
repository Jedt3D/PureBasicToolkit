; Packer.pb - Generated PureBasic Source
; Demonstrates in-memory compression and decompression

EnableExplicit

Define SelectedFile$
Define FileLen.l
Define *SourceBuf
Define *TargetBuf
Define CompressedSize.l
Define DecompressedSize.l

; Enable the BriefLZ packer (small and fast)
UseBriefLZPacker()

; Let the user pick a file to compress
SelectedFile$ = OpenFileRequester("Select a file to compress", "", "All Files|*.*", 0)

If SelectedFile$ = ""
  End
EndIf

; Open the file for reading
If ReadFile(0, SelectedFile$)
  FileLen = Lof(0)

  If FileLen > 0
    ; Allocate source and target buffers
    *SourceBuf = AllocateMemory(FileLen)
    *TargetBuf = AllocateMemory(FileLen)

    If *SourceBuf And *TargetBuf
      ; Read the entire file into memory
      ReadData(0, *SourceBuf, FileLen)

      ; Compress the data
      CompressedSize = CompressMemory(*SourceBuf, FileLen, *TargetBuf, FileLen)

      If CompressedSize > 0
        ; Decompress back to verify
        DecompressedSize = UncompressMemory(*TargetBuf, CompressedSize, *SourceBuf, FileLen)

        If DecompressedSize = FileLen
          MessageRequester("Compression Result",
                           "Compression and decompression succeeded!" + #LF$ + #LF$ +
                           "Original size:     " + Str(FileLen) + " bytes" + #LF$ +
                           "Compressed size:   " + Str(CompressedSize) + " bytes" + #LF$ +
                           "Decompressed size: " + Str(DecompressedSize) + " bytes", 0)
        Else
          MessageRequester("Error", "Decompression size mismatch!" + #LF$ +
                                    "Expected: " + Str(FileLen) + #LF$ +
                                    "Got: " + Str(DecompressedSize), 0)
        EndIf
      Else
        MessageRequester("Error", "Compression failed. File may be incompressible or too small.", 0)
      EndIf

      FreeMemory(*SourceBuf)
      FreeMemory(*TargetBuf)
    Else
      MessageRequester("Error", "Failed to allocate memory buffers.", 0)
    EndIf
  Else
    MessageRequester("Error", "The selected file is empty.", 0)
  EndIf

  CloseFile(0)
Else
  MessageRequester("Error", "Cannot open the selected file.", 0)
EndIf

End
