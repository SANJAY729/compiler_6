	.file	"output.s"

.STR0:	.string "Kadane Algorithm\n"
.STR1:	.string "Enter the number of elements array\n"
.STR2:	.string "Enter the elements of the first array (use new line for each element)\n"
.STR3:	.string "Largest Subarray Sum is : "
.STR4:	.string "\n**********************************************\n"
	.text
	.globl	kadane
	.type	kadane, @function
kadane:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$100, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -12(%rbp)
# 0:res = t000 
	movl	$10000, -20(%rbp)
# 1:res = t001 arg1 = t000 
	movl	-20(%rbp), %eax
	negl	%eax
	movl	%eax, -24(%rbp)
# 2:res = max_so_far arg1 = t001 
	movl	-24(%rbp), %eax
	movl	%eax, -16(%rbp)
# 3:res = t002 
	movl	$0, -32(%rbp)
# 4:res = max_ending_here arg1 = t002 
	movl	-32(%rbp), %eax
	movl	%eax, -28(%rbp)
# 5:res = t003 
	movl	$0, -40(%rbp)
# 6:res = i arg1 = t003 
	movl	-40(%rbp), %eax
	movl	%eax, -36(%rbp)
# 7:res = t004 
	movl	$0, -44(%rbp)
# 8:res = i arg1 = t004 
	movl	-44(%rbp), %eax
	movl	%eax, -36(%rbp)
# 9:res = t005 arg1 = t004 
	movl	-44(%rbp), %eax
	movl	%eax, -48(%rbp)
# 10:arg1 = i arg2 = n 
.L3:
	movl	-36(%rbp), %eax
	movl	-4(%rbp), %edx
	cmpl	%edx, %eax
	jl .L1
# 11:
	jmp .L2
# 12:
	jmp .L2
# 13:res = t006 
.L7:
	movl	$1, -52(%rbp)
# 14:res = t007 arg1 = i arg2 = t006 
	movl	-36(%rbp), %eax
	movl	-52(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -56(%rbp)
# 15:res = i arg1 = t007 
	movl	-56(%rbp), %eax
	movl	%eax, -36(%rbp)
# 16:res = t008 arg1 = t007 
	movl	-56(%rbp), %eax
	movl	%eax, -60(%rbp)
# 17:
	jmp .L3
# 18:res = t009 
.L1:
	movl	$0, -64(%rbp)
# 19:res = t011 arg1 = i 
	movl	-36(%rbp), %eax
	movl	$4, %ecx
	imull	%ecx, %eax
	movl	%eax, -72(%rbp)
# 20:res = t010 arg1 = t009 arg2 = t011 
	movl	-64(%rbp), %eax
	movl	-72(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -68(%rbp)
# 21:res = t012 arg1 = X arg2 = t010 
	movq	-12(%rbp), %rdx
	movslq	-68(%rbp), %rax
	addq	%rax, %rdx
	movl	(%rdx), %eax
	movl	%eax, -76(%rbp)
# 22:res = t013 arg1 = max_ending_here arg2 = t012 
	movl	-28(%rbp), %eax
	movl	-76(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -80(%rbp)
# 23:res = max_ending_here arg1 = t013 
	movl	-80(%rbp), %eax
	movl	%eax, -28(%rbp)
# 24:res = t014 arg1 = t013 
	movl	-80(%rbp), %eax
	movl	%eax, -84(%rbp)
# 25:arg1 = max_so_far arg2 = max_ending_here 
	movl	-16(%rbp), %eax
	movl	-28(%rbp), %edx
	cmpl	%edx, %eax
	jl .L4
# 26:
	jmp .L5
# 27:
	jmp .L5
# 28:res = max_so_far arg1 = max_ending_here 
.L4:
	movl	-28(%rbp), %eax
	movl	%eax, -16(%rbp)
# 29:res = t015 arg1 = max_ending_here 
	movl	-28(%rbp), %eax
	movl	%eax, -88(%rbp)
# 30:
	jmp .L5
# 31:res = t016 
.L5:
	movl	$0, -92(%rbp)
# 32:arg1 = max_ending_here arg2 = t016 
	movl	-28(%rbp), %eax
	movl	-92(%rbp), %edx
	cmpl	%edx, %eax
	jl .L6
# 33:
	jmp .L7
# 34:
	jmp .L8
# 35:res = t017 
.L6:
	movl	$0, -96(%rbp)
# 36:res = max_ending_here arg1 = t017 
	movl	-96(%rbp), %eax
	movl	%eax, -28(%rbp)
# 37:res = t018 arg1 = t017 
	movl	-96(%rbp), %eax
	movl	%eax, -100(%rbp)
# 38:
	jmp .L7
# 39:
.L8:
	jmp .L7
# 40:res = max_so_far 
.L2:
	movl	-16(%rbp), %eax
	jmp	.LRT0
.LRT0:
	addq	$-100, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	kadane, .-kadane
	.globl	main
	.type	main, @function
main:
.LFB1:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$520, %rsp
# 41:res = t019 
	movl	$100, -404(%rbp)
# 42:res = t020 
	movl	$1, -420(%rbp)
# 43:res = err arg1 = t020 
	movl	-420(%rbp), %eax
	movl	%eax, -416(%rbp)
# 44:
	movq	$.STR0,	%rdi
# 45:res = t021 
	pushq %rbp
	call	printStr
	movl	%eax, -424(%rbp)
	addq $8 , %rsp
# 46:
	movq	$.STR1,	%rdi
# 47:res = t022 
	pushq %rbp
	call	printStr
	movl	%eax, -428(%rbp)
	addq $8 , %rsp
# 48:res = t023 arg1 = err 
	leaq	-416(%rbp), %rax
	movq	%rax, -436(%rbp)
# 49:res = t023 
# 50:res = t024 
	pushq %rbp
	movq	-436(%rbp), %rdi
	call	readInt
	movl	%eax, -440(%rbp)
	addq $0 , %rsp
# 51:res = n arg1 = t024 
	movl	-440(%rbp), %eax
	movl	%eax, -408(%rbp)
# 52:res = t025 arg1 = t024 
	movl	-440(%rbp), %eax
	movl	%eax, -444(%rbp)
# 53:
	movq	$.STR2,	%rdi
# 54:res = t026 
	pushq %rbp
	call	printStr
	movl	%eax, -448(%rbp)
	addq $8 , %rsp
# 55:res = t027 
	movl	$0, -452(%rbp)
# 56:res = i arg1 = t027 
	movl	-452(%rbp), %eax
	movl	%eax, -412(%rbp)
# 57:res = t028 arg1 = t027 
	movl	-452(%rbp), %eax
	movl	%eax, -456(%rbp)
# 58:arg1 = i arg2 = n 
.L11:
	movl	-412(%rbp), %eax
	movl	-408(%rbp), %edx
	cmpl	%edx, %eax
	jl .L9
# 59:
	jmp .L10
# 60:
	jmp .L10
# 61:res = t029 arg1 = i 
.L12:
	movl	-412(%rbp), %eax
	movl	%eax, -460(%rbp)
# 62:res = i arg1 = i 
	movl	-412(%rbp), %eax
	movl	$1, %edx
	addl	%edx, %eax
	movl	%eax, -412(%rbp)
# 63:
	jmp .L11
# 64:res = t030 
.L9:
	movl	$0, -464(%rbp)
# 65:res = t032 arg1 = i 
	movl	-412(%rbp), %eax
	movl	$4, %ecx
	imull	%ecx, %eax
	movl	%eax, -472(%rbp)
# 66:res = t031 arg1 = t030 arg2 = t032 
	movl	-464(%rbp), %eax
	movl	-472(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -468(%rbp)
# 67:res = t033 arg1 = err 
	leaq	-416(%rbp), %rax
	movq	%rax, -480(%rbp)
# 68:res = t033 
# 69:res = t034 
	pushq %rbp
	movq	-480(%rbp), %rdi
	call	readInt
	movl	%eax, -484(%rbp)
	addq $0 , %rsp
# 70:res = x arg1 = t031 arg2 = t034 
	leaq	-400(%rbp), %rdx
	movslq	-468(%rbp), %rax
	addq	%rax, %rdx
	movl	-484(%rbp), %eax
	movl	%eax, (%rdx)
# 71:res = t035 arg1 = t034 
	movl	-484(%rbp), %eax
	movl	%eax, -488(%rbp)
# 72:
	jmp .L12
# 73:res = t036 
.L10:
	movl	$0, -496(%rbp)
# 74:res = x 
# 75:res = n 
# 76:res = t037 
	pushq %rbp
	movl	-408(%rbp) , %edi
	leaq	-400(%rbp), %rsi
	call	kadane
	movl	%eax, -500(%rbp)
	addq $0 , %rsp
# 77:res = l arg1 = t037 
	movl	-500(%rbp), %eax
	movl	%eax, -492(%rbp)
# 78:res = t038 arg1 = t037 
	movl	-500(%rbp), %eax
	movl	%eax, -504(%rbp)
# 79:
	movq	$.STR3,	%rdi
# 80:res = t039 
	pushq %rbp
	call	printStr
	movl	%eax, -508(%rbp)
	addq $8 , %rsp
# 81:res = l 
# 82:res = t040 
	pushq %rbp
	movl	-492(%rbp) , %edi
	call	printInt
	movl	%eax, -512(%rbp)
	addq $0 , %rsp
# 83:
	movq	$.STR4,	%rdi
# 84:res = t041 
	pushq %rbp
	call	printStr
	movl	%eax, -516(%rbp)
	addq $8 , %rsp
# 85:res = t042 
	movl	$0, -520(%rbp)
# 86:res = t042 
	movl	-520(%rbp), %eax
	jmp	.LRT1
.LRT1:
	addq	$-520, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE1:
	.size	main, .-main
