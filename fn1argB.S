.global fn1argB  # makes fn1arg visible to the linker (ld)
fn1argB:
	dec %edi
	cmpl %edi, %edi
	js .L1
	movl %edi, %eax
	ret
.L1:
	movl $0xDEADBEEF, %eax
	ret
