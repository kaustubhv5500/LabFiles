
         PRESERVE8
          THUMB       
 

 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors_
 
__Vectors_ 
	  DCD  0x20001000     
          DCD  Reset_Handler_  
  
          ALIGN
 
; The program
; Linker requires Reset_Handler
 
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler_
 


Value1		;DCW 0x4076
			DCD 0x4076AAD1
			ALIGN
				
Value2		;DCW 0x
			DCD 0x2131ABC1
			ALIGN

Value3		;DCW 0x3030
			DCD 0xABCD0000
			ALIGN

Result		DCW 0

Reset_Handler_
			LDR R0, Value1
			LDR R1, Value2
			LDR R2, Value3
   	  
      
STOP  
	  ADD R3, R0, #0x0005 
	  ADC R4, R1, R2
	  SUB R5, R1, R2 
	  SBC R6, R1, R2 
	  MUL R7, R2, R1 
	  UDIV R8, R1, R0 
	  RSB R9, R1, R2
	  MLA R10, R2, R1, R0 
	  UMULL R11, R10, R1, R2 
	  LSR R3, R2, #3
	  LSL R4, R2, #3 
	  ROR R5, R2, #3 
	  ADDNE R6, R11, R2 
	  SUBNE R7, R11, R2 
	  ASR R8, R0, #3
	  ADDEQ R9, R5, #5
	  
	  

   	  B  STOP
 
          END	;End of the program