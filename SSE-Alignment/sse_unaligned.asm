; sse_unaligned.asm
extern prinf
section .data
	; single precision
	spvector1		dd		1.1
					dd		2.2
					dd		3.3
					dd		4.4
	spvector2		dd		1.1
					dd		2.2
					dd		3.3
					dd		4.4

	; double precision
	dpvector1		dq		1.1
					dq		2.2
	spvector1		dq		3.3
					dq		4.4

	fmt1			db		"Single Precision Vector 1: %f, %f, %f, %f",10,0
	fmt2			db		"Single Precision Vector 2: %f, %f, %f, %f",10,0
	fmt3			db		"Sum of Single Precision Vector 1 and 2: %f, %f, %f, %f",10,0
	fmt4			db		"Double Precision Vector 1: %f, %f",10,0
	fmt5			db		"Double Precision Vector 2: %f, %f",10,0
	fmt6			db		"Sum of Double Precision Vector 1 and 2: %f, %f",10,0

	section .bss
		spvector_res		resd		4
		dpvector_res		resq		4
	
	section .text
		global main
	main:
		push		rbp
		mov			rbp, rsp
		; add 2 single precision floating point vectors
		mov			rsi, spvector1
		mov			rdi, fmt1
		call		printspfp

		mov			rsi, spvector2
		mov			rdi, fmt2
		call		printspfp

		movups		xmm0, [spvector1]
		movups		xmm1, [spvector2]
		addps		xmm0, xmm1

		movups		[spvector_res], xmm0
		mov			rsi, spvector_res
		mov			rdi, fmt3
		call		printspfp

		; add 2 double precision floating point vectors
		mov			rsi, dpvector1
		mov			rdi, fmt4
		call		printdpfp

		mov			rsi, dpvector2
		mov			rdi, fmt5ca
		call		printdpfp

		movupd		xmm0, [dpvector1]
		movupd		xmm1, [dpvector2]
		addpd		xmm0, xmm1
		movupd		[dpvector_res], xmm0
		mov			rsi, dpvector_res
		mov			rdi, fmt6
		call		printdpfp
leave
ret
