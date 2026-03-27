# CGI.pb - Intermediate Description

## Purpose
Demonstrates CGI (Common Gateway Interface) programming: initializes CGI, reads request, outputs HTML with all CGI variables.

## Application Type
CGI (console executable for web server)

## Compiler Flags
-cl (console app)

## Structure
- Procedure WriteCGIConstant(Constant$) - helper to output a CGI variable
- No structures

## Key Libraries/Functions
- CGI: InitCGI, ReadCGI, WriteCGIHeader, WriteCGIString, CGIVariable
- CGI constants: #PB_CGI_AuthType, #PB_CGI_ContentLength, etc.

## Input/Output
- Input: CGI environment variables from web server
- Output: HTML page listing all CGI variables

## Logic Flow
1. Initialize CGI and read request
2. Write content-type header
3. Output HTML header
4. Loop through all CGI constants, writing each as HTML
5. Output HTML footer

## Cross-Platform Notes
- Works on any platform with a web server

## Important Notes
- Must be compiled as console app (-cl flag)
- Needs to be placed in web server's cgi-bin directory
