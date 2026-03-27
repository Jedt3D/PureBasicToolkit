;
; ------------------------------------------------------------
;
;   PureBasic - Sound example
;
;    Generated source - demonstrates WAV sound playback
;
; ------------------------------------------------------------
;

EnableExplicit

; Initialize the sound system
;
If InitSound() = 0
  MessageRequester("Error", "Sound system is not available", 0)
  End
EndIf

Define SoundFile$

; Let the user choose a .wav file
;
SoundFile$ = OpenFileRequester("Choose a .wav file", "", "Wave files|*.wav", 0)
If SoundFile$
  If LoadSound(0, SoundFile$)
    PlaySound(0, #PB_Sound_Loop)
    MessageRequester("Sound", "Playing the sound in a loop..." + #LF$ + "Click OK to stop.", 0)
  Else
    MessageRequester("Error", "Cannot load the sound file.", 0)
  EndIf
EndIf

End
