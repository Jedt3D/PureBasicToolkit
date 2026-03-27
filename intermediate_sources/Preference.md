# Preference.pb - Intermediate Description

## Purpose
Demonstrates PureBasic's Preferences library for reading and writing configuration files. Creates a preferences file with groups and key-value pairs, then reads them back.

## Application Type
GUI (uses Debug output)

## Compiler Flags
None required

## Structure
- Creates a preferences file in the temp directory
- Writes groups with string, long, and float values
- Adds comments to the file
- Reads back the values from the file
- Closes preferences

## Key Libraries/Functions
- CreatePreferences(), OpenPreferences(), ClosePreferences()
- PreferenceGroup()
- WritePreferenceString(), WritePreferenceLong(), WritePreferenceFloat()
- ReadPreferenceString(), ReadPreferenceLong(), ReadPreferenceFloat()
- PreferenceComment()
- GetTemporaryDirectory()

## Input/Output
- Writes a .prefs file to the temp directory
- Reads it back
- Output via Debug

## Logic Flow
1. Create preferences file in temp directory
2. Create "Global" group, write app name and version strings
3. Add comments
4. Create "Window" group, write X, Y (long) and Z (float) values
5. Close preferences
6. Re-open the preferences file for reading
7. Read Window group values (X, Y, Z)
8. Read Global group values (app name, version)
9. Close preferences

## Cross-Platform Notes
- GetTemporaryDirectory() returns platform-appropriate temp path

## Important Notes
- CreatePreferences creates/overwrites the file
- OpenPreferences opens for reading
- PreferenceGroup selects the active group
- Read functions take a default value as second parameter
