;
; ------------------------------------------------------------
;
;   PureBasic - Sound Plugin example
;
;    Generated source - demonstrates OGG sound decoder plugin
;
; ------------------------------------------------------------
;

EnableExplicit

; Initialize the sound system
;
If InitSound() = 0
  MessageRequester("Error", "Cannot initialize the sound system", 0)
  End
EndIf

; Enable OGG Vorbis decoder support
;
UseOGGSoundDecoder()

Define SoundFile$

; Let the user choose a .wav or .ogg file
;
SoundFile$ = OpenFileRequester("Choose a sound file", "", "Wave or OGG files|*.wav;*.ogg", 0)
If SoundFile$
  If LoadSound(0, SoundFile$)
    PlaySound(0, #PB_Sound_Loop)
    MessageRequester("Sound", "Playing the sound in a loop..." + Chr(10) + "Click OK to stop.", 0)
  Else
    MessageRequester("Error", "Cannot load the sound file.", 0)
  EndIf
EndIf

End
