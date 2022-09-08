.global fn2args
fn2args:
	movl (%rdi), %eax
	movl (%rsi), %edx
	cmpl %eax, %edx
  	jl .L1
	ret
.L1:
	movl %edx, (%rdi)
	movl %eax, (%rsi)
	ret
