; Linker requires Reset_Handler
	AREA    Main, CODE, READONLY
	
	ENTRY
	EXPORT Reset_Handler
		
Reset_Handler ; User code starts from next line
	MOV R0, #12
STOP
	ADD R0, R0, #4
	B STOP
	
	END ; End of program