; Preference.pb - Generated PureBasic Source
; Demonstrates reading and writing application preferences/configuration files

EnableExplicit

Define PrefsFile$

; Build path for the preferences file in the temp directory
PrefsFile$ = GetTemporaryDirectory() + "PBPrefsDemo.prefs"

; ===== WRITE PREFERENCES =====
If CreatePreferences(PrefsFile$)

  ; Application info group
  PreferenceGroup("Application")
    WritePreferenceString("Name", "Image Editor Pro")
    WritePreferenceString("Version", "2.5.1")
    WritePreferenceLong("BuildNumber", 1042)

  ; Add a comment for readability
  PreferenceComment(" Window position and size settings")
  PreferenceComment("")

  ; Window settings group
  PreferenceGroup("Window")
    WritePreferenceLong("PosX", 250)
    WritePreferenceLong("PosY", 150)
    WritePreferenceLong("Width", 800)
    WritePreferenceLong("Height", 600)
    WritePreferenceFloat("Opacity", 0.95)

  ; Editor settings group
  PreferenceComment(" Editor configuration")
  PreferenceGroup("Editor")
    WritePreferenceString("FontName", "Consolas")
    WritePreferenceLong("FontSize", 12)
    WritePreferenceLong("TabWidth", 4)
    WritePreferenceString("Theme", "Dark")

  ClosePreferences()
  Debug "Preferences written to: " + PrefsFile$
Else
  Debug "Error: Could not create preferences file"
  End
EndIf

; ===== READ PREFERENCES =====
Debug ""
Debug "--- Reading Preferences Back ---"

If OpenPreferences(PrefsFile$)

  ; Read application info
  PreferenceGroup("Application")
    Debug "App Name:     " + ReadPreferenceString("Name", "Unknown")
    Debug "Version:      " + ReadPreferenceString("Version", "0.0")
    Debug "Build Number: " + Str(ReadPreferenceLong("BuildNumber", 0))

  Debug ""

  ; Read window settings
  PreferenceGroup("Window")
    Debug "Window X:      " + Str(ReadPreferenceLong("PosX", 0))
    Debug "Window Y:      " + Str(ReadPreferenceLong("PosY", 0))
    Debug "Window Width:  " + Str(ReadPreferenceLong("Width", 640))
    Debug "Window Height: " + Str(ReadPreferenceLong("Height", 480))
    Debug "Window Opacity:" + StrF(ReadPreferenceFloat("Opacity", 1.0))

  Debug ""

  ; Read editor settings
  PreferenceGroup("Editor")
    Debug "Font:      " + ReadPreferenceString("FontName", "Courier")
    Debug "Font Size: " + Str(ReadPreferenceLong("FontSize", 10))
    Debug "Tab Width: " + Str(ReadPreferenceLong("TabWidth", 8))
    Debug "Theme:     " + ReadPreferenceString("Theme", "Light")

  ; Try reading a non-existent key (returns default)
  Debug ""
  Debug "Non-existent key: " + ReadPreferenceString("MissingKey", "(default value)")

  ClosePreferences()
Else
  Debug "Error: Could not open preferences file for reading"
EndIf

End
