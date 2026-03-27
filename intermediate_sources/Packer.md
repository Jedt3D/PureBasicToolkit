# Packer.pb - Intermediate Description

## Purpose
Demonstrates in-memory data compression and decompression using PureBasic's Packer library. Reads a file into memory, compresses it, decompresses it, and verifies the result.

## Application Type
GUI (uses MessageRequester and OpenFileRequester)

## Compiler Flags
None required (GUI application)

## Structure
- Selects a packer algorithm (BriefLZ)
- Opens a file via requester
- Reads file into memory
- Compresses the data
- Decompresses back
- Verifies sizes match
- Reports results

## Key Libraries/Functions
- UseBriefLZPacker()
- OpenFileRequester()
- ReadFile(), Lof(), ReadData(), CloseFile()
- AllocateMemory(), FreeMemory()
- CompressMemory(), UncompressMemory()
- MessageRequester()

## Input/Output
- Input: user-selected file read into memory
- Output: compression results via MessageRequester

## Logic Flow
1. Enable BriefLZ packer
2. Open file requester, read selected file
3. Get file length with Lof()
4. Allocate source and target buffers
5. Read entire file into source buffer
6. Compress source to target
7. Decompress target back to source
8. Compare decompressed size with original
9. Show success/failure message with sizes
10. Free memory, close file

## Cross-Platform Notes
No platform-specific code

## Important Notes
- UseBriefLZPacker() must be called before compress/uncompress
- Target buffer should be at least as large as source for safety
- CompressMemory returns compressed size (0 on failure)
- Lof() returns file length after opening
