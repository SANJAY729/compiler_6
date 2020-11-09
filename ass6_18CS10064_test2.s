	.file	"output.s"

.STR0:	.string "++++++++++++ Palindrome or Not ++++++++++++\n"
.STR1:	.string "Enter an integer: "
.STR2:	.string "Yes, It is a palindrome.\n"
.STR3:	.string "No, It is not a palindrome.\n"
.STR4:	.string "\n+++++++++++++++++++++++++\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$116, %rsp
# 0:res = t000 
	movl	$0, -20(%rbp)
# 1:res = reversedInteger arg1 = t000 
	movl	-20(%rbp), %eax
	movl	%eax, -8(%rbp)
# 2:res = t001 arg1 = t000 
	movl	-20(%rbp), %eax
	movl	%eax, -24(%rbp)
# 3:
	movq	$.STR0,	%rdi
# 4:res = t002 
	pushq %rbp
	call	prints
	movl	%eax, -28(%rbp)
	addq $0 , %rsp
# 5:
	movq	$.STR1,	%rdi
# 6:res = t003 
	pushq %rbp
	call	prints
	movl	%eax, -32(%rbp)
	addq $0 , %rsp
# 7:res = t004 arg1 = err 
	leaq	-36(%rbp), %rax
	movq	%rax, -44(%rbp)
# 8:res = t004 
# 9:res = t005 
	pushq %rbp
	movq	-44(%rbp), %rdi
	call	readi
	movl	%eax, -48(%rbp)
	addq $0 , %rsp
# 10:res = n arg1 = t005 
	movl	-48(%rbp), %eax
	movl	%eax, -4(%rbp)
# 11:res = t006 arg1 = t005 
	movl	-48(%rbp), %eax
	movl	%eax, -52(%rbp)
# 12:res = originalInteger arg1 = n 
	movl	-4(%rbp), %eax
	movl	%eax, -16(%rbp)
# 13:res = t007 arg1 = n 
	movl	-4(%rbp), %eax
	movl	%eax, -56(%rbp)
# 14:res = t008 
.L3:
	movl	$0, -60(%rbp)
# 15:arg1 = n arg2 = t008 
	movl	-4(%rbp), %eax
	movl	-60(%rbp), %edx
	cmpl	%edx, %eax
	jne .L1
# 16:
	jmp .L2
# 17:
	jmp .L2
# 18:res = t009 
.L1:
	movl	$10, -64(%rbp)
# 19:res = t010 arg1 = n arg2 = t009 
	movl	-4(%rbp), %eax
	cltd
	idivl	-64(%rbp), %eax
	movl	%edx, -68(%rbp)
# 20:res = remainder arg1 = t010 
	movl	-68(%rbp), %eax
	movl	%eax, -12(%rbp)
# 21:res = t011 arg1 = t010 
	movl	-68(%rbp), %eax
	movl	%eax, -72(%rbp)
# 22:res = t012 
	movl	$10, -76(%rbp)
# 23:res = t013 arg1 = reversedInteger arg2 = t012 
	movl	-8(%rbp), %eax
	imull	-76(%rbp), %eax
	movl	%eax, -80(%rbp)
# 24:res = t014 arg1 = t013 arg2 = remainder 
	movl	-80(%rbp), %eax
	movl	-12(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -84(%rbp)
# 25:res = reversedInteger arg1 = t014 
	movl	-84(%rbp), %eax
	movl	%eax, -8(%rbp)
# 26:res = t015 arg1 = t014 
	movl	-84(%rbp), %eax
	movl	%eax, -88(%rbp)
# 27:res = t016 
	movl	$10, -92(%rbp)
# 28:res = t017 arg1 = n arg2 = t016 
	movl	-4(%rbp), %eax
	cltd
	idivl	-92(%rbp), %eax
	movl	%eax, -96(%rbp)
# 29:res = n arg1 = t017 
	movl	-96(%rbp), %eax
	movl	%eax, -4(%rbp)
# 30:res = t018 arg1 = t017 
	movl	-96(%rbp), %eax
	movl	%eax, -100(%rbp)
# 31:
	jmp .L3
# 32:arg1 = originalInteger arg2 = reversedInteger 
.L2:
	movl	-16(%rbp), %eax
	movl	-8(%rbp), %edx
	cmpl	%edx, %eax
	je .L4
# 33:
	jmp .L5
# 34:
	jmp .L6
# 35:
.L4:
	movq	$.STR2,	%rdi
# 36:res = t019 
	pushq %rbp
	call	prints
	movl	%eax, -104(%rbp)
	addq $0 , %rsp
# 37:
	jmp .L6
# 38:
.L5:
	movq	$.STR3,	%rdi
# 39:res = t020 
	pushq %rbp
	call	prints
	movl	%eax, -108(%rbp)
	addq $0 , %rsp
# 40:
	jmp .L6
# 41:
.L6:
	movq	$.STR4,	%rdi
# 42:res = t021 
	pushq %rbp
	call	prints
	movl	%eax, -112(%rbp)
	addq $0 , %rsp
# 43:res = t022 
	movl	$0, -116(%rbp)
# 44:res = t022 
	movl	-116(%rbp), %eax
	jmp	.LRT0
.LRT0:
	addq	$-116, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	main, .-main
