; x86 Assembly Program to perform bubble sort on a list of numbers stored
; in the memory location.

section .data

msg db  'Bubble Sort!',0xa  
len equ $ - msg     

section .text
    global _start       

_start:                    
    mov ax, 1000h  ; Initialize the data segment
    mov ds, ax
    mov si, 0100h ; Init pointer to length of the list
    mov cx, [si]  ; Init the loop counter 1 to N-1
    dec cx
    
_outerloop:
    mov si, 0100h ; Init the source pointer
    inc si
    mov dx, cx    ; Init loop counter 2 to N-1
    
_innerloop:
    mov ax, [si]
    mov bx, [si+1]
    cmp ax, bx
    jb _next
    mov [si], bx
    mov [si+1], bx
    
_next:
    inc si
    dec dx
    jnz _innerloop
    loop _outerloop

_end:
    int 3h
   
 