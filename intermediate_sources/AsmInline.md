# AsmInline.pb - Intermediate Description

## Purpose
Demonstrates inline assembly (ASM) within PureBasic, modifying a variable directly with MOV and INC instructions.

## Application Type
GUI (uses MessageRequester)

## Compiler Flags
None

## Structure
- No structures or procedures
- Uses CompilerIf to check backend and processor

## Key Libraries/Functions
- Compiler directives: CompilerIf, CompilerElse, CompilerEndIf
- Constants: #PB_Compiler_Backend, #PB_Backend_Asm, #PB_Compiler_Processor, #PB_Processor_x86, #PB_Processor_x64
- ASM: EnableASM, DisableASM, MOV, INC
- MessageRequester

## Input/Output
- Output: MessageRequester showing result (21)

## Logic Flow
1. Check if ASM backend and x86/x64 processor
2. If so, declare variable, use MOV and INC inline ASM
3. Show result in MessageRequester
4. If not supported, show fallback message

## Cross-Platform Notes
- Only works on x86/x64 with ASM backend
- ARM64 (Apple Silicon) will show fallback message

## Important Notes
- Must use EnableExplicit
- CompilerIf block handles non-supported architectures gracefully
