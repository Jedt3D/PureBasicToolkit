# Http.pb - Intermediate Description

## Purpose
Demonstrates URL parsing and modification using GetURLPart() and SetURLPart() functions.

## Application Type
GUI (Debug output only)

## Compiler Flags
None (default GUI mode, Debug output)

## Structure
- Simple linear code with no procedures
- Parses a URL string to extract various parts
- Modifies URL parts and displays results

## Key Libraries/Functions
- GetURLPart() with various #PB_URL_* constants
- SetURLPart() with various #PB_URL_* constants
- #PB_URL_Site, #PB_URL_Port, #PB_URL_Parameters, #PB_URL_Path, #PB_URL_User, #PB_URL_Password

## Input/Output
- Input: Hardcoded URL string
- Output: Debug window showing extracted and modified URL parts

## Logic Flow
1. Define a complex URL with user, password, host, port, path, and query parameters
2. Extract custom parameter "year" using GetURLPart
3. Extract site, port, parameters, path, user, password
4. Print separator
5. Demonstrate SetURLPart to modify site, port, user, password
6. Display modified URLs

## Cross-Platform Notes
- URL parsing is platform-independent

## Important Notes
- Uses custom parameter name ("year") as well as #PB_URL_* constants
- Pure string manipulation, no network activity
