
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
 


A			DCW 0xFFFF
			ALIGN
				
B_			DCW 0xA099
			ALIGN

C			DCW 0x3030
			ALIGN
				
D			DCW 0xABCD
			ALIGN
				
E			DCW 0x0021
			ALIGN
				
F			DCW 0x12FD
			ALIGN
				
R			DCW 0xFD24
			ALIGN

T			DCW 0x6969
			ALIGN


N		DCD 0
		ALIGN
			
Y		DCD 0
		ALIGN
			
Result	DCD 0x20001000

; Loading all registers with values
Reset_Handler
			LDR R0, A
			LDR R1, B_
			LDR R2, C
			LDR R3, D
			LDR R4, E
			LDR R5, F
			LDR R6, R
			LDR R7, T
			LDR R11, N
			LDR R12, Y
   	  
STOP  

; Calculaing N
calc_N
			MUL R8, R3, R3
			MUL R9, R2, R4
			MUL R10, R6, R7
			ADD R11, R8, R9
			SUB R11, R11, R10
			
; Calculating Y
calc_Y		
			MOV R8, #0x0038
			MUL R8, R0, R8
			MOV R9, #0x0056 
			MUL R9, R1, R9
			SUB R8, R8, R9
			
			MOV R9, #0x0043
			MUL R9, R3, R9
			MOV R10, #0x0051
			MUL R10, R4, R10
			ADD R10, R9, R10 
			MUL R8, R8, R10
			
			MOV R10, #0x0023 
			MUL R5, R5, R10
			UDIV R12, R8, R5
			
			; N stored in R11
			; Y stored in R12
			
			; Storing registers in memory location
			LDR R7, Result
			MOV sp, R7
			STMFD sp!, {R11-R12}

   	  B  STOP
 
          END	;End of the program