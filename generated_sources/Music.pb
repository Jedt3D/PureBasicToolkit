; Music.pb - Generated PureBasic Source
; Demonstrates music module playback with volume fading

EnableExplicit

Define MusicFile$
Define k.l

; Initialize the sound subsystem
If InitSound() = 0
  MessageRequester("Error", "Sound system is not available.", 0)
  End
EndIf

; Let the user choose a music module file
MusicFile$ = OpenFileRequester("Select Music Module", "", "Music Modules (*.mod;*.xm;*.it)|*.mod;*.xm;*.it|All Files|*.*", 0)

If MusicFile$
  ; Try to load the selected module
  If LoadMusic(0, MusicFile$)

    ; Start playback
    PlayMusic(0)

    ; Show a blocking message while the music plays
    MessageRequester("Music Player", "Music module is now playing." + #LF$ +
                                     "Click OK to begin a fade out.", 0)

    ; Fade the volume from 100 down to 0
    For k = 100 To 0 Step -1
      Delay(15)
      MusicVolume(0, k)
    Next

    ; Stop and free the music
    StopMusic(0)
    FreeMusic(0)

    MessageRequester("Music Player", "Playback finished with fade out.", 0)
  Else
    MessageRequester("Error", "Cannot load the music file. Unsupported format?", 0)
  EndIf
Else
  MessageRequester("Info", "No file was selected.", 0)
EndIf

End
