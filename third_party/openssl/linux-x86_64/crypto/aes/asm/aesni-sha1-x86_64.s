.text	


.globl	aesni_cbc_sha1_enc
.type	aesni_cbc_sha1_enc,@function
.align	32
aesni_cbc_sha1_enc:

	movl	OPENSSL_ia32cap_P+0(%rip),%r10d
	movq	OPENSSL_ia32cap_P+4(%rip),%r11
	btq	$61,%r11
	jc	aesni_cbc_sha1_enc_shaext
	jmp	aesni_cbc_sha1_enc_ssse3
	.byte	0xf3,0xc3
.size	aesni_cbc_sha1_enc,.-aesni_cbc_sha1_enc
.type	aesni_cbc_sha1_enc_ssse3,@function
.align	32
aesni_cbc_sha1_enc_ssse3:
	movq	8(%rsp),%r10


	pushq	%rbx
	pushq	%rbp
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	leaq	-104(%rsp),%rsp


	movq	%rdi,%r12
	movq	%rsi,%r13
	movq	%rdx,%r14
	leaq	112(%rcx),%r15
	movdqu	(%r8),%xmm2
	movq	%r8,88(%rsp)
	shlq	$6,%r14
	subq	%r12,%r13
	movl	240-112(%r15),%r8d
	addq	%r10,%r14

	leaq	K_XX_XX(%rip),%r11
	movl	0(%r9),%eax
	movl	4(%r9),%ebx
	movl	8(%r9),%ecx
	movl	12(%r9),%edx
	movl	%ebx,%esi
	movl	16(%r9),%ebp
	movl	%ecx,%edi
	xorl	%edx,%edi
	andl	%edi,%esi

	movdqa	64(%r11),%xmm3
	movdqa	0(%r11),%xmm13
	movdqu	0(%r10),%xmm4
	movdqu	16(%r10),%xmm5
	movdqu	32(%r10),%xmm6
	movdqu	48(%r10),%xmm7
.byte	102,15,56,0,227
.byte	102,15,56,0,235
.byte	102,15,56,0,243
	addq	$64,%r10
	paddd	%xmm13,%xmm4
.byte	102,15,56,0,251
	paddd	%xmm13,%xmm5
	paddd	%xmm13,%xmm6
	movdqa	%xmm4,0(%rsp)
	psubd	%xmm13,%xmm4
	movdqa	%xmm5,16(%rsp)
	psubd	%xmm13,%xmm5
	movdqa	%xmm6,32(%rsp)
	psubd	%xmm13,%xmm6
	movups	-112(%r15),%xmm15
	movups	16-112(%r15),%xmm0
	jmp	.Loop_ssse3
.align	32
.Loop_ssse3:
	rorl	$2,%ebx
	movups	0(%r12),%xmm14
	xorps	%xmm15,%xmm14
	xorps	%xmm14,%xmm2
	movups	-80(%r15),%xmm1
.byte	102,15,56,220,208
	pshufd	$238,%xmm4,%xmm8
	xorl	%edx,%esi
	movdqa	%xmm7,%xmm12
	paddd	%xmm7,%xmm13
	movl	%eax,%edi
	addl	0(%rsp),%ebp
	punpcklqdq	%xmm5,%xmm8
	xorl	%ecx,%ebx
	roll	$5,%eax
	addl	%esi,%ebp
	psrldq	$4,%xmm12
	andl	%ebx,%edi
	xorl	%ecx,%ebx
	pxor	%xmm4,%xmm8
	addl	%eax,%ebp
	rorl	$7,%eax
	pxor	%xmm6,%xmm12
	xorl	%ecx,%edi
	movl	%ebp,%esi
	addl	4(%rsp),%edx
	pxor	%xmm12,%xmm8
	xorl	%ebx,%eax
	roll	$5,%ebp
	movdqa	%xmm13,48(%rsp)
	addl	%edi,%edx
	movups	-64(%r15),%xmm0
.byte	102,15,56,220,209
	andl	%eax,%esi
	movdqa	%xmm8,%xmm3
	xorl	%ebx,%eax
	addl	%ebp,%edx
	rorl	$7,%ebp
	movdqa	%xmm8,%xmm12
	xorl	%ebx,%esi
	pslldq	$12,%xmm3
	paddd	%xmm8,%xmm8
	movl	%edx,%edi
	addl	8(%rsp),%ecx
	psrld	$31,%xmm12
	xorl	%eax,%ebp
	roll	$5,%edx
	addl	%esi,%ecx
	movdqa	%xmm3,%xmm13
	andl	%ebp,%edi
	xorl	%eax,%ebp
	psrld	$30,%xmm3
	addl	%edx,%ecx
	rorl	$7,%edx
	por	%xmm12,%xmm8
	xorl	%eax,%edi
	movl	%ecx,%esi
	addl	12(%rsp),%ebx
	movups	-48(%r15),%xmm1
.byte	102,15,56,220,208
	pslld	$2,%xmm13
	pxor	%xmm3,%xmm8
	xorl	%ebp,%edx
	movdqa	0(%r11),%xmm3
	roll	$5,%ecx
	addl	%edi,%ebx
	andl	%edx,%esi
	pxor	%xmm13,%xmm8
	xorl	%ebp,%edx
	addl	%ecx,%ebx
	rorl	$7,%ecx
	pshufd	$238,%xmm5,%xmm9
	xorl	%ebp,%esi
	movdqa	%xmm8,%xmm13
	paddd	%xmm8,%xmm3
	movl	%ebx,%edi
	addl	16(%rsp),%eax
	punpcklqdq	%xmm6,%xmm9
	xorl	%edx,%ecx
	roll	$5,%ebx
	addl	%esi,%eax
	psrldq	$4,%xmm13
	andl	%ecx,%edi
	xorl	%edx,%ecx
	pxor	%xmm5,%xmm9
	addl	%ebx,%eax
	rorl	$7,%ebx
	movups	-32(%r15),%xmm0
.byte	102,15,56,220,209
	pxor	%xmm7,%xmm13
	xorl	%edx,%edi
	movl	%eax,%esi
	addl	20(%rsp),%ebp
	pxor	%xmm13,%xmm9
	xorl	%ecx,%ebx
	roll	$5,%eax
	movdqa	%xmm3,0(%rsp)
	addl	%edi,%ebp
	andl	%ebx,%esi
	movdqa	%xmm9,%xmm12
	xorl	%ecx,%ebx
	addl	%eax,%ebp
	rorl	$7,%eax
	movdqa	%xmm9,%xmm13
	xorl	%ecx,%esi
	pslldq	$12,%xmm12
	paddd	%xmm9,%xmm9
	movl	%ebp,%edi
	addl	24(%rsp),%edx
	psrld	$31,%xmm13
	xorl	%ebx,%eax
	roll	$5,%ebp
	addl	%esi,%edx
	movups	-16(%r15),%xmm1
.byte	102,15,56,220,208
	movdqa	%xmm12,%xmm3
	andl	%eax,%edi
	xorl	%ebx,%eax
	psrld	$30,%xmm12
	addl	%ebp,%edx
	rorl	$7,%ebp
	por	%xmm13,%xmm9
	xorl	%ebx,%edi
	movl	%edx,%esi
	addl	28(%rsp),%ecx
	pslld	$2,%xmm3
	pxor	%xmm12,%xmm9
	xorl	%eax,%ebp
	movdqa	16(%r11),%xmm12
	roll	$5,%edx
	addl	%edi,%ecx
	andl	%ebp,%esi
	pxor	%xmm3,%xmm9
	xorl	%eax,%ebp
	addl	%edx,%ecx
	rorl	$7,%edx
	pshufd	$238,%xmm6,%xmm10
	xorl	%eax,%esi
	movdqa	%xmm9,%xmm3
	paddd	%xmm9,%xmm12
	movl	%ecx,%edi
	addl	32(%rsp),%ebx
	movups	0(%r15),%xmm0
.byte	102,15,56,220,209
	punpcklqdq	%xmm7,%xmm10
	xorl	%ebp,%edx
	roll	$5,%ecx
	addl	%esi,%ebx
	psrldq	$4,%xmm3
	andl	%edx,%edi
	xorl	%ebp,%edx
	pxor	%xmm6,%xmm10
	addl	%ecx,%ebx
	rorl	$7,%ecx
	pxor	%xmm8,%xmm3
	xorl	%ebp,%edi
	movl	%ebx,%esi
	addl	36(%rsp),%eax
	pxor	%xmm3,%xmm10
	xorl	%edx,%ecx
	roll	$5,%ebx
	movdqa	%xmm12,16(%rsp)
	addl	%edi,%eax
	andl	%ecx,%esi
	movdqa	%xmm10,%xmm13
	xorl	%edx,%ecx
	addl	%ebx,%eax
	rorl	$7,%ebx
	movups	16(%r15),%xmm1
.byte	102,15,56,220,208
	movdqa	%xmm10,%xmm3
	xorl	%edx,%esi
	pslldq	$12,%xmm13
	paddd	%xmm10,%xmm10
	movl	%eax,%edi
	addl	40(%rsp),%ebp
	psrld	$31,%xmm3
	xorl	%ecx,%ebx
	roll	$5,%eax
	addl	%esi,%ebp
	movdqa	%xmm13,%xmm12
	andl	%ebx,%edi
	xorl	%ecx,%ebx
	psrld	$30,%xmm13
	addl	%eax,%ebp
	rorl	$7,%eax
	por	%xmm3,%xmm10
	xorl	%ecx,%edi
	movl	%ebp,%esi
	addl	44(%rsp),%edx
	pslld	$2,%xmm12
	pxor	%xmm13,%xmm10
	xorl	%ebx,%eax
	movdqa	16(%r11),%xmm13
	roll	$5,%ebp
	addl	%edi,%edx
	movups	32(%r15),%xmm0
.byte	102,15,56,220,209
	andl	%eax,%esi
	pxor	%xmm12,%xmm10
	xorl	%ebx,%eax
	addl	%ebp,%edx
	rorl	$7,%ebp
	pshufd	$238,%xmm7,%xmm11
	xorl	%ebx,%esi
	movdqa	%xmm10,%xmm12
	paddd	%xmm10,%xmm13
	movl	%edx,%edi
	addl	48(%rsp),%ecx
	punpcklqdq	%xmm8,%xmm11
	xorl	%eax,%ebp
	roll	$5,%edx
	addl	%esi,%ecx
	psrldq	$4,%xmm12
	andl	%ebp,%edi
	xorl	%eax,%ebp
	pxor	%xmm7,%xmm11
	addl	%edx,%ecx
	rorl	$7,%edx
	pxor	%xmm9,%xmm12
	xorl	%eax,%edi
	movl	%ecx,%esi
	addl	52(%rsp),%ebx
	movups	48(%r15),%xmm1
.byte	102,15,56,220,208
	pxor	%xmm12,%xmm11
	xorl	%ebp,%edx
	roll	$5,%ecx
	movdqa	%xmm13,32(%rsp)
	addl	%edi,%ebx
	andl	%edx,%esi
	movdqa	%xmm11,%xmm3
	xorl	%ebp,%edx
	addl	%ecx,%ebx
	rorl	$7,%ecx
	movdqa	%xmm11,%xmm12
	xorl	%ebp,%esi
	pslldq	$12,%xmm3
	paddd	%xmm11,%xmm11
	movl	%ebx,%edi
	addl	56(%rsp),%eax
	psrld	$31,%xmm12
	xorl	%edx,%ecx
	roll	$5,%ebx
	addl	%esi,%eax
	movdqa	%xmm3,%xmm13
	andl	%ecx,%edi
	xorl	%edx,%ecx
	psrld	$30,%xmm3
	addl	%ebx,%eax
	rorl	$7,%ebx
	cmpl	$11,%r8d
	jb	.Laesenclast1
	movups	64(%r15),%xmm0
.byte	102,15,56,220,209
	movups	80(%r15),%xmm1
.byte	102,15,56,220,208
	je	.Laesenclast1
	movups	96(%r15),%xmm0
.byte	102,15,56,220,209
	movups	112(%r15),%xmm1
.byte	102,15,56,220,208
.Laesenclast1:
.byte	102,15,56,221,209
	movups	16-112(%r15),%xmm0
	por	%xmm12,%xmm11
	xorl	%edx,%edi
	movl	%eax,%esi
	addl	60(%rsp),%ebp
	pslld	$2,%xmm13
	pxor	%xmm3,%xmm11
	xorl	%ecx,%ebx
	movdqa	16(%r11),%xmm3
	roll	$5,%eax
	addl	%edi,%ebp
	andl	%ebx,%esi
	pxor	%xmm13,%xmm11
	pshufd	$238,%xmm10,%xmm13
	xorl	%ecx,%ebx
	addl	%eax,%ebp
	rorl	$7,%eax
	pxor	%xmm8,%xmm4
	xorl	%ecx,%esi
	movl	%ebp,%edi
	addl	0(%rsp),%edx
	punpcklqdq	%xmm11,%xmm13
	xorl	%ebx,%eax
	roll	$5,%ebp
	pxor	%xmm5,%xmm4
	addl	%esi,%edx
	movups	16(%r12),%xmm14
	xorps	%xmm15,%xmm14
	movups	%xmm2,0(%r12,%r13,1)
	xorps	%xmm14,%xmm2
	movups	-80(%r15),%xmm1
.byte	102,15,56,220,208
	andl	%eax,%edi
	movdqa	%xmm3,%xmm12
	xorl	%ebx,%eax
	paddd	%xmm11,%xmm3
	addl	%ebp,%edx
	pxor	%xmm13,%xmm4
	rorl	$7,%ebp
	xorl	%ebx,%edi
	movl	%edx,%esi
	addl	4(%rsp),%ecx
	movdqa	%xmm4,%xmm13
	xorl	%eax,%ebp
	roll	$5,%edx
	movdqa	%xmm3,48(%rsp)
	addl	%edi,%ecx
	andl	%ebp,%esi
	xorl	%eax,%ebp
	pslld	$2,%xmm4
	addl	%edx,%ecx
	rorl	$7,%edx
	psrld	$30,%xmm13
	xorl	%eax,%esi
	movl	%ecx,%edi
	addl	8(%rsp),%ebx
	movups	-64(%r15),%xmm0
.byte	102,15,56,220,209
	por	%xmm13,%xmm4
	xorl	%ebp,%edx
	roll	$5,%ecx
	pshufd	$238,%xmm11,%xmm3
	addl	%esi,%ebx
	andl	%edx,%edi
	xorl	%ebp,%edx
	addl	%ecx,%ebx
	addl	12(%rsp),%eax
	xorl	%ebp,%edi
	movl	%ebx,%esi
	roll	$5,%ebx
	addl	%edi,%eax
	xorl	%edx,%esi
	rorl	$7,%ecx
	addl	%ebx,%eax
	pxor	%xmm9,%xmm5
	addl	16(%rsp),%ebp
	movups	-48(%r15),%xmm1
.byte	102,15,56,220,208
	xorl	%ecx,%esi
	punpcklqdq	%xmm4,%xmm3
	movl	%eax,%edi
	roll	$5,%eax
	pxor	%xmm6,%xmm5
	addl	%esi,%ebp
	xorl	%ecx,%edi
	movdqa	%xmm12,%xmm13
	rorl	$7,%ebx
	paddd	%xmm4,%xmm12
	addl	%eax,%ebp
	pxor	%xmm3,%xmm5
	addl	20(%rsp),%edx
	xorl	%ebx,%edi
	movl	%ebp,%esi
	roll	$5,%ebp
	movdqa	%xmm5,%xmm3
	addl	%edi,%edx
	xorl	%ebx,%esi
	movdqa	%xmm12,0(%rsp)
	rorl	$7,%eax
	addl	%ebp,%edx
	addl	24(%rsp),%ecx
	pslld	$2,%xmm5
	xorl	%eax,%esi
	movl	%edx,%edi
	psrld	$30,%xmm3
	roll	$5,%edx
	addl	%esi,%ecx
	movups	-32(%r15),%xmm0
.byte	102,15,56,220,209
	xorl	%eax,%edi
	rorl	$7,%ebp
	por	%xmm3,%xmm5
	addl	%edx,%ecx
	addl	28(%rsp),%ebx
	pshufd	$238,%xmm4,%xmm12
	xorl	%ebp,%edi
	movl	%ecx,%esi
	roll	$5,%ecx
	addl	%edi,%ebx
	xorl	%ebp,%esi
	rorl	$7,%edx
	addl	%ecx,%ebx
	pxor	%xmm10,%xmm6
	addl	32(%rsp),%eax
	xorl	%edx,%esi
	punpcklqdq	%xmm5,%xmm12
	movl	%ebx,%edi
	roll	$5,%ebx
	pxor	%xmm7,%xmm6
	addl	%esi,%eax
	xorl	%edx,%edi
	movdqa	32(%r11),%xmm3
	rorl	$7,%ecx
	paddd	%xmm5,%xmm13
	addl	%ebx,%eax
	pxor	%xmm12,%xmm6
	addl	36(%rsp),%ebp
	movups	-16(%r15),%xmm1
.byte	102,15,56,220,208
	xorl	%ecx,%edi
	movl	%eax,%esi
	roll	$5,%eax
	movdqa	%xmm6,%xmm12
	addl	%edi,%ebp
	xorl	%ecx,%esi
	movdqa	%xmm13,16(%rsp)
	rorl	$7,%ebx
	addl	%eax,%ebp
	addl	40(%rsp),%edx
	pslld	$2,%xmm6
	xorl	%ebx,%esi
	movl	%ebp,%edi
	psrld	$30,%xmm12
	roll	$5,%ebp
	addl	%esi,%edx
	xorl	%ebx,%edi
	rorl	$7,%eax
	por	%xmm12,%xmm6
	addl	%ebp,%edx
	addl	44(%rsp),%ecx
	pshufd	$238,%xmm5,%xmm13
	xorl	%eax,%edi
	movl	%edx,%esi
	roll	$5,%edx
	addl	%edi,%ecx
	movups	0(%r15),%xmm0
.byte	102,15,56,220,209
	xorl	%eax,%esi
	rorl	$7,%ebp
	addl	%edx,%ecx
	pxor	%xmm11,%xmm7
	addl	48(%rsp),%ebx
	xorl	%ebp,%esi
	punpcklqdq	%xmm6,%xmm13
	movl	%ecx,%edi
	roll	$5,%ecx
	pxor	%xmm8,%xmm7
	addl	%esi,%ebx
	xorl	%ebp,%edi
	movdqa	%xmm3,%xmm12
	rorl	$7,%edx
	paddd	%xmm6,%xmm3
	addl	%ecx,%ebx
	pxor	%xmm13,%xmm7
	addl	52(%rsp),%eax
	xorl	%edx,%edi
	movl	%ebx,%esi
	roll	$5,%ebx
	movdqa	%xmm7,%xmm13
	addl	%edi,%eax
	xorl	%edx,%esi
	movdqa	%xmm3,32(%rsp)
	rorl	$7,%ecx
	addl	%ebx,%eax
	addl	56(%rsp),%ebp
	movups	16(%r15),%xmm1
.byte	102,15,56,220,208
	pslld	$2,%xmm7
	xorl	%ecx,%esi
	movl	%eax,%edi
	psrld	$30,%xmm13
	roll	$5,%eax
	addl	%esi,%ebp
	xorl	%ecx,%edi
	rorl	$7,%ebx
	por	%xmm13,%xmm7
	addl	%eax,%ebp
	addl	60(%rsp),%edx
	pshufd	$238,%xmm6,%xmm3
	xorl	%ebx,%edi
	movl	%ebp,%esi
	roll	$5,%ebp
	addl	%edi,%edx
	xorl	%ebx,%esi
	rorl	$7,%eax
	addl	%ebp,%edx
	pxor	%xmm4,%xmm8
	addl	0(%rsp),%ecx
	xorl	%eax,%esi
	punpcklqdq	%xmm7,%xmm3
	movl	%edx,%edi
	roll	$5,%edx
	pxor	%xmm9,%xmm8
	addl	%esi,%ecx
	movups	32(%r15),%xmm0
.byte	102,15,56,220,209
	xorl	%eax,%edi
	movdqa	%xmm12,%xmm13
	rorl	$7,%ebp
	paddd	%xmm7,%xmm12
	addl	%edx,%ecx
	pxor	%xmm3,%xmm8
	addl	4(%rsp),%ebx
	xorl	%ebp,%edi
	movl	%ecx,%esi
	roll	$5,%ecx
	movdqa	%xmm8,%xmm3
	addl	%edi,%ebx
	xorl	%ebp,%esi
	movdqa	%xmm12,48(%rsp)
	rorl	$7,%edx
	addl	%ecx,%ebx
	addl	8(%rsp),%eax
	pslld	$2,%xmm8
	xorl	%edx,%esi
	movl	%ebx,%edi
	psrld	$30,%xmm3
	roll	$5,%ebx
	addl	%esi,%eax
	xorl	%edx,%edi
	rorl	$7,%ecx
	por	%xmm3,%xmm8
	addl	%ebx,%eax
	addl	12(%rsp),%ebp
	movups	48(%r15),%xmm1
.byte	102,15,56,220,208
	pshufd	$238,%xmm7,%xmm12
	xorl	%ecx,%edi
	movl	%eax,%esi
	roll	$5,%eax
	addl	%edi,%ebp
	xorl	%ecx,%esi
	rorl	$7,%ebx
	addl	%eax,%ebp
	pxor	%xmm5,%xmm9
	addl	16(%rsp),%edx
	xorl	%ebx,%esi
	punpcklqdq	%xmm8,%xmm12
	movl	%ebp,%edi
	roll	$5,%ebp
	pxor	%xmm10,%xmm9
	addl	%esi,%edx
	xorl	%ebx,%edi
	movdqa	%xmm13,%xmm3
	rorl	$7,%eax
	paddd	%xmm8,%xmm13
	addl	%ebp,%edx
	pxor	%xmm12,%xmm9
	addl	20(%rsp),%ecx
	xorl	%eax,%edi
	movl	%edx,%esi
	roll	$5,%edx
	movdqa	%xmm9,%xmm12
	addl	%edi,%ecx
	cmpl	$11,%r8d
	jb	.Laesenclast2
	movups	64(%r15),%xmm0
.byte	102,15,56,220,209
	movups	80(%r15),%xmm1
.byte	102,15,56,220,208
	je	.Laesenclast2
	movups	96(%r15),%xmm0
.byte	102,15,56,220,209
	movups	112(%r15),%xmm1
.byte	102,15,56,220,208
.Laesenclast2:
.byte	102,15,56,221,209
	movups	16-112(%r15),%xmm0
	xorl	%eax,%esi
	movdqa	%xmm13,0(%rsp)
	rorl	$7,%ebp
	addl	%edx,%ecx
	addl	24(%rsp),%ebx
	pslld	$2,%xmm9
	xorl	%ebp,%esi
	movl	%ecx,%edi
	psrld	$30,%xmm12
	roll	$5,%ecx
	addl	%esi,%ebx
	xorl	%ebp,%edi
	rorl	$7,%edx
	por	%xmm12,%xmm9
	addl	%ecx,%ebx
	addl	28(%rsp),%eax
	pshufd	$238,%xmm8,%xmm13
	rorl	$7,%ecx
	movl	%ebx,%esi
	xorl	%edx,%edi
	roll	$5,%ebx
	addl	%edi,%eax
	xorl	%ecx,%esi
	xorl	%edx,%ecx
	addl	%ebx,%eax
	pxor	%xmm6,%xmm10
	addl	32(%rsp),%ebp
	movups	32(%r12),%xmm14
	xorps	%xmm15,%xmm14
	movups	%xmm2,16(%r13,%r12,1)
	xorps	%xmm14,%xmm2
	movups	-80(%r15),%xmm1
.byte	102,15,56,220,208
	andl	%ecx,%esi
	xorl	%edx,%ecx
	rorl	$7,%ebx
	punpcklqdq	%xmm9,%xmm13
	movl	%eax,%edi
	xorl	%ecx,%esi
	pxor	%xmm11,%xmm10
	roll	$5,%eax
	addl	%esi,%ebp
	movdqa	%xmm3,%xmm12
	xorl	%ebx,%edi
	paddd	%xmm9,%xmm3
	xorl	%ecx,%ebx
	pxor	%xmm13,%xmm10
	addl	%eax,%ebp
	addl	36(%rsp),%edx
	andl	%ebx,%edi
	xorl	%ecx,%ebx
	rorl	$7,%eax
	movdqa	%xmm10,%xmm13
	movl	%ebp,%esi
	xorl	%ebx,%edi
	movdqa	%xmm3,16(%rsp)
	roll	$5,%ebp
	addl	%edi,%edx
	movups	-64(%r15),%xmm0
.byte	102,15,56,220,209
	xorl	%eax,%esi
	pslld	$2,%xmm10
	xorl	%ebx,%eax
	addl	%ebp,%edx
	psrld	$30,%xmm13
	addl	40(%rsp),%ecx
	andl	%eax,%esi
	xorl	%ebx,%eax
	por	%xmm13,%xmm10
	rorl	$7,%ebp
	movl	%edx,%edi
	xorl	%eax,%esi
	roll	$5,%edx
	pshufd	$238,%xmm9,%xmm3
	addl	%esi,%ecx
	xorl	%ebp,%edi
	xorl	%eax,%ebp
	addl	%edx,%ecx
	addl	44(%rsp),%ebx
	andl	%ebp,%edi
	xorl	%eax,%ebp
	rorl	$7,%edx
	movups	-48(%r15),%xmm1
.byte	102,15,56,220,208
	movl	%ecx,%esi
	xorl	%ebp,%edi
	roll	$5,%ecx
	addl	%edi,%ebx
	xorl	%edx,%esi
	xorl	%ebp,%edx
	addl	%ecx,%ebx
	pxor	%xmm7,%xmm11
	addl	48(%rsp),%eax
	andl	%edx,%esi
	xorl	%ebp,%edx
	rorl	$7,%ecx
	punpcklqdq	%xmm10,%xmm3
	movl	%ebx,%edi
	xorl	%edx,%esi
	pxor	%xmm4,%xmm11
	roll	$5,%ebx
	addl	%esi,%eax
	movdqa	48(%r11),%xmm13
	xorl	%ecx,%edi
	paddd	%xmm10,%xmm12
	xorl	%edx,%ecx
	pxor	%xmm3,%xmm11
	addl	%ebx,%eax
	addl	52(%rsp),%ebp
	movups	-32(%r15),%xmm0
.byte	102,15,56,220,209
	andl	%ecx,%edi
	xorl	%edx,%ecx
	rorl	$7,%ebx
	movdqa	%xmm11,%xmm3
	movl	%eax,%esi
	xorl	%ecx,%edi
	movdqa	%xmm12,32(%rsp)
	roll	$5,%eax
	addl	%edi,%ebp
	xorl	%ebx,%esi
	pslld	$2,%xmm11
	xorl	%ecx,%ebx
	addl	%eax,%ebp
	psrld	$30,%xmm3
	addl	56(%rsp),%edx
	andl	%ebx,%esi
	xorl	%ecx,%ebx
	por	%xmm3,%xmm11
	rorl	$7,%eax
	movl	%ebp,%edi
	xorl	%ebx,%esi
	roll	$5,%ebp
	pshufd	$238,%xmm10,%xmm12
	addl	%esi,%edx
	movups	-16(%r15),%xmm1
.byte	102,15,56,220,208
	xorl	%eax,%edi
	xorl	%ebx,%eax
	addl	%ebp,%edx
	addl	60(%rsp),%ecx
	andl	%eax,%edi
	xorl	%ebx,%eax
	rorl	$7,%ebp
	movl	%edx,%esi
	xorl	%eax,%edi
	roll	$5,%edx
	addl	%edi,%ecx
	xorl	%ebp,%esi
	xorl	%eax,%ebp
	addl	%edx,%ecx
	pxor	%xmm8,%xmm4
	addl	0(%rsp),%ebx
	andl	%ebp,%esi
	xorl	%eax,%ebp
	rorl	$7,%edx
	movups	0(%r15),%xmm0
.byte	102,15,56,220,209
	punpcklqdq	%xmm11,%xmm12
	movl	%ecx,%edi
	xorl	%ebp,%esi
	pxor	%xmm5,%xmm4
	roll	$5,%ecx
	addl	%esi,%ebx
	movdqa	%xmm13,%xmm3
	xorl	%edx,%edi
	paddd	%xmm11,%xmm13
	xorl	%ebp,%edx
	pxor	%xmm12,%xmm4
	addl	%ecx,%ebx
	addl	4(%rsp),%eax
	andl	%edx,%edi
	xorl	%ebp,%edx
	rorl	$7,%ecx
	movdqa	%xmm4,%xmm12
	movl	%ebx,%esi
	xorl	%edx,%edi
	movdqa	%xmm13,48(%rsp)
	roll	$5,%ebx
	addl	%edi,%eax
	xorl	%ecx,%esi
	pslld	$2,%xmm4
	xorl	%edx,%ecx
	addl	%ebx,%eax
	psrld	$30,%xmm12
	addl	8(%rsp),%ebp
	movups	16(%r15),%xmm1
.byte	102,15,56,220,208
	andl	%ecx,%esi
	xorl	%edx,%ecx
	por	%xmm12,%xmm4
	rorl	$7,%ebx
	movl	%eax,%edi
	xorl	%ecx,%esi
	roll	$5,%eax
	pshufd	$238,%xmm11,%xmm13
	addl	%esi,%ebp
	xorl	%ebx,%edi
	xorl	%ecx,%ebx
	addl	%eax,%ebp
	addl	12(%rsp),%edx
	andl	%ebx,%edi
	xorl	%ecx,%ebx
	rorl	$7,%eax
	movl	%ebp,%esi
	xorl	%ebx,%edi
	roll	$5,%ebp
	addl	%edi,%edx
	movups	32(%r15),%xmm0
.byte	102,15,56,220,209
	xorl	%eax,%esi
	xorl	%ebx,%eax
	addl	%ebp,%edx
	pxor	%xmm9,%xmm5
	addl	16(%rsp),%ecx
	andl	%eax,%esi
	xorl	%ebx,%eax
	rorl	$7,%ebp
	punpcklqdq	%xmm4,%xmm13
	movl	%edx,%edi
	xorl	%eax,%esi
	pxor	%xmm6,%xmm5
	roll	$5,%edx
	addl	%esi,%ecx
	movdqa	%xmm3,%xmm12
	xorl	%ebp,%edi
	paddd	%xmm4,%xmm3
	xorl	%eax,%ebp
	pxor	%xmm13,%xmm5
	addl	%edx,%ecx
	addl	20(%rsp),%ebx
	andl	%ebp,%edi
	xorl	%eax,%ebp
	rorl	$7,%edx
	movups	48(%r15),%xmm1
.byte	102,15,56,220,208
	movdqa	%xmm5,%xmm13
	movl	%ecx,%esi
	xorl	%ebp,%edi
	movdqa	%xmm3,0(%rsp)
	roll	$5,%ecx
	addl	%edi,%ebx
	xorl	%edx,%esi
	pslld	$2,%xmm5
	xorl	%ebp,%edx
	addl	%ecx,%ebx
	psrld	$30,%xmm13
	addl	24(%rsp),%eax
	andl	%edx,%esi
	xorl	%ebp,%edx
	por	%xmm13,%xmm5
	rorl	$7,%ecx
	movl	%ebx,%edi
	xorl	%edx,%esi
	roll	$5,%ebx
	pshufd	$238,%xmm4,%xmm3
	addl	%esi,%eax
	xorl	%ecx,%edi
	xorl	%edx,%ecx
	addl	%ebx,%eax
	addl	28(%rsp),%ebp
	cmpl	$11,%r8d
	jb	.Laesenclast3
	movups	64(%r15),%xmm0
.byte	102,15,56,220,209
	movups	80(%r15),%xmm1
.byte	102,15,56,220,208
	je	.Laesenclast3
	movups	96(%r15),%xmm0
.byte	102,15,56,220,209
	movups	112(%r15),%xmm1
.byte	102,15,56,220,208
.Laesenclast3:
.byte	102,15,56,221,209
	movups	16-112(%r15),%xmm0
	andl	%ecx,%edi
	xorl	%edx,%ecx
	rorl	$7,%ebx
	movl	%eax,%esi
	xorl	%ecx,%edi
	roll	$5,%eax
	addl	%edi,%ebp
	xorl	%ebx,%esi
	xorl	%ecx,%ebx
	addl	%eax,%ebp
	pxor	%xmm10,%xmm6
	addl	32(%rsp),%edx
	andl	%ebx,%esi
	xorl	%ecx,%ebx
	rorl	$7,%eax
	punpcklqdq	%xmm5,%xmm3
	movl	%ebp,%edi
	xorl	%ebx,%esi
	pxor	%xmm7,%xmm6
	roll	$5,%ebp
	addl	%esi,%edx
	movups	48(%r12),%xmm14
	xorps	%xmm15,%xmm14
	movups	%xmm2,32(%r13,%r12,1)
	xorps	%xmm14,%xmm2
	movups	-80(%r15),%xmm1
.byte	102,15,56,220,208
	movdqa	%xmm12,%xmm13
	xorl	%eax,%edi
	paddd	%xmm5,%xmm12
	xorl	%ebx,%eax
	pxor	%xmm3,%xmm6
	addl	%ebp,%edx
	addl	36(%rsp),%ecx
	andl	%eax,%edi
	xorl	%ebx,%eax
	rorl	$7,%ebp
	movdqa	%xmm6,%xmm3
	movl	%edx,%esi
	xorl	%eax,%edi
	movdqa	%xmm12,16(%rsp)
	roll	$5,%edx
	addl	%edi,%ecx
	xorl	%ebp,%esi
	pslld	$2,%xmm6
	xorl	%eax,%ebp
	addl	%edx,%ecx
	psrld	$30,%xmm3
	addl	40(%rsp),%ebx
	andl	%ebp,%esi
	xorl	%eax,%ebp
	por	%xmm3,%xmm6
	rorl	$7,%edx
	movups	-64(%r15),%xmm0
.byte	102,15,56,220,209
	movl	%ecx,%edi
	xorl	%ebp,%esi
	roll	$5,%ecx
	pshufd	$238,%xmm5,%xmm12
	addl	%esi,%ebx
	xorl	%edx,%edi
	xorl	%ebp,%edx
	addl	%ecx,%ebx
	addl	44(%rsp),%eax
	andl	%edx,%edi
	xorl	%ebp,%edx
	rorl	$7,%ecx
	movl	%ebx,%esi
	xorl	%edx,%edi
	roll	$5,%ebx
	addl	%edi,%eax
	xorl	%edx,%esi
	addl	%ebx,%eax
	pxor	%xmm11,%xmm7
	addl	48(%rsp),%ebp
	movups	-48(%r15),%xmm1
.byte	102,15,56,220,208
	xorl	%ecx,%esi
	punpcklqdq	%xmm6,%xmm12
	movl	%eax,%edi
	roll	$5,%eax
	pxor	%xmm8,%xmm7
	addl	%esi,%ebp
	xorl	%ecx,%edi
	movdqa	%xmm13,%xmm3
	rorl	$7,%ebx
	paddd	%xmm6,%xmm13
	addl	%eax,%ebp
	pxor	%xmm12,%xmm7
	addl	52(%rsp),%edx
	xorl	%ebx,%edi
	movl	%ebp,%esi
	roll	$5,%ebp
	movdqa	%xmm7,%xmm12
	addl	%edi,%edx
	xorl	%ebx,%esi
	movdqa	%xmm13,32(%rsp)
	rorl	$7,%eax
	addl	%ebp,%edx
	addl	56(%rsp),%ecx
	pslld	$2,%xmm7
	xorl	%eax,%esi
	movl	%edx,%edi
	psrld	$30,%xmm12
	roll	$5,%edx
	addl	%esi,%ecx
	movups	-32(%r15),%xmm0
.byte	102,15,56,220,209
	xorl	%eax,%edi
	rorl	$7,%ebp
	por	%xmm12,%xmm7
	addl	%edx,%ecx
	addl	60(%rsp),%ebx
	xorl	%ebp,%edi
	movl	%ecx,%esi
	roll	$5,%ecx
	addl	%edi,%ebx
	xorl	%ebp,%esi
	rorl	$7,%edx
	addl	%ecx,%ebx
	addl	0(%rsp),%eax
	xorl	%edx,%esi
	movl	%ebx,%edi
	roll	$5,%ebx
	paddd	%xmm7,%xmm3
	addl	%esi,%eax
	xorl	%edx,%edi
	movdqa	%xmm3,48(%rsp)
	rorl	$7,%ecx
	addl	%ebx,%eax
	addl	4(%rsp),%ebp
	movups	-16(%r15),%xmm1
.byte	102,15,56,220,208
	xorl	%ecx,%edi
	movl	%eax,%esi
	roll	$5,%eax
	addl	%edi,%ebp
	xorl	%ecx,%esi
	rorl	$7,%ebx
	addl	%eax,%ebp
	addl	8(%rsp),%edx
	xorl	%ebx,%esi
	movl	%ebp,%edi
	roll	$5,%ebp
	addl	%esi,%edx
	xorl	%ebx,%edi
	rorl	$7,%eax
	addl	%ebp,%edx
	addl	12(%rsp),%ecx
	xorl	%eax,%edi
	movl	%edx,%esi
	roll	$5,%edx
	addl	%edi,%ecx
	movups	0(%r15),%xmm0
.byte	102,15,56,220,209
	xorl	%eax,%esi
	rorl	$7,%ebp
	addl	%edx,%ecx
	cmpq	%r14,%r10
	je	.Ldone_ssse3
	movdqa	64(%r11),%xmm3
	movdqa	0(%r11),%xmm13
	movdqu	0(%r10),%xmm4
	movdqu	16(%r10),%xmm5
	movdqu	32(%r10),%xmm6
	movdqu	48(%r10),%xmm7
.byte	102,15,56,0,227
	addq	$64,%r10
	addl	16(%rsp),%ebx
	xorl	%ebp,%esi
	movl	%ecx,%edi
.byte	102,15,56,0,235
	roll	$5,%ecx
	addl	%esi,%ebx
	xorl	%ebp,%edi
	rorl	$7,%edx
	paddd	%xmm13,%xmm4
	addl	%ecx,%ebx
	addl	20(%rsp),%eax
	xorl	%edx,%edi
	movl	%ebx,%esi
	movdqa	%xmm4,0(%rsp)
	roll	$5,%ebx
	addl	%edi,%eax
	xorl	%edx,%esi
	rorl	$7,%ecx
	psubd	%xmm13,%xmm4
	addl	%ebx,%eax
	addl	24(%rsp),%ebp
	movups	16(%r15),%xmm1
.byte	102,15,56,220,208
	xorl	%ecx,%esi
	movl	%eax,%edi
	roll	$5,%eax
	addl	%esi,%ebp
	xorl	%ecx,%edi
	rorl	$7,%ebx
	addl	%eax,%ebp
	addl	28(%rsp),%edx
	xorl	%ebx,%edi
	movl	%ebp,%esi
	roll	$5,%ebp
	addl	%edi,%edx
	xorl	%ebx,%esi
	rorl	$7,%eax
	addl	%ebp,%edx
	addl	32(%rsp),%ecx
	xorl	%eax,%esi
	movl	%edx,%edi
.byte	102,15,56,0,243
	roll	$5,%edx
	addl	%esi,%ecx
	movups	32(%r15),%xmm0
.byte	102,15,56,220,209
	xorl	%eax,%edi
	rorl	$7,%ebp
	paddd	%xmm13,%xmm5
	addl	%edx,%ecx
	addl	36(%rsp),%ebx
	xorl	%ebp,%edi
	movl	%ecx,%esi
	movdqa	%xmm5,16(%rsp)
	roll	$5,%ecx
	addl	%edi,%ebx
	xorl	%ebp,%esi
	rorl	$7,%edx
	psubd	%xmm13,%xmm5
	addl	%ecx,%ebx
	addl	40(%rsp),%eax
	xorl	%edx,%esi
	movl	%ebx,%edi
	roll	$5,%ebx
	addl	%esi,%eax
	xorl	%edx,%edi
	rorl	$7,%ecx
	addl	%ebx,%eax
	addl	44(%rsp),%ebp
	movups	48(%r15),%xmm1
.byte	102,15,56,220,208
	xorl	%ecx,%edi
	movl	%eax,%esi
	roll	$5,%eax
	addl	%edi,%ebp
	xorl	%ecx,%esi
	rorl	$7,%ebx
	addl	%eax,%ebp
	addl	48(%rsp),%edx
	xorl	%ebx,%esi
	movl	%ebp,%edi
.byte	102,15,56,0,251
	roll	$5,%ebp
	addl	%esi,%edx
	xorl	%ebx,%edi
	rorl	$7,%eax
	paddd	%xmm13,%xmm6
	addl	%ebp,%edx
	addl	52(%rsp),%ecx
	xorl	%eax,%edi
	movl	%edx,%esi
	movdqa	%xmm6,32(%rsp)
	roll	$5,%edx
	addl	%edi,%ecx
	cmpl	$11,%r8d
	jb	.Laesenclast4
	movups	64(%r15),%xmm0
.byte	102,15,56,220,209
	movups	80(%r15),%xmm1
.byte	102,15,56,220,208
	je	.Laesenclast4
	movups	96(%r15),%xmm0
.byte	102,15,56,220,209
	movups	112(%r15),%xmm1
.byte	102,15,56,220,208
.Laesenclast4:
.byte	102,15,56,221,209
	movups	16-112(%r15),%xmm0
	xorl	%eax,%esi
	rorl	$7,%ebp
	psubd	%xmm13,%xmm6
	addl	%edx,%ecx
	addl	56(%rsp),%ebx
	xorl	%ebp,%esi
	movl	%ecx,%edi
	roll	$5,%ecx
	addl	%esi,%ebx
	xorl	%ebp,%edi
	rorl	$7,%edx
	addl	%ecx,%ebx
	addl	60(%rsp),%eax
	xorl	%edx,%edi
	movl	%ebx,%esi
	roll	$5,%ebx
	addl	%edi,%eax
	rorl	$7,%ecx
	addl	%ebx,%eax
	movups	%xmm2,48(%r13,%r12,1)
	leaq	64(%r12),%r12

	addl	0(%r9),%eax
	addl	4(%r9),%esi
	addl	8(%r9),%ecx
	addl	12(%r9),%edx
	movl	%eax,0(%r9)
	addl	16(%r9),%ebp
	movl	%esi,4(%r9)
	movl	%esi,%ebx
	movl	%ecx,8(%r9)
	movl	%ecx,%edi
	movl	%edx,12(%r9)
	xorl	%edx,%edi
	movl	%ebp,16(%r9)
	andl	%edi,%esi
	jmp	.Loop_ssse3

.Ldone_ssse3:
	addl	16(%rsp),%ebx
	xorl	%ebp,%esi
	movl	%ecx,%edi
	roll	$5,%ecx
	addl	%esi,%ebx
	xorl	%ebp,%edi
	rorl	$7,%edx
	addl	%ecx,%ebx
	addl	20(%rsp),%eax
	xorl	%edx,%edi
	movl	%ebx,%esi
	roll	$5,%ebx
	addl	%edi,%eax
	xorl	%edx,%esi
	rorl	$7,%ecx
	addl	%ebx,%eax
	addl	24(%rsp),%ebp
	movups	16(%r15),%xmm1
.byte	102,15,56,220,208
	xorl	%ecx,%esi
	movl	%eax,%edi
	roll	$5,%eax
	addl	%esi,%ebp
	xorl	%ecx,%edi
	rorl	$7,%ebx
	addl	%eax,%ebp
	addl	28(%rsp),%edx
	xorl	%ebx,%edi
	movl	%ebp,%esi
	roll	$5,%ebp
	addl	%edi,%edx
	xorl	%ebx,%esi
	rorl	$7,%eax
	addl	%ebp,%edx
	addl	32(%rsp),%ecx
	xorl	%eax,%esi
	movl	%edx,%edi
	roll	$5,%edx
	addl	%esi,%ecx
	movups	32(%r15),%xmm0
.byte	102,15,56,220,209
	xorl	%eax,%edi
	rorl	$7,%ebp
	addl	%edx,%ecx
	addl	36(%rsp),%ebx
	xorl	%ebp,%edi
	movl	%ecx,%esi
	roll	$5,%ecx
	addl	%edi,%ebx
	xorl	%ebp,%esi
	rorl	$7,%edx
	addl	%ecx,%ebx
	addl	40(%rsp),%eax
	xorl	%edx,%esi
	movl	%ebx,%edi
	roll	$5,%ebx
	addl	%esi,%eax
	xorl	%edx,%edi
	rorl	$7,%ecx
	addl	%ebx,%eax
	addl	44(%rsp),%ebp
	movups	48(%r15),%xmm1
.byte	102,15,56,220,208
	xorl	%ecx,%edi
	movl	%eax,%esi
	roll	$5,%eax
	addl	%edi,%ebp
	xorl	%ecx,%esi
	rorl	$7,%ebx
	addl	%eax,%ebp
	addl	48(%rsp),%edx
	xorl	%ebx,%esi
	movl	%ebp,%edi
	roll	$5,%ebp
	addl	%esi,%edx
	xorl	%ebx,%edi
	rorl	$7,%eax
	addl	%ebp,%edx
	addl	52(%rsp),%ecx
	xorl	%eax,%edi
	movl	%edx,%esi
	roll	$5,%edx
	addl	%edi,%ecx
	cmpl	$11,%r8d
	jb	.Laesenclast5
	movups	64(%r15),%xmm0
.byte	102,15,56,220,209
	movups	80(%r15),%xmm1
.byte	102,15,56,220,208
	je	.Laesenclast5
	movups	96(%r15),%xmm0
.byte	102,15,56,220,209
	movups	112(%r15),%xmm1
.byte	102,15,56,220,208
.Laesenclast5:
.byte	102,15,56,221,209
	movups	16-112(%r15),%xmm0
	xorl	%eax,%esi
	rorl	$7,%ebp
	addl	%edx,%ecx
	addl	56(%rsp),%ebx
	xorl	%ebp,%esi
	movl	%ecx,%edi
	roll	$5,%ecx
	addl	%esi,%ebx
	xorl	%ebp,%edi
	rorl	$7,%edx
	addl	%ecx,%ebx
	addl	60(%rsp),%eax
	xorl	%edx,%edi
	movl	%ebx,%esi
	roll	$5,%ebx
	addl	%edi,%eax
	rorl	$7,%ecx
	addl	%ebx,%eax
	movups	%xmm2,48(%r13,%r12,1)
	movq	88(%rsp),%r8

	addl	0(%r9),%eax
	addl	4(%r9),%esi
	addl	8(%r9),%ecx
	movl	%eax,0(%r9)
	addl	12(%r9),%edx
	movl	%esi,4(%r9)
	addl	16(%r9),%ebp
	movl	%ecx,8(%r9)
	movl	%edx,12(%r9)
	movl	%ebp,16(%r9)
	movups	%xmm2,(%r8)
	leaq	104(%rsp),%rsi
	movq	0(%rsi),%r15
	movq	8(%rsi),%r14
	movq	16(%rsi),%r13
	movq	24(%rsi),%r12
	movq	32(%rsi),%rbp
	movq	40(%rsi),%rbx
	leaq	48(%rsi),%rsp
.Lepilogue_ssse3:
	.byte	0xf3,0xc3
.size	aesni_cbc_sha1_enc_ssse3,.-aesni_cbc_sha1_enc_ssse3
.align	64
K_XX_XX:
.long	0x5a827999,0x5a827999,0x5a827999,0x5a827999
.long	0x6ed9eba1,0x6ed9eba1,0x6ed9eba1,0x6ed9eba1
.long	0x8f1bbcdc,0x8f1bbcdc,0x8f1bbcdc,0x8f1bbcdc
.long	0xca62c1d6,0xca62c1d6,0xca62c1d6,0xca62c1d6
.long	0x00010203,0x04050607,0x08090a0b,0x0c0d0e0f
.byte	0xf,0xe,0xd,0xc,0xb,0xa,0x9,0x8,0x7,0x6,0x5,0x4,0x3,0x2,0x1,0x0

.byte	65,69,83,78,73,45,67,66,67,43,83,72,65,49,32,115,116,105,116,99,104,32,102,111,114,32,120,56,54,95,54,52,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
.align	64
.type	aesni_cbc_sha1_enc_shaext,@function
.align	32
aesni_cbc_sha1_enc_shaext:
	movq	8(%rsp),%r10
	movdqu	(%r9),%xmm8
	movd	16(%r9),%xmm9
	movdqa	K_XX_XX+80(%rip),%xmm7

	movl	240(%rcx),%r11d
	subq	%rdi,%rsi
	movups	(%rcx),%xmm15
	movups	16(%rcx),%xmm0
	leaq	112(%rcx),%rcx

	pshufd	$27,%xmm8,%xmm8
	pshufd	$27,%xmm9,%xmm9
	jmp	.Loop_shaext

.align	16
.Loop_shaext:
	movups	0(%rdi),%xmm14
	xorps	%xmm15,%xmm14
	xorps	%xmm14,%xmm2
	movups	-80(%rcx),%xmm1
.byte	102,15,56,220,208
	movdqu	(%r10),%xmm3
	movdqa	%xmm9,%xmm12
.byte	102,15,56,0,223
	movdqu	16(%r10),%xmm4
	movdqa	%xmm8,%xmm11
	movups	-64(%rcx),%xmm0
.byte	102,15,56,220,209
.byte	102,15,56,0,231

	paddd	%xmm3,%xmm9
	movdqu	32(%r10),%xmm5
	leaq	64(%r10),%r10
	pxor	%xmm12,%xmm3
	movups	-48(%rcx),%xmm1
.byte	102,15,56,220,208
	pxor	%xmm12,%xmm3
	movdqa	%xmm8,%xmm10
.byte	102,15,56,0,239
.byte	69,15,58,204,193,0
.byte	68,15,56,200,212
	movups	-32(%rcx),%xmm0
.byte	102,15,56,220,209
.byte	15,56,201,220
	movdqu	-16(%r10),%xmm6
	movdqa	%xmm8,%xmm9
.byte	102,15,56,0,247
	movups	-16(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	69,15,58,204,194,0
.byte	68,15,56,200,205
	pxor	%xmm5,%xmm3
.byte	15,56,201,229
	movups	0(%rcx),%xmm0
.byte	102,15,56,220,209
	movdqa	%xmm8,%xmm10
.byte	69,15,58,204,193,0
.byte	68,15,56,200,214
	movups	16(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,222
	pxor	%xmm6,%xmm4
.byte	15,56,201,238
	movups	32(%rcx),%xmm0
.byte	102,15,56,220,209
	movdqa	%xmm8,%xmm9
.byte	69,15,58,204,194,0
.byte	68,15,56,200,203
	movups	48(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,227
	pxor	%xmm3,%xmm5
.byte	15,56,201,243
	cmpl	$11,%r11d
	jb	.Laesenclast6
	movups	64(%rcx),%xmm0
.byte	102,15,56,220,209
	movups	80(%rcx),%xmm1
.byte	102,15,56,220,208
	je	.Laesenclast6
	movups	96(%rcx),%xmm0
.byte	102,15,56,220,209
	movups	112(%rcx),%xmm1
.byte	102,15,56,220,208
.Laesenclast6:
.byte	102,15,56,221,209
	movups	16-112(%rcx),%xmm0
	movdqa	%xmm8,%xmm10
.byte	69,15,58,204,193,0
.byte	68,15,56,200,212
	movups	16(%rdi),%xmm14
	xorps	%xmm15,%xmm14
	movups	%xmm2,0(%rsi,%rdi,1)
	xorps	%xmm14,%xmm2
	movups	-80(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,236
	pxor	%xmm4,%xmm6
.byte	15,56,201,220
	movups	-64(%rcx),%xmm0
.byte	102,15,56,220,209
	movdqa	%xmm8,%xmm9
.byte	69,15,58,204,194,1
.byte	68,15,56,200,205
	movups	-48(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,245
	pxor	%xmm5,%xmm3
.byte	15,56,201,229
	movups	-32(%rcx),%xmm0
.byte	102,15,56,220,209
	movdqa	%xmm8,%xmm10
.byte	69,15,58,204,193,1
.byte	68,15,56,200,214
	movups	-16(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,222
	pxor	%xmm6,%xmm4
.byte	15,56,201,238
	movups	0(%rcx),%xmm0
.byte	102,15,56,220,209
	movdqa	%xmm8,%xmm9
.byte	69,15,58,204,194,1
.byte	68,15,56,200,203
	movups	16(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,227
	pxor	%xmm3,%xmm5
.byte	15,56,201,243
	movups	32(%rcx),%xmm0
.byte	102,15,56,220,209
	movdqa	%xmm8,%xmm10
.byte	69,15,58,204,193,1
.byte	68,15,56,200,212
	movups	48(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,236
	pxor	%xmm4,%xmm6
.byte	15,56,201,220
	cmpl	$11,%r11d
	jb	.Laesenclast7
	movups	64(%rcx),%xmm0
.byte	102,15,56,220,209
	movups	80(%rcx),%xmm1
.byte	102,15,56,220,208
	je	.Laesenclast7
	movups	96(%rcx),%xmm0
.byte	102,15,56,220,209
	movups	112(%rcx),%xmm1
.byte	102,15,56,220,208
.Laesenclast7:
.byte	102,15,56,221,209
	movups	16-112(%rcx),%xmm0
	movdqa	%xmm8,%xmm9
.byte	69,15,58,204,194,1
.byte	68,15,56,200,205
	movups	32(%rdi),%xmm14
	xorps	%xmm15,%xmm14
	movups	%xmm2,16(%rsi,%rdi,1)
	xorps	%xmm14,%xmm2
	movups	-80(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,245
	pxor	%xmm5,%xmm3
.byte	15,56,201,229
	movups	-64(%rcx),%xmm0
.byte	102,15,56,220,209
	movdqa	%xmm8,%xmm10
.byte	69,15,58,204,193,2
.byte	68,15,56,200,214
	movups	-48(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,222
	pxor	%xmm6,%xmm4
.byte	15,56,201,238
	movups	-32(%rcx),%xmm0
.byte	102,15,56,220,209
	movdqa	%xmm8,%xmm9
.byte	69,15,58,204,194,2
.byte	68,15,56,200,203
	movups	-16(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,227
	pxor	%xmm3,%xmm5
.byte	15,56,201,243
	movups	0(%rcx),%xmm0
.byte	102,15,56,220,209
	movdqa	%xmm8,%xmm10
.byte	69,15,58,204,193,2
.byte	68,15,56,200,212
	movups	16(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,236
	pxor	%xmm4,%xmm6
.byte	15,56,201,220
	movups	32(%rcx),%xmm0
.byte	102,15,56,220,209
	movdqa	%xmm8,%xmm9
.byte	69,15,58,204,194,2
.byte	68,15,56,200,205
	movups	48(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,245
	pxor	%xmm5,%xmm3
.byte	15,56,201,229
	cmpl	$11,%r11d
	jb	.Laesenclast8
	movups	64(%rcx),%xmm0
.byte	102,15,56,220,209
	movups	80(%rcx),%xmm1
.byte	102,15,56,220,208
	je	.Laesenclast8
	movups	96(%rcx),%xmm0
.byte	102,15,56,220,209
	movups	112(%rcx),%xmm1
.byte	102,15,56,220,208
.Laesenclast8:
.byte	102,15,56,221,209
	movups	16-112(%rcx),%xmm0
	movdqa	%xmm8,%xmm10
.byte	69,15,58,204,193,2
.byte	68,15,56,200,214
	movups	48(%rdi),%xmm14
	xorps	%xmm15,%xmm14
	movups	%xmm2,32(%rsi,%rdi,1)
	xorps	%xmm14,%xmm2
	movups	-80(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,222
	pxor	%xmm6,%xmm4
.byte	15,56,201,238
	movups	-64(%rcx),%xmm0
.byte	102,15,56,220,209
	movdqa	%xmm8,%xmm9
.byte	69,15,58,204,194,3
.byte	68,15,56,200,203
	movups	-48(%rcx),%xmm1
.byte	102,15,56,220,208
.byte	15,56,202,227
	pxor	%xmm3,%xmm5
.byte	15,56,201,243
	movups	-32(%rcx),%xmm0
.byte	102,15,56,220,209
	movdqa	%xmm8,%xmm10
.byte	69,15,58,204,193,3
.byte	68,15,56,200,212
.byte	15,56,202,236
	pxor	%xmm4,%xmm6
	movups	-16(%rcx),%xmm1
.byte	102,15,56,220,208
	movdqa	%xmm8,%xmm9
.byte	69,15,58,204,194,3
.byte	68,15,56,200,205
.byte	15,56,202,245
	movups	0(%rcx),%xmm0
.byte	102,15,56,220,209
	movdqa	%xmm12,%xmm5
	movdqa	%xmm8,%xmm10
.byte	69,15,58,204,193,3
.byte	68,15,56,200,214
	movups	16(%rcx),%xmm1
.byte	102,15,56,220,208
	movdqa	%xmm8,%xmm9
.byte	69,15,58,204,194,3
.byte	68,15,56,200,205
	movups	32(%rcx),%xmm0
.byte	102,15,56,220,209
	movups	48(%rcx),%xmm1
.byte	102,15,56,220,208
	cmpl	$11,%r11d
	jb	.Laesenclast9
	movups	64(%rcx),%xmm0
.byte	102,15,56,220,209
	movups	80(%rcx),%xmm1
.byte	102,15,56,220,208
	je	.Laesenclast9
	movups	96(%rcx),%xmm0
.byte	102,15,56,220,209
	movups	112(%rcx),%xmm1
.byte	102,15,56,220,208
.Laesenclast9:
.byte	102,15,56,221,209
	movups	16-112(%rcx),%xmm0
	decq	%rdx

	paddd	%xmm11,%xmm8
	movups	%xmm2,48(%rsi,%rdi,1)
	leaq	64(%rdi),%rdi
	jnz	.Loop_shaext

	pshufd	$27,%xmm8,%xmm8
	pshufd	$27,%xmm9,%xmm9
	movups	%xmm2,(%r8)
	movdqu	%xmm8,(%r9)
	movd	%xmm9,16(%r9)
	.byte	0xf3,0xc3
.size	aesni_cbc_sha1_enc_shaext,.-aesni_cbc_sha1_enc_shaext
