
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
 


location1		;DCW 0x4076
			DCD 0x00000000
			ALIGN
				
location2		;DCW 0x3535
			DCD 0x000000FF
			ALIGN

data1		;DCW 0x3030
			DCD 0xABCD0000
			ALIGN

data2		;DCW 0x3030
			DCD 0x845F3756
			ALIGN
				
data3		DCD 0x2131ABC1
			ALIGN
				
data4		DCD 0x28785845
			ALIGN

data5		DCD 0x84259097
			ALIGN
				
data6		DCD 0x25658395
			ALIGN
				
data7		DCD 0x973B4634
			ALIGN
				
data8		DCD 0x3498595F
			ALIGN
				
data9		DCD 0xFF45EBAC
			ALIGN
				
data10		DCD 0x9347FC48
			ALIGN
				

;Result		DCW 0

Reset_Handler
			;LDR R3, data1
			;LDR R4, data2
			;LDR R5, data3
			;LDR R6, data4
			;LDR R7, data5
			;LDR R8, data6
			;LDR R9, data7
			;LDR R10, data8
			;LDR R11, data9
			;LDR R12, data10

			;LDR R0,=0x08000000   ; Source memory base address 
			;LDR R1,=0x080000FF   ; Destination memory base address
			;MOV R2,#0x0A         ; Counter register with value equal to number of elements in source memory
;label 
			;LDR R3,[R0],#0x1     ; Loading value to temporary register
			;STR R3,[R1],#0x1       ; Storing the value at destination memory
			;SUB R2,R2,#1
			;CMP R2, #00
			;BNE label
			;END
			LDR R0, =location1
			LDR R1, data1
			LDR R2, data2
			LDR R3, data3
			LDR R11, [R3], #0x4
			LDR R4, =location2
loop
			LDMIA R0!,  {R1-R3}
			STMIA R4!, {R1-R3}
			;LDR R4, =location2
			CMP R0, R11
			
			BNE loop
			END
;STOP  
	  
   	  ;B  STOP
 
          END	;End of the program