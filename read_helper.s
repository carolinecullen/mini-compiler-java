	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14
	.globl	_read_helper            ## -- Begin function read_helper
	.p2align	4, 0x90
_read_helper:                           ## @read_helper
	.cfi_startproc
## %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	subl	$24, %esp
	calll	L0$pb
L0$pb:
	popl	%eax
	leal	L_.str-L0$pb(%eax), %eax
	movl	-4(%ebp), %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	_scanf
	movl	-4(%ebp), %ecx
	movl	(%ecx), %ecx
	movl	%eax, -8(%ebp)          ## 4-byte Spill
	movl	%ecx, %eax
	addl	$24, %esp
	popl	%ebp
	retl
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%i"


.subsections_via_symbols
