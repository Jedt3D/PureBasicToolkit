# OnError.pb - Intermediate Description

## Purpose
Demonstrates PureBasic's OnError library for runtime error handling: setting up an error handler procedure, catching memory access violations, division by zero, and manually raised errors. Displays detailed error information including register contents.

## Application Type
GUI (uses MessageRequester for error display)

## Compiler Flags
None required (GUI application). NOTE: Debugger must be OFF for this to work properly.

## Structure
- CompilerIf check to ensure debugger is off
- Error handler procedure that collects error details
- OnErrorCall to register the handler
- Several intentional error triggers

## Key Libraries/Functions
- OnErrorCall()
- ErrorMessage(), ErrorCode(), ErrorAddress(), ErrorTargetAddress()
- ErrorLine(), ErrorFile()
- ErrorRegister() with platform-specific register constants
- RaiseError()
- CompilerIf, CompilerSelect, CompilerCase, CompilerEndSelect
- #PB_OnError_InvalidMemory, #PB_OnError_IllegalInstruction
- #PB_Compiler_Debugger, #PB_Compiler_Processor
- #PB_Processor_x86, #PB_Processor_x64
- PokeS()

## Input/Output
- No external input
- Output via MessageRequester showing error details

## Logic Flow
1. Check that debugger is disabled (CompilerIf)
2. Define ErrorHandler procedure that:
   - Collects error message, code, address
   - Checks for invalid memory error to get target address
   - Checks error line info availability
   - Displays register contents based on processor architecture
   - Shows all info in MessageRequester
3. Register error handler with OnErrorCall
4. Trigger error: write to invalid memory address (PokeS at address 123)
5. Trigger error: division by zero
6. Trigger error: RaiseError with illegal instruction code

## Cross-Platform Notes
- Register display differs between x86 (EAX, EBX, etc.) and x64 (RAX, RBX, etc.)
- Uses CompilerSelect on #PB_Compiler_Processor for platform detection

## Important Notes
- MUST have debugger turned off (CompilerIf guard)
- Only the first error will actually trigger since the handler calls End
- Register constants are platform-specific (#PB_OnError_EAX vs #PB_OnError_RAX)
- ErrorLine() returns -1 if line info not available
