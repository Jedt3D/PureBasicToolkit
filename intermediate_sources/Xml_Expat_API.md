# Xml_Expat_API.pb - Intermediate Description

## Purpose
Demonstrates using the low-level Expat XML parser API (pb_XML_*) for streaming XML parsing. Reads an XML file in small blocks and processes it through callback handlers for start and end elements.

## Application Type
GUI (uses Debug for output, reads files)

## Compiler Flags
None (standard GUI app)

## Structure
- StartElementHandler() - ProcedureC callback for element start events
  - Receives user data pointer, element name pointer, attributes array pointer
  - Displays element name with indentation based on depth
  - Iterates attribute name/value pairs
- EndElementHandler() - ProcedureC callback for element end events
  - Decrements depth, displays end tag
- Main code: opens file, creates parser, reads in blocks, cleans up

## Key Libraries/Functions
- pb_XML_ParserCreate_() - creates Expat parser instance
- pb_XML_SetUserData_() - sets user data for callbacks
- pb_XML_SetStartElementHandler_() - sets start element callback
- pb_XML_SetEndElementHandler_() - sets end element callback
- pb_XML_Parse_() - feeds data to parser
- pb_XML_GetCurrentLineNumber_() - gets current line for errors
- pb_XML_ErrorString_() - gets error description
- pb_XML_GetErrorCode_() - gets error code
- pb_XML_ParserFree_() - frees parser
- #XML_STATUS_ERROR - error status constant
- ReadFile() / ReadData() / Eof() / CloseFile() - file I/O
- AllocateMemory() / FreeMemory() - buffer management
- PeekS() - reads string from memory pointer

## Input/Output
- Input: Reads XML file from PureBasic examples data
- Output: Debug window showing parsed XML structure

## Logic Flow
1. Open XML file for reading
2. Create Expat parser
3. Set user data (depth counter) and element handlers
4. Allocate small read buffer (20 bytes for demo)
5. Read file in blocks, feeding each to parser
6. Check for parse errors
7. Finalize parsing with empty buffer and final flag
8. Free parser and memory, close file

## Cross-Platform Notes
No platform-specific code

## Important Notes
- CRITICAL: Do NOT use Structure named INTEGER - use INTPTR or similar
- ProcedureC is used for C-calling-convention callbacks
- The small buffer size (20 bytes) is for demonstration - use larger for production
- Attribute array is null-terminated sequence of name/value pointer pairs
