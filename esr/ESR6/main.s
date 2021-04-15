
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

Data 	DCD 0x000B
Result	DCD 0

Reset_Handler

ENTRY

			;LDR R1,=0x40000200 ; Get the memory location of hexadecimal input
			;LDRB R0,[R1] ; Read Hexadecimal Number from the memory
			;MOV32 R1, 0x20000000
			LDR R0, Data
			CMP R0,#0xA ;Check if hexadecimal number > a(10)
			BLT NEXT
			ADD R0,R0,#0x7 ; if hexadecimal number > a(10)add 0x7. Otherwise skip this instruction
			

NEXT

			ADD R0,R0,#0x30 ;add 0x30(16) and store the ASCII number in RO. 
			MOV32 R3,0X200000FF; load R3 with the address where the result should be stored.
			STR R0,[R3]
			; Store the result in the memory
STOP

   	  B  STOP
 
          END	;End of the program