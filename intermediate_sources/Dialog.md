# Dialog.pb - Intermediate Description

## Purpose
Demonstrates the Dialog library: loading XML UI definition, creating dialog from XML, accessing dialog gadgets by name, and Runtime event procedures.

## Application Type
GUI

## Compiler Flags
None

## Structure
- Runtime Procedure EnableAlphaBlendingEvent() - callback set in XML
- No structures

## Key Libraries/Functions
- Dialog: CreateDialog, OpenXMLDialog, DialogGadget, DialogError
- XML: LoadXML, XMLStatus, XMLError, XMLErrorLine
- Gadget: SetGadgetText
- Window: WaitWindowEvent
- Constants: #PB_XML_Success

## Input/Output
- Input: loads XML file from compiler home examples
- Output: GUI dialog from XML definition

## Logic Flow
1. Load XML UI definition from compiler home
2. Check XML loaded successfully
3. Create and open dialog from XML
4. Get named gadget and modify its text
5. Event loop
6. Error handling for XML and dialog errors

## Cross-Platform Notes
- XML UI definition is platform-independent
- Path uses #PB_Compiler_Home

## Important Notes
- Uses Runtime keyword for procedure visible to XML callbacks
- Requires ui.xml file from PureBasic examples
