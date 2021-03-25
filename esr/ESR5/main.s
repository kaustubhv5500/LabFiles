
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
	
	mov r5, #10 ; counter for length of array
	;ldr r1, =location
	mov32 r1, #0x20000000 ; Memory location of data
	mov32 r8, #0x200000FF ; Memory location where the min and max values are stored
	ldr r3, [r1]
	
; loop to find the maximum number in the array, stores in r7
loop_max
	add r1, r1, #4
	ldr r4, [r1]
	cmp r3, r4
	bhi loop1_max  ; Branch if the value is greater than old max
	mov r7, r4

loop1_max
	subs r5, r5, #01 ; decrement counter
	cmp r5, #00		 ;compare the current value and max
	bne loop_max
	str r7, [r8]     ; store value in memory location

	mov r5, #10
	mov32 r1, #0x20000000
	ldr r3, [r1]

; loop to find the minimum value in the array, stores in r10
loop_min
	add r1, r1, #4
	ldr r4, [r1]
	cmp r3, r4
	bls loop1_min  ; branch if new value is less than old min value
	mov r10, r4
	
loop1_min
	subs r5, r5, #01  ; decrement counter
	cmp r5, #00
	bne loop_min
	add r9, r8, #4
	str r10, [r9]    ; store value in memory location
	
STOP

	 AREA  BlockData, DATA, READWRITE
location     DCD   0xDEAA3484,0x12FA2435,0xFF243555,0x33422444,0xFD885657,0xAE994567,0x34694435,0x34735653, 0xADADADAD, 0x26475864
	 	END