; Movie.pb - Generated PureBasic Source
; Demonstrates video/movie playback in a window

EnableExplicit

Define MovieFile$

; Initialize movie subsystem
If InitMovie() = 0
  MessageRequester("Error", "Cannot initialize movie playback subsystem", 0)
  End
EndIf

; Ask the user to select a movie file
MovieFile$ = OpenFileRequester("Select a Movie", "", "Video Files|*.avi;*.mpg;*.mp4;*.mov|All Files|*.*", 0)

If MovieFile$
  ; Try to load the selected movie
  If LoadMovie(0, MovieFile$)

    ; Open a window sized to the movie dimensions
    OpenWindow(0, 100, 100, MovieWidth(0), MovieHeight(0), "Movie Player - " + GetFilePart(MovieFile$))

    ; Start playback inside the window
    PlayMovie(0, WindowID(0))

    ; Wait until the user closes the window
    Repeat
    Until WaitWindowEvent() = #PB_Event_CloseWindow

    ; Stop and free the movie
    StopMovie(0)
    FreeMovie(0)
  Else
    MessageRequester("Error", "Unable to load the selected movie file.", 0)
  EndIf
Else
  MessageRequester("Info", "No file was selected.", 0)
EndIf

End
