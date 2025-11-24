	.cpu cortex-m3
	.arch armv7-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"Pregunta2.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"El arreglo es: \000"
	.align	2
.LC1:
	.ascii	"%i, \000"
	.align	2
.LC2:
	.ascii	"\012\000"
	.align	2
.LC3:
	.ascii	"%i - Deficiente \012\000"
	.align	2
.LC4:
	.ascii	"%i - Perfecto \012\000"
	.align	2
.LC5:
	.ascii	"%i - Abundante \012\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #72
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #64]
	movs	r3, #0
	str	r3, [r7, #68]
	movs	r0, #0
	bl	time
	mov	r2, r0
	mov	r3, r1
	mov	r3, r2
	mov	r0, r3
	bl	srand
	ldr	r0, .L10
	bl	printf
	b	.L2
.L3:
	bl	rand
	mov	r2, r0
	ldr	r3, [r7, #68]
	lsls	r3, r3, #2
	adds	r3, r3, #72
	add	r3, r3, r7
	str	r2, [r3, #-68]
	ldr	r3, [r7, #68]
	lsls	r3, r3, #2
	adds	r3, r3, #72
	add	r3, r3, r7
	ldr	r3, [r3, #-68]
	mov	r1, r3
	ldr	r0, .L10+4
	bl	printf
	ldr	r3, [r7, #68]
	adds	r3, r3, #1
	str	r3, [r7, #68]
.L2:
	ldr	r3, [r7, #68]
	cmp	r3, #14
	ble	.L3
	ldr	r0, .L10+8
	bl	printf
	movs	r3, #0
	str	r3, [r7, #68]
	b	.L4
.L8:
	ldr	r3, [r7, #68]
	lsls	r3, r3, #2
	adds	r3, r3, #72
	add	r3, r3, r7
	ldr	r3, [r3, #-68]
	mov	r0, r3
	bl	analizarDivisores
	str	r0, [r7, #64]
	ldr	r3, [r7, #68]
	lsls	r3, r3, #2
	adds	r3, r3, #72
	add	r3, r3, r7
	ldr	r3, [r3, #-68]
	ldr	r2, [r7, #64]
	cmp	r2, r3
	bge	.L5
	ldr	r3, [r7, #68]
	lsls	r3, r3, #2
	adds	r3, r3, #72
	add	r3, r3, r7
	ldr	r3, [r3, #-68]
	mov	r1, r3
	ldr	r0, .L10+12
	bl	printf
	b	.L6
.L5:
	ldr	r3, [r7, #68]
	lsls	r3, r3, #2
	adds	r3, r3, #72
	add	r3, r3, r7
	ldr	r3, [r3, #-68]
	ldr	r2, [r7, #64]
	cmp	r2, r3
	bne	.L7
	ldr	r3, [r7, #68]
	lsls	r3, r3, #2
	adds	r3, r3, #72
	add	r3, r3, r7
	ldr	r3, [r3, #-68]
	mov	r1, r3
	ldr	r0, .L10+16
	bl	printf
	b	.L6
.L7:
	ldr	r3, [r7, #68]
	lsls	r3, r3, #2
	adds	r3, r3, #72
	add	r3, r3, r7
	ldr	r3, [r3, #-68]
	mov	r1, r3
	ldr	r0, .L10+20
	bl	printf
.L6:
	ldr	r3, [r7, #68]
	adds	r3, r3, #1
	str	r3, [r7, #68]
.L4:
	ldr	r3, [r7, #68]
	cmp	r3, #14
	ble	.L8
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #72
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L11:
	.align	2
.L10:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.size	main, .-main
	.align	1
	.global	analizarDivisores
	.syntax unified
	.thumb
	.thumb_func
	.type	analizarDivisores, %function
analizarDivisores:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #2
	str	r3, [r7, #16]
	b	.L13
.L15:
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #16]
	sdiv	r3, r2, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #16]
	sdiv	r2, r3, r2
	ldr	r1, [r7, #16]
	mul	r2, r1, r2
	subs	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne	.L14
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	str	r3, [r7, #20]
.L14:
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
.L13:
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	ble	.L15
	ldr	r3, [r7, #20]
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	analizarDivisores, .-analizarDivisores
	.ident	"GCC: (15:13.2.rel1-2) 13.2.1 20231009"
