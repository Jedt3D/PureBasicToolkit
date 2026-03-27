# ImagePlugin.pb - Intermediate Description

## Purpose
Image converter application that loads various image formats (JPEG, PNG, TGA, TIFF, GIF, BMP) and can save in BMP, JPEG, or PNG formats.

## Application Type
GUI

## Compiler Flags
None (default GUI mode)

## Structure
- Enables image decoder and encoder plugins
- Creates toolbar with Open/Save buttons
- Image display in ImageGadget
- File requesters for loading and saving
- Format selection via save requester pattern

## Key Libraries/Functions
- UseJPEGImageDecoder(), UseTGAImageDecoder(), UsePNGImageDecoder(), UseTIFFImageDecoder(), UseGIFImageDecoder()
- UseJPEGImageEncoder(), UsePNGImageEncoder()
- OpenWindow(), CreateToolBar(), ToolBarImageButton(), DisableToolBarButton()
- ImageGadget(), LoadImage(), SaveImage(), SetGadgetState()
- OpenFileRequester(), SaveFileRequester(), SelectedFilePattern()
- GetExtensionPart(), ResizeWindow()
- #PB_ImagePlugin_BMP, #PB_ImagePlugin_JPEG, #PB_ImagePlugin_PNG

## Input/Output
- Input: User selects image files to load
- Output: Displays loaded image, saves in chosen format

## Logic Flow
1. Enable all image decoders and encoders
2. Open window, create toolbar with Open/Save buttons (save disabled initially)
3. Create ImageGadget for display
4. Event loop handles toolbar menu events
5. Open: Use file requester, load image, resize window to fit, enable save button
6. Save: Use save requester, determine format from pattern, ensure correct extension, save
7. Special GIF notice via MessageRequester

## Cross-Platform Notes
- Uses #PB_Compiler_Home for toolbar image paths
- Image plugins work cross-platform

## Important Notes
- Toolbar events come as #PB_Event_Menu
- Uses DesktopUnscaledX/Y for proper window resizing
- GIF files get a special notice pointing to ImagePlugin_GIF.pb
