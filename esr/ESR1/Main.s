
         PRESERVE8
          THUMB       
 

 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD  0x20001000     
          DCD  Reset_Handler  
  
          ALIGN
 
; The program
; Linker requires Reset_Handler
 
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler
;;;;;;;;;;User Code Starts from the next line;;;;;;;;;;;;

   	  MOV R0, #0x9734
 	  MOV32 R2, #0x53354234
	  MOV32 R5, #0x94556434
	  MOV R6, #0x6369

STOP
	  ADD R3, R0, R6
	  ADC R11, R2, R3
	  MLA R12, R0, R7, R6
	  MUL R8, R0, R6
	  UDIV R4, R0, R6
	  RSB R7, R0, R6
	  ASR R12, R0, #2
	  SUB R6, R0
	  SBC R3, R6
	  ORR R0, R2
	  CMP R0, R6
	  ADD R9, R2, R5
	  LSR R2, #3
	  MLS R0, R6, R3, R11
	  UMULL R10, R11, R5, R2
	  
	  B  STOP
 
          END	;End of the program