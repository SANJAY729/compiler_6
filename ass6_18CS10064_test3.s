	.file	"output.s"

.STR0:	.string "++++++ Sum of Digit ++++++\n"
.STR1:	.string "Enter Integer\n"
.STR2:	.string "Sum of Digit: "
.STR3:	.string "\n++++++++++\n"
	.text
	.globl	sumOfDigits
	.type	sumOfDigits, @function
sumOfDigits:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$44, %rsp
	movl	%edi, -4(%rbp)
# 0:res = t000 
	movl	$10, -8(%rbp)
# 1:res = t001 arg1 = x arg2 = t000 
	movl	-4(%rbp), %eax
	cltd
	idivl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
# 2:res = t002 
	movl	$0, -16(%rbp)
# 3:arg1 = t001 arg2 = t002 
	movl	-12(%rbp), %eax
	movl	-16(%rbp), %edx
	cmpl	%edx, %eax
	je .L1
# 4:
	jmp .L2
# 5:
	jmp	.LRT0
# 6:res = x 
.L1:
	movl	-4(%rbp), %eax
	jmp	.LRT0
# 7:
	jmp	.LRT0
# 8:res = t003 
.L2:
	movl	$10, -20(%rbp)
# 9:res = t004 arg1 = x arg2 = t003 
	movl	-4(%rbp), %eax
	cltd
	idivl	-20(%rbp), %eax
	movl	%edx, -24(%rbp)
# 10:res = t004 
# 11:res = t005 
	pushq %rbp
	movl	-24(%rbp) , %edi
	call	sumOfDigits
	movl	%eax, -28(%rbp)
	addq $0 , %rsp
# 12:res = t006 
	movl	$10, -32(%rbp)
# 13:res = t007 arg1 = x arg2 = t006 
	movl	-4(%rbp), %eax
	cltd
	idivl	-32(%rbp), %eax
	movl	%eax, -36(%rbp)
# 14:res = t007 
# 15:res = t008 
	pushq %rbp
	movl	-36(%rbp) , %edi
	call	sumOfDigits
	movl	%eax, -40(%rbp)
	addq $0 , %rsp
# 16:res = t009 arg1 = t005 arg2 = t008 
	movl	-28(%rbp), %eax
	movl	-40(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -44(%rbp)
# 17:res = t009 
	movl	-44(%rbp), %eax
	jmp	.LRT0
# 18:
	jmp	.LRT0
.LRT0:
	addq	$-44, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	sumOfDigits, .-sumOfDigits
	.globl	main
	.type	main, @function
main:
.LFB1:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
# 19:
.L3:
	movq	$.STR0,	%rdi
# 20:res = t010 
	pushq %rbp
	call	prints
	movl	%eax, -8(%rbp)
	addq $0 , %rsp
# 21:
	movq	$.STR1,	%rdi
# 22:res = t011 
	pushq %rbp
	call	prints
	movl	%eax, -12(%rbp)
	addq $0 , %rsp
# 23:res = t012 
	movl	$1, -20(%rbp)
# 24:res = err arg1 = t012 
	movl	-20(%rbp), %eax
	movl	%eax, -16(%rbp)
# 25:res = t013 arg1 = err 
	leaq	-16(%rbp), %rax
	movq	%rax, -28(%rbp)
# 26:res = t013 
# 27:res = t014 
	pushq %rbp
	movq	-28(%rbp), %rdi
	call	readi
	movl	%eax, -32(%rbp)
	addq $0 , %rsp
# 28:res = n arg1 = t014 
	movl	-32(%rbp), %eax
	movl	%eax, -4(%rbp)
# 29:res = t015 arg1 = t014 
	movl	-32(%rbp), %eax
	movl	%eax, -36(%rbp)
# 30:res = n 
# 31:res = t016 
	pushq %rbp
	movl	-4(%rbp) , %edi
	call	sumOfDigits
	movl	%eax, -44(%rbp)
	addq $0 , %rsp
# 32:res = s arg1 = t016 
	movl	-44(%rbp), %eax
	movl	%eax, -40(%rbp)
# 33:res = t017 arg1 = t016 
	movl	-44(%rbp), %eax
	movl	%eax, -48(%rbp)
# 34:
	movq	$.STR2,	%rdi
# 35:res = t018 
	pushq %rbp
	call	prints
	movl	%eax, -52(%rbp)
	addq $0 , %rsp
# 36:res = s 
# 37:res = t019 
	pushq %rbp
	movl	-40(%rbp) , %edi
	call	printi
	movl	%eax, -56(%rbp)
	addq $0 , %rsp
# 38:
	movq	$.STR3,	%rdi
# 39:res = t020 
	pushq %rbp
	call	prints
	movl	%eax, -60(%rbp)
	addq $0 , %rsp
# 40:res = t021 
	movl	$0, -64(%rbp)
# 41:res = t021 
	movl	-64(%rbp), %eax
	jmp	.LRT1
.LRT1:
	addq	$-64, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE1:
	.size	main, .-main
