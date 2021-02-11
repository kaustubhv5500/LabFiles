
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
        LDR   r0, =src              ; r0 = pointer to source block
        LDR   r1, =dst              ; r1 = pointer to destination block
        MOV   r2, #8              ; r2 = number of words to copy
blocktransfer
        LDR   r3, [r0], #4          ; load a word from the source and
        STR   r3, [r1], #4          ; store it to the destination
        SUBS  r2, r2, #1            ; decrement the counter
        BNE   blocktransfer         ; loop till copy is done
STOP
	 MOV R10, R0
	 MOV R11, R1
	 AREA  BlockData, DATA, READWRITE
src     DCW   0xAA,0xFA,0x24,0x32,0x88,0x99,0x69,0x73
dst     DCW   0,0,0,0,0,0,0,0
	 	END