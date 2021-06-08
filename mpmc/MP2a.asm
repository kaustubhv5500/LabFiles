; x86 Assembly Program to find the minimum number in a list of numbers stored
; in the memory location.

section	.data

msg	db	'Minimum Number in the List!',0xa	
len	equ	$ - msg		

section	.text
	global _start       

_start:                    
    mov ax, 1000  ; Initialize the data segment
    mov ds, ax
    mov si, 0100  ; Init pointer to length of the list
    mov di, 0200  ; Init pointer to destination
    mov cl, [si]  ; Init the counter to length of the list
    dec cl
    mov al, [si+1] ; Init the first element as min
    inc si
    
_next:
    cmp al, [si+1] ; compare with next element
    jc _noaction
    mov al, [si+1] ; Change the value of min if current is less

_noaction:
    inc si  ; Increment SI
    dec cl  ; Decrement the counter
    jnz _next
    
_end:
    int 3
   
 