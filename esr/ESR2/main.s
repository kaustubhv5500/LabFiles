
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
				  
Reset_Handler
start
        LDR   r0, =location1              ; r0 = pointer to source block
        LDR   r1, =location2              ; r1 = pointer to destination block
		LDR	  r4, [r0,#128]			; load end location address of source
        MOV   r2, #8              ; r2 = number of words to copy
blocktransfer
        LDR   r3, [r0], #4          ; load a word from the source and
        STR   r3, [r1], #4          ; store it to the destination
        SUBS  r2, r2, #1			; decrement the counter
		;CMP   r0, r4 
        BNE   blocktransfer         ; loop till copy is done
STOP
	 MOV R10, R0
	 MOV R11, R1
	 AREA  BlockData, DATA, READWRITE
location1     DCW   0xDEAA,0x12FA,0xFF24,0x3342,0xFD88,0xAE99,0x3469,0x3473
location2     DCW   0,0,0,0,0,0,0,0
	 	END