;
; ------------------------------------------------------------
;
;   PureBasic - Inlined ASM example file
;
;    (c) Generated PureBasic Example
;
; ------------------------------------------------------------
;

EnableExplicit

CompilerIf #PB_Compiler_Backend = #PB_Backend_Asm And (#PB_Compiler_Processor = #PB_Processor_x86 Or #PB_Compiler_Processor = #PB_Processor_x64)

  Define Value.l = 10

  EnableASM
    MOV Value, 20
    INC Value
  DisableASM

  MessageRequester("ASM Example", "Should be 21: " + Value)

CompilerElse

  MessageRequester("ASM Example", "No supported ASM backend detected.")

CompilerEndIf
