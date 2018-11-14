	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14
	.globl	_malloc_helper          ## -- Begin function malloc_helper
	.p2align	4, 0x90
_malloc_helper:                         ## @malloc_helper
	.cfi_startproc
## %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	8(%ebp), %ecx
	movl	%ecx, (%esp)
	movl	%eax, -8(%ebp)          ## 4-byte Spill
	calll	_malloc
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	addl	$24, %esp
	popl	%ebp
	retl
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
