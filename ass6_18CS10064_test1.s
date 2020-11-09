	.file	"output.s"

.STR0:	.string "Enter the integer values of 1) principal_amt, 2) rate  3)time (Answer rounded in integers):\n"
.STR1:	.string "Simple interest = "
.STR2:	.string "\n"
.STR3:	.string "\n+++++++++++++++++++++++\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
# 0:
	movq	$.STR0,	%rdi
# 1:res = t000 
	pushq %rbp
	call	prints
	movl	%eax, -24(%rbp)
	addq $0 , %rsp
# 2:res = t001 arg1 = err 
	leaq	-20(%rbp), %rax
	movq	%rax, -32(%rbp)
# 3:res = t001 
# 4:res = t002 
	pushq %rbp
	movq	-32(%rbp), %rdi
	call	readi
	movl	%eax, -36(%rbp)
	addq $0 , %rsp
# 5:res = principal_amt arg1 = t002 
	movl	-36(%rbp), %eax
	movl	%eax, -4(%rbp)
# 6:res = t003 arg1 = t002 
	movl	-36(%rbp), %eax
	movl	%eax, -40(%rbp)
# 7:res = t004 arg1 = err 
	leaq	-20(%rbp), %rax
	movq	%rax, -48(%rbp)
# 8:res = t004 
# 9:res = t005 
	pushq %rbp
	movq	-48(%rbp), %rdi
	call	readi
	movl	%eax, -52(%rbp)
	addq $0 , %rsp
# 10:res = rate arg1 = t005 
	movl	-52(%rbp), %eax
	movl	%eax, -8(%rbp)
# 11:res = t006 arg1 = t005 
	movl	-52(%rbp), %eax
	movl	%eax, -56(%rbp)
# 12:res = t007 arg1 = err 
	leaq	-20(%rbp), %rax
	movq	%rax, -64(%rbp)
# 13:res = t007 
# 14:res = t008 
	pushq %rbp
	movq	-64(%rbp), %rdi
	call	readi
	movl	%eax, -68(%rbp)
	addq $0 , %rsp
# 15:res = time arg1 = t008 
	movl	-68(%rbp), %eax
	movl	%eax, -16(%rbp)
# 16:res = t009 arg1 = t008 
	movl	-68(%rbp), %eax
	movl	%eax, -72(%rbp)
# 17:res = t010 arg1 = principal_amt arg2 = rate 
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	movl	%eax, -76(%rbp)
# 18:res = t011 arg1 = t010 arg2 = time 
	movl	-76(%rbp), %eax
	imull	-16(%rbp), %eax
	movl	%eax, -80(%rbp)
# 19:res = t012 
	movl	$100, -84(%rbp)
# 20:res = t013 arg1 = t011 arg2 = t012 
	movl	-80(%rbp), %eax
	cltd
	idivl	-84(%rbp), %eax
	movl	%eax, -88(%rbp)
# 21:res = simple_interest arg1 = t013 
	movl	-88(%rbp), %eax
	movl	%eax, -12(%rbp)
# 22:res = t014 arg1 = t013 
	movl	-88(%rbp), %eax
	movl	%eax, -92(%rbp)
# 23:
	movq	$.STR1,	%rdi
# 24:res = t015 
	pushq %rbp
	call	prints
	movl	%eax, -96(%rbp)
	addq $0 , %rsp
# 25:res = simple_interest 
# 26:res = t016 
	pushq %rbp
	movl	-12(%rbp) , %edi
	call	printi
	movl	%eax, -100(%rbp)
	addq $0 , %rsp
# 27:
	movq	$.STR2,	%rdi
# 28:res = t017 
	pushq %rbp
	call	prints
	movl	%eax, -104(%rbp)
	addq $0 , %rsp
# 29:
	movq	$.STR3,	%rdi
# 30:res = t018 
	pushq %rbp
	call	prints
	movl	%eax, -108(%rbp)
	addq $0 , %rsp
# 31:res = t019 
	movl	$0, -112(%rbp)
# 32:res = t019 
	movl	-112(%rbp), %eax
	jmp	.LRT0
.LRT0:
	addq	$-112, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	main, .-main
