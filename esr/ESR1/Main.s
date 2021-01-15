
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

   	  MOV R0, #0x122
 	  MOV R2, #0x127
	  MOV R5, #0x69
STOP
	  ADD R1, R0, #4
	  ADD R3,R0,R1
	  SUB R6, R1, R5
	  MUL R7, R0, R3
	  B  STOP
 
          END	;End of the program