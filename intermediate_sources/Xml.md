# Xml.pb - Intermediate Description

## Purpose
Demonstrates PureBasic's XML library for loading and parsing XML files. Displays the XML document tree in a TreeGadget with node names, attributes, and text content. Includes error checking for XML markup errors.

## Application Type
GUI (windowed application with TreeGadget)

## Compiler Flags
None (standard GUI app)

## Structure
- Constants for window, gadget, and XML object IDs
- FillTree() recursive procedure - walks XML node tree
- OpenFileRequester() for file selection
- LoadXML() / XMLStatus() for loading and error checking
- TreeGadget for display
- Recursive tree population

## Key Libraries/Functions
- OpenFileRequester() - file selection
- LoadXML() - loads XML from file
- XMLStatus() / XMLError() / XMLErrorLine() / XMLErrorPosition() - error handling
- MainXMLNode() - gets root node
- XMLNodeType() - checks node type (#PB_XML_Normal)
- GetXMLNodeName() - gets element name
- ExamineXMLAttributes() / NextXMLAttribute() - attribute iteration
- XMLAttributeName() / XMLAttributeValue() - attribute access
- GetXMLNodeText() - gets text content
- ChildXMLNode() / NextXMLNode() - tree traversal
- TreeGadget() / AddGadgetItem() - tree display
- CountGadgetItems() / SetGadgetItemState() - tree expansion

## Input/Output
- Input: User selects an XML file
- Output: TreeGadget showing XML structure with attributes

## Logic Flow
1. User selects XML file via file requester
2. Load XML file
3. Check for markup errors, display if any
4. Open window with TreeGadget
5. Get main XML node
6. Recursively fill tree: for each normal node, add name + attributes + text
7. Expand all tree items
8. Wait for window close

## Cross-Platform Notes
No platform-specific code

## Important Notes
- Even with XML errors, nodes before the error position are accessible
- Uses Chr(34) for quotation marks in attribute display
