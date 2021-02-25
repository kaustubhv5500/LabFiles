
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
		
stack_base      DCD      0x20001000

	
Reset_Handler
start
		LDR r1, =location1
		MOV r2, #8
		
		; Loading r0-r9 with immediate data
		MOV32   r0, #0x3244
		MOV32   r1, #0x3445		
        MOV32   r2, #0xA234              
		MOV32	r3, #0xABCD
		MOV32	r4, #0xFFAD
		MOV32	r5, #0x12AF
		MOV32   r6, #0x2234
		MOV32	r7, #0x34FD
		MOV32	r8, #0x6969
		MOV32	r9, #0xADFD
		LDR	    r10, stack_base ; initializing the stack pointer
		MOV	    sp, r10
		
		
		STMFD   sp!, {r0-r9}   ; pushing onto stack in descending mode

		LDMFD   sp!, {r11-r12} ; loading data from stack into registers
		ADD     r11, r11, r12  ; performing logical operations on the stack
		EOR     r11, r11, r12
		BIC		r11, r11, r12
		MUL		r11, r11, r12
		STMFD   sp!, {r11-r12} ; pushing the updated values in the registers into the stack 
		
		LDMFD	sp!, {r0-r7}   ; popping data from stack into registers in a fully ascending manner
		
		

STOP

	 AREA  BlockData, DATA, READWRITE
location1     DCW   0xDEAA,0x12FA,0xFF24,0x3342,0xFD88,0xAE99,0x3469,0x3473
location2     DCW   0,0,0,0,0,0,0,0
	 	END

	 	END

