	.file	"minmax.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$64, %esp
	call	___main
	movl	$1, 8(%esp)
	movl	$2, 12(%esp)
	movl	$3, 16(%esp)
	movl	$4, 20(%esp)
	movl	$5, 24(%esp)
	movl	$6, 28(%esp)
	movl	$7, 32(%esp)
	movl	$8, 36(%esp)
	movl	$9, 40(%esp)
	movl	$10, 44(%esp)
	movl	$10, 48(%esp)
	movl	8(%esp), %eax
	movl	%eax, 56(%esp)
	movl	56(%esp), %eax
	movl	%eax, 60(%esp)
	movl	$1, 52(%esp)
	jmp	L2
L5:
	movl	52(%esp), %eax
	movl	8(%esp,%eax,4), %eax
	cmpl	60(%esp), %eax
	jge	L3
	movl	52(%esp), %eax
	movl	8(%esp,%eax,4), %eax
	movl	%eax, 60(%esp)
L3:
	movl	52(%esp), %eax
	movl	8(%esp,%eax,4), %eax
	cmpl	56(%esp), %eax
	jle	L4
	movl	52(%esp), %eax
	movl	8(%esp,%eax,4), %eax
	movl	%eax, 56(%esp)
L4:
	addl	$1, 52(%esp)
L2:
	movl	52(%esp), %eax
	cmpl	48(%esp), %eax
	jl	L5
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
