;
; ------------------------------------------------------------
;
;   PureBasic - Recursive File Search Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

; Recursive procedure that searches directories for files
; matching a given extension filter
;
Procedure FileSearch(List FoundFiles.s(), searchDir.s, extensionFilter.s = "")
  Protected entryName.s
  Protected dirID.i

  ; Make sure the directory path ends with the path separator
  If Right(searchDir, 1) <> #PS$
    searchDir + #PS$
  EndIf

  dirID = ExamineDirectory(#PB_Any, searchDir, "")
  If dirID
    While NextDirectoryEntry(dirID)
      entryName = DirectoryEntryName(dirID)

      ; Skip the current and parent directory entries
      If entryName = "." Or entryName = ".."
        Continue
      EndIf

      If DirectoryEntryType(dirID) = #PB_DirectoryEntry_Directory
        ; Recurse into subdirectory
        FileSearch(FoundFiles(), searchDir + entryName + #PS$, extensionFilter)
      ElseIf extensionFilter = "" Or GetExtensionPart(entryName) = extensionFilter
        ; File matches filter (or no filter specified), add it
        If AddElement(FoundFiles())
          FoundFiles() = searchDir + entryName
        EndIf
      EndIf
    Wend

    FinishDirectory(dirID)
  EndIf
EndProcedure

Procedure DisplayResults(List FoundFiles.s())
  ForEach FoundFiles()
    Debug FoundFiles()
  Next
EndProcedure

Procedure Main()
  Define NewList ResultFiles.s()

  ; Search the temporary directory for .txt files.
  FileSearch(ResultFiles(), GetTemporaryDirectory(), "txt")

  ; Display all found files.
  DisplayResults(ResultFiles())
EndProcedure

Main()
