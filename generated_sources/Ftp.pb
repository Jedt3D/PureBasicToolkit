;
; ------------------------------------------------------------
;
;   PureBasic - FTP File Upload Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

Define Result.i
Define Progress.i
Define SelectedFile.s

If OpenFTP(0, "127.0.0.1", "test", "test", 0)

  SelectedFile = OpenFileRequester("Choose a file to send", "", "*.*", 0)

  If SelectedFile
    Result = SendFTPFile(0, SelectedFile, "purebasic_uploaded.file", 1)

    Repeat
      Progress = FTPProgress(0)
      Debug Progress
      Delay(300)
    Until Progress = #PB_FTP_Finished Or Progress = #PB_FTP_Error

    If Progress = #PB_FTP_Finished
      Debug "Upload finished successfully"
    Else
      Debug "Upload encountered an error"
    EndIf
  EndIf

  CloseFTP(0)
Else
  MessageRequester("Error", "Can't connect to the FTP server")
EndIf
