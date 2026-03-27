# Reference Projects - Compilation Results

Compiled on macOS (PureBasic 6.30 - C Backend, MacOS X - arm64)
Syntax check only (`pbcompiler -k`)

## Successfully Compiled (80 projects)

| # | File | Category |
|---|------|----------|
| 1 | 2DDrawing.pb | Graphics |
| 2 | 2DDrawingAlpha.pb | Graphics |
| 3 | Arithmetic.pb | Core/Math |
| 4 | Array.pb | Data Structures |
| 5 | AsmInline.pb | Low-Level |
| 6 | BindEvent.pb | GUI/Events |
| 7 | BindGadgetEvent.pb | GUI/Events |
| 8 | CGI.pb | Network/Web |
| 9 | CanvasGadget.pb | GUI/Gadgets |
| 10 | Cipher.pb | Crypto |
| 11 | Clipboard.pb | System |
| 12 | CompilerSystemData.pb | Compiler |
| 13 | Console.pb | Console |
| 14 | DPI_LoadImage.pb | Graphics/DPI |
| 15 | Database.pb | Database |
| 16 | Date.pb | Date/Time |
| 17 | Desktop.pb | System |
| 18 | Dialog.pb | GUI |
| 19 | DragDrop.pb | GUI |
| 20 | File.pb | File I/O |
| 21 | FileSearch.pb | File System |
| 22 | FileSystem.pb | File System |
| 23 | Font.pb | GUI/Fonts |
| 24 | FontRegister.pb | GUI/Fonts |
| 25 | Ftp.pb | Network |
| 26 | Gadget.pb | GUI/Gadgets |
| 27 | GadgetAdvanced.pb | GUI/Gadgets |
| 28 | GadgetSplitter.pb | GUI/Gadgets |
| 29 | GadgetSplitterAdvanced.pb | GUI/Gadgets |
| 30 | Http.pb | Network |
| 31 | Image.pb | Graphics |
| 32 | ImagePlugin.pb | Graphics |
| 33 | ImagePlugin_GIF.pb | Graphics |
| 34 | Interface.pb | OOP/Advanced |
| 35 | Joystick.pb | Input |
| 36 | Json.pb | Data Format |
| 37 | Keyboard.pb | Input |
| 38 | Library.pb | System/DLL |
| 39 | List.pb | Data Structures |
| 40 | Mail.pb | Network |
| 41 | Map.pb | Data Structures |
| 42 | Math.pb | Core/Math |
| 43 | MemoryBank.pb | Memory |
| 44 | Menu.pb | GUI |
| 45 | Mouse.pb | Input |
| 46 | Movie.pb | Media |
| 47 | Music.pb | Media |
| 48 | NetworkClient.pb | Network |
| 49 | NetworkServer.pb | Network |
| 50 | NetworkTlsClient.pb | Network |
| 51 | NetworkTlsServer.pb | Network |
| 52 | OnError.pb | Error Handling |
| 53 | OpenGLGadget.pb | Graphics/3D |
| 54 | Packer.pb | Compression |
| 55 | PopupMenu.pb | GUI |
| 56 | Preference.pb | Config |
| 57 | Printer.pb | Output |
| 58 | Prototype.pb | Advanced |
| 59 | RegularExpression.pb | String |
| 60 | Requester.pb | GUI |
| 61 | Runtime.pb | Advanced |
| 62 | SerialPort.pb | Hardware |
| 63 | Sort_(Numeric).pb | Data Structures |
| 64 | Sort_(String).pb | Data Structures |
| 65 | Sound.pb | Media |
| 66 | SoundPlugin.pb | Media |
| 67 | Sprite.pb | Graphics |
| 68 | StatusBar.pb | GUI |
| 69 | String Guess UTF8.pb | String |
| 70 | String.pb | String |
| 71 | SysTray.pb | GUI/System |
| 72 | System.pb | System |
| 73 | Thread.pb | Threading |
| 74 | ToolBar.pb | GUI |
| 75 | Unicode_Utf8_Ascii.pb | String/Encoding |
| 76 | WebBrowser.pb | GUI/Web |
| 77 | WebView.pb | GUI/Web |
| 78 | Window.pb | GUI |
| 79 | WindowedScreen.pb | Graphics |
| 80 | Xml.pb | Data Format |

## Skipped - Windows Only (3 projects)

| File | Reason |
|------|--------|
| DLLSample.pb | Uses Windows DLL entry points (AttachProcess/DetachProcess) |
| MDI_ImageViewer.pb | MDIGadget() is Windows-only (CompilerError on non-Windows) |
| SystemFolders.pb | Uses Windows Shell32.dll SHGetKnownFolderPath |

## Failed Compilation (1 project)

| File | Error |
|------|-------|
| AudioCD.pb | `InitAudioCD()` not available on macOS |

## Not in reference_sources (from Makefile but no .pb file found)

| File | Notes |
|------|-------|
| DirectScreenDrawing.pb | Listed in Makefile but not present |
| Help.pb | Listed in Makefile but not present |
| Win32_API.pb | Listed in Makefile but not present (Windows-only) |

## Also present but not in Makefile (5 files)

| File | Status |
|------|--------|
| Xml_Expat_API.pb | OK |
| String Guess UTF8.pb | OK |
| NetworkTlsClient.pb | OK |
| NetworkTlsServer.pb | OK |
| Prototype.pb | OK |
