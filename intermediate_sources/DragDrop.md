# DragDrop.pb - Intermediate Description

## Purpose
Demonstrates drag and drop functionality: text, image, file, and private drag types between source and target gadgets.

## Application Type
GUI

## Compiler Flags
None

## Structure
- Enumerations for images and gadgets
- No procedures or structures

## Key Libraries/Functions
- DragDrop: EnableGadgetDrop, DragText, DragImage, DragFiles, DragPrivate
- Events: EventDropText, EventDropImage, EventDropFiles, #PB_Event_GadgetDrop, #PB_EventType_DragStart
- Gadgets: ListIconGadget, ImageGadget, ExplorerListGadget
- Image: CreateImage, ImageID
- Drawing: StartDrawing, ImageOutput, Box, Circle, DrawText

## Input/Output
- No file I/O (explorer gadget browses files)
- Output: GUI window with drag sources and drop targets

## Logic Flow
1. Create source and target images
2. Open window with source gadgets (text, image, files, private)
3. Create target gadgets
4. Enable drop on each target for specific types
5. Event loop handling DragStart and GadgetDrop events
6. DragStart: initiate drag from source gadgets
7. GadgetDrop: receive dropped data in target gadgets

## Cross-Platform Notes
- Private drag only works within the application
- Text/image/file drag works cross-application

## Important Notes
- Uses #PB_Drop_Private with type IDs (1 and 2)
- ExplorerListGadget with #PB_Explorer_MultiSelect
- #PB_2DDrawing_NativeText for text on images
- FileSize used to check file existence (-1 = not found)
