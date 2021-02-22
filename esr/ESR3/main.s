
;;; Directives
	PRESERVE8
	THUMB
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x20001000
	DCD Reset_Handler ; reset vector
	ALIGN
		AREA MYCODE, CODE, READONLY
			
    ENTRY
    EXPORT Reset_Handler
		
stack_base      DCD      0x00018000

	
Reset_Handler
start
		; Loading r0-r9 with immediate data
		MOV   r0, #0x3244
		MOV   r1, #0x3445		
        MOV   r2, #0xA234              
		MOV	  r3, #0xABCD
		MOV	  r4, #0xFFAD
		MOV	  r5, #0x12AF
		MOV   r6, #0x2234
		MOV	  r7, #0x34FD
		MOV	  r8, #0x6969
		MOV	  r9, #0xADFD
		LDR	  r10, stack_base ; initializing the stack pointer
		MOV	  sp, r10
		
		
		STMFD sp!, {r0-r9} ; loading onto stack in descending mode

STOP

	 	END