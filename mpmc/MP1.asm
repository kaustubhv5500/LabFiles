;WAP in x86 assembly to implement block transfer.
;The source block starts from DS:SI while the destination starts from DS:DI.
;DS = 1080, SI = 0100, DI = 0200 

;Step 1 : Initialization
;Step 2 : Main Task i.e. Memory Transfer
;Step 3 : Looping

%include "io.inc"

section	.data
    msg	db	'Hello, world!',0xa	       ;our dear string
    len	equ	$ - msg			;length of our dear string

section	.text
	global CMAIN      ;must be declared for using gcc

CMAIN:                   ;tell linker entry point
    mov  ax, 1000h
    mov ds, ax
    mov si, 0100h
    mov di, 0200h
    mov cx, 06
    cmp si, di
    je _end

_next:
    add si, cx
    dec si
    add di, cx
    dec di
    mov al, [si]
    mov [di], al
    
    dec si
    dec di
    dec cx
    jnz _next

_end:
    int 3

