	.file	"Pregunta2.c"
	.text
	.section	.rodata
.LC0:
	.string	"El arreglo es: "
.LC1:
	.string	"%i, "
.LC2:
	.string	"%i - Deficiente \n"
.LC3:
	.string	"%i - Perfecto \n"
.LC4:
	.string	"%i - Abundante \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -84(%rbp)
	movl	$0, -88(%rbp)
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L2
.L3:
	call	rand@PLT
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -80(%rbp,%rdx,4)
	movl	-88(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -88(%rbp)
.L2:
	cmpl	$14, -88(%rbp)
	jle	.L3
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, -88(%rbp)
	jmp	.L4
.L8:
	movl	-88(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, %edi
	call	analizarDivisores
	movl	%eax, -84(%rbp)
	movl	-88(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	cmpl	%eax, -84(%rbp)
	jge	.L5
	movl	-88(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L5:
	movl	-88(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	cmpl	%eax, -84(%rbp)
	jne	.L7
	movl	-88(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L7:
	movl	-88(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L6:
	addl	$1, -88(%rbp)
.L4:
	cmpl	$14, -88(%rbp)
	jle	.L8
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	analizarDivisores
	.type	analizarDivisores, @function
analizarDivisores:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$0, -16(%rbp)
	movl	$2, -12(%rbp)
	jmp	.L12
.L14:
	movl	-20(%rbp), %eax
	cltd
	idivl	-12(%rbp)
	movl	%eax, -8(%rbp)
	movl	-20(%rbp), %eax
	cltd
	idivl	-12(%rbp)
	movl	%edx, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L13
	movl	-8(%rbp), %eax
	addl	%eax, -16(%rbp)
.L13:
	addl	$1, -12(%rbp)
.L12:
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jle	.L14
	movl	-16(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	analizarDivisores, .-analizarDivisores
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
