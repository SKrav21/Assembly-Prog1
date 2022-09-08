.global fn3args
fn3args:
	movl $0, %eax
	movl (%rdi, %rax, 4), %esi
	inc %eax
	movl (%rdi, %rax, 4), %ecx
	inc %eax
	movl (%rdi, %rax, 4), %r8d
	movl %esi, %eax
	testl %eax, %eax
	js .L2
	imull %ecx
	js .L2
	imull %r8d
	js .L2
	movl $3, %edi
	idivl %edi
	testl %edx, %edx
	jne .L1
	ret
.L2:
	movl $0xBAAAAAAD, %eax
	ret
.L1:
	inc %eax
	ret
