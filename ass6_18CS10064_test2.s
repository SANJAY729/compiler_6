	.file	"output.s"

.STR0:	.string "Factorial Computation\n"
.STR1:	.string "Enter the integer: "
.STR2:	.string "The factorial of given number is = \n"
.STR3:	.string "\n**********************************************\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$92, %rsp
# 0:
	movq	$.STR0,	%rdi
# 1:res = t000 
	pushq %rbp
	call	printStr
	movl	%eax, -20(%rbp)
	addq $8 , %rsp
# 2:
	movq	$.STR1,	%rdi
# 3:res = t001 
	pushq %rbp
	call	printStr
	movl	%eax, -24(%rbp)
	addq $8 , %rsp
# 4:res = t002 arg1 = err 
	leaq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
# 5:res = t002 
# 6:res = t003 
	pushq %rbp
	movq	-32(%rbp), %rdi
	call	readInt
	movl	%eax, -36(%rbp)
	addq $0 , %rsp
# 7:res = n arg1 = t003 
	movl	-36(%rbp), %eax
	movl	%eax, -4(%rbp)
# 8:res = t004 arg1 = t003 
	movl	-36(%rbp), %eax
	movl	%eax, -40(%rbp)
# 9:res = t005 
	movl	$1, -44(%rbp)
# 10:res = ans arg1 = t005 
	movl	-44(%rbp), %eax
	movl	%eax, -8(%rbp)
# 11:res = t006 arg1 = t005 
	movl	-44(%rbp), %eax
	movl	%eax, -48(%rbp)
# 12:res = t007 
	movl	$1, -52(%rbp)
# 13:res = i arg1 = t007 
	movl	-52(%rbp), %eax
	movl	%eax, -12(%rbp)
# 14:res = t008 arg1 = t007 
	movl	-52(%rbp), %eax
	movl	%eax, -56(%rbp)
# 15:arg1 = i arg2 = n 
.L3:
	movl	-12(%rbp), %eax
	movl	-4(%rbp), %edx
	cmpl	%edx, %eax
	jle .L1
# 16:
	jmp .L2
# 17:
	jmp .L2
# 18:res = t009 arg1 = ans arg2 = i 
.L1:
	movl	-8(%rbp), %eax
	imull	-12(%rbp), %eax
	movl	%eax, -60(%rbp)
# 19:res = ans arg1 = t009 
	movl	-60(%rbp), %eax
	movl	%eax, -8(%rbp)
# 20:res = t010 arg1 = t009 
	movl	-60(%rbp), %eax
	movl	%eax, -64(%rbp)
# 21:res = t011 
	movl	$1, -68(%rbp)
# 22:res = t012 arg1 = i arg2 = t011 
	movl	-12(%rbp), %eax
	movl	-68(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -72(%rbp)
# 23:res = i arg1 = t012 
	movl	-72(%rbp), %eax
	movl	%eax, -12(%rbp)
# 24:res = t013 arg1 = t012 
	movl	-72(%rbp), %eax
	movl	%eax, -76(%rbp)
# 25:
	jmp .L3
# 26:
.L2:
	movq	$.STR2,	%rdi
# 27:res = t014 
	pushq %rbp
	call	printStr
	movl	%eax, -80(%rbp)
	addq $8 , %rsp
# 28:res = ans 
# 29:res = t015 
	pushq %rbp
	movl	-8(%rbp) , %edi
	call	printInt
	movl	%eax, -84(%rbp)
	addq $0 , %rsp
# 30:
	movq	$.STR3,	%rdi
# 31:res = t016 
	pushq %rbp
	call	printStr
	movl	%eax, -88(%rbp)
	addq $8 , %rsp
# 32:res = t017 
	movl	$0, -92(%rbp)
# 33:res = t017 
	movl	-92(%rbp), %eax
	jmp	.LRT0
.LRT0:
	addq	$-92, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	main, .-main
