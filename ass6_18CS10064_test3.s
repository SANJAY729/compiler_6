	.file	"output.s"

.STR0:	.string "Computation of GCD\n"
.STR1:	.string "Enter First Integer\n"
.STR2:	.string "Enter Seconnd Integer\n"
.STR3:	.string "The GCD is: "
.STR4:	.string "\n**********************************************\n"
	.text
	.globl	GCD
	.type	GCD, @function
GCD:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$24, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
# 0:arg1 = a arg2 = b 
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %edx
	cmpl	%edx, %eax
	je .L1
# 1:
	jmp .L2
# 2:
	jmp .L2
# 3:res = a 
.L1:
	movl	-8(%rbp), %eax
	jmp	.LRT0
# 4:
	jmp .L2
# 5:arg1 = a arg2 = b 
.L2:
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %edx
	cmpl	%edx, %eax
	jg .L3
# 6:
	jmp .L4
# 7:
	jmp .L4
# 8:res = t000 arg1 = a arg2 = b 
.L3:
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -12(%rbp)
# 9:res = t000 
# 10:res = b 
# 11:res = t001 
	pushq %rbp
	movl	-4(%rbp) , %edi
	movl	-12(%rbp) , %esi
	call	GCD
	movl	%eax, -16(%rbp)
	addq $0 , %rsp
# 12:res = t001 
	movl	-16(%rbp), %eax
	jmp	.LRT0
# 13:
	jmp .L4
# 14:arg1 = b arg2 = a 
.L4:
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %edx
	cmpl	%edx, %eax
	jg .L5
# 15:
	jmp	.LRT0
# 16:
	jmp	.LRT0
# 17:res = t002 arg1 = b arg2 = a 
.L5:
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -20(%rbp)
# 18:res = a 
# 19:res = t002 
# 20:res = t003 
	pushq %rbp
	movl	-20(%rbp) , %edi
	movl	-8(%rbp) , %esi
	call	GCD
	movl	%eax, -24(%rbp)
	addq $0 , %rsp
# 21:res = t003 
	movl	-24(%rbp), %eax
	jmp	.LRT0
# 22:
	jmp	.LRT0
.LRT0:
	addq	$-24, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	GCD, .-GCD
	.globl	main
	.type	main, @function
main:
.LFB1:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$84, %rsp
# 23:
.L6:
	movq	$.STR0,	%rdi
# 24:res = t004 
	pushq %rbp
	call	printStr
	movl	%eax, -16(%rbp)
	addq $8 , %rsp
# 25:
	movq	$.STR1,	%rdi
# 26:res = t005 
	pushq %rbp
	call	printStr
	movl	%eax, -20(%rbp)
	addq $8 , %rsp
# 27:res = t006 arg1 = err 
	leaq	-12(%rbp), %rax
	movq	%rax, -28(%rbp)
# 28:res = t006 
# 29:res = t007 
	pushq %rbp
	movq	-28(%rbp), %rdi
	call	readInt
	movl	%eax, -32(%rbp)
	addq $0 , %rsp
# 30:res = a arg1 = t007 
	movl	-32(%rbp), %eax
	movl	%eax, -4(%rbp)
# 31:res = t008 arg1 = t007 
	movl	-32(%rbp), %eax
	movl	%eax, -36(%rbp)
# 32:
	movq	$.STR2,	%rdi
# 33:res = t009 
	pushq %rbp
	call	printStr
	movl	%eax, -40(%rbp)
	addq $8 , %rsp
# 34:res = t010 arg1 = err 
	leaq	-12(%rbp), %rax
	movq	%rax, -48(%rbp)
# 35:res = t010 
# 36:res = t011 
	pushq %rbp
	movq	-48(%rbp), %rdi
	call	readInt
	movl	%eax, -52(%rbp)
	addq $0 , %rsp
# 37:res = b arg1 = t011 
	movl	-52(%rbp), %eax
	movl	%eax, -8(%rbp)
# 38:res = t012 arg1 = t011 
	movl	-52(%rbp), %eax
	movl	%eax, -56(%rbp)
# 39:res = a 
# 40:res = b 
# 41:res = t013 
	pushq %rbp
	movl	-8(%rbp) , %edi
	movl	-4(%rbp) , %esi
	call	GCD
	movl	%eax, -64(%rbp)
	addq $0 , %rsp
# 42:res = s arg1 = t013 
	movl	-64(%rbp), %eax
	movl	%eax, -60(%rbp)
# 43:res = t014 arg1 = t013 
	movl	-64(%rbp), %eax
	movl	%eax, -68(%rbp)
# 44:
	movq	$.STR3,	%rdi
# 45:res = t015 
	pushq %rbp
	call	printStr
	movl	%eax, -72(%rbp)
	addq $8 , %rsp
# 46:res = s 
# 47:res = t016 
	pushq %rbp
	movl	-60(%rbp) , %edi
	call	printInt
	movl	%eax, -76(%rbp)
	addq $0 , %rsp
# 48:
	movq	$.STR4,	%rdi
# 49:res = t017 
	pushq %rbp
	call	printStr
	movl	%eax, -80(%rbp)
	addq $8 , %rsp
# 50:res = t018 
	movl	$0, -84(%rbp)
# 51:res = t018 
	movl	-84(%rbp), %eax
	jmp	.LRT1
.LRT1:
	addq	$-84, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE1:
	.size	main, .-main
