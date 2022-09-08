.global fn6args
fn6args:
	subl %edi, %ecx #x2-x1
	subl %esi, %r8d #y2-y1
	subl %edx, %r9d #z2-z1
	
	movl %ecx, %eax 
	imull %ecx 		#x*x
	movl %eax, %ecx
	
	movl %r8d, %eax
	imull %r8d 		#y*y
	movl %eax, %r8d

	movl %r9d, %eax
	imull %r9d 		#z*z

	addl %r8d, %eax #z^2 + y^2 + x^2
	addl %ecx, %eax
	movl %eax, %edi
	call integer_sqrt
	retq

integer_sqrt:
	cmpl $2, %edi
	jl .L1
	push %rdi
	shrl $2, %edi
	call integer_sqrt
	sall $1, %eax
	movl %eax, %ecx
	incl %eax
	movl %eax, %esi
	imull %eax
	popq %rdi
	cmpl %eax, %edi
	jns .L2
	movl %ecx, %eax
	rep ret
.L1:
	movl %edi, %eax
	rep ret
.L2:
	movl %esi, %eax
	rep ret
