
.586
.model flat, c
.stack 100h
.data

.code

doit proc

	; this is a comment i can type whatever i like after a semicolon and assembler will ignore it
	
	; ---- Programming the Scientific Version's Expression Tree -----
	; 3 * 4 + 6 / 2 + 2 * 5
	; scientific, 25 is the result for scientific calc

	mov eax, 3
	mov ebx, 4
	mul ebx				; 3 * 4 = 12 -> eax		0000000C
	mov ecx, eax		; 12 -> ecx				0000000C	; needed to mov for div
	mov eax, 6
	mov ebx, 2
	div ebx				; 6 / 2 = 3 -> eax
	add ecx, eax		; 12 + 3 = 15 -> ecx	0000000F
	mov eax, 2
	mov ebx, 5
	mul ebx				; 2 * 5 = 10 -> eax		0000000A
	add eax, ecx		; 15 + 10 = 25 -> eax	00000019








	ret

	; ---- Optimizing the Previous Code Using Immediate Values ----

	;; 3 * 4 + 6 / 2 + 2 * 5 
	;
	;; standard, 55 is the result for standard calc
	;mov eax, 3			; 3 * 4
	;mov ebx, 4			
	;mul ebx				; eax = 12		0000000C
	;;mul 4		; error -- immediate operand not allowed
	;;move ebx, 6
	;;add eax, ebx		; 12 + 6 = 18	00000012
	;add eax, 6		; opimize - embed immediate value 6
	;mov ebx, 2			; 18 / 2 
	;div ebx				; eax = 9	
	;;div 2		; error -- immediate operand not allowed
	;;add eax, ebx		; 9 + 2 = 11	0000000B
	;add eax, 2		; opimize - embed immediate value 2
	;mov ebx, 5			; 11 * 5 
	;mul ebx				; eax = 55		00000037
	;
	;
	;; scientific, 25 is the result for scientific calc
	;
	;
	;
	;ret

	; ----- Programming the Standard Version's Expression Tree -----
	; 3 * 4 + 6 / 2 + 2 * 5 

	; standard, 55 is the result for standard calc
	;mov eax, 3			; 3 * 4
	;mov ebx, 4			
	;mul ebx				; eax = 12		0000000C
	;move ebx, 6
	;add eax, ebx		; 12 + 6 = 18	00000012
	;mov ebx, 2			; 18 / 2 
	;div ebx				; eax = 9		
	;add eax, ebx		; 9 + 2 = 11	0000000B
	;mov ebx, 5			; 11 * 5 
	;mul ebx				; eax = 55		00000037

	
	; scientific, 25 is the result for scientific calc



	;ret

	; ---- Two Expression Trees For the Same Equation -----
	; 3 * 4 + 6 / 2 + 2 * 5
	; 55 is the result for standard calc
	; 25 is the result for scientific calc


	;ret

	; ---- Expression Trees -----
	; 7 * 2 + 5 * 6		
	; result of expression in scientific calculator is 44
	; result in standard calculator is 114


	;ret

	; ----A More Complex Mathematical Expression ----

	; 7 + 2 * 8 - 8 / 5
	
	mov eax, 2		; eax 00000002
	mov ebx, 8		; ebx 00000008
	mul ebx			; (eax2 + ebx8)result 16decimal in eax hexadecimal00000010
	mov ecx, eax	; copy eax16 to ecx hexadecimal00000010
	mov eax, 8		; change eax2 to eax8 00000008
	mov ebx, 5		; change ebx8 to ebx5 00000005
	div ebx			; (eax8 / ebx5)result 1 in eax 00000001, remainder 3 in edx 00000003
	; 7 + 16 - 1
	mov ebx, 7		; ebx 00000007
	add ebx, ecx	; (ebx7 + ecx16)result decimal23 in ebx hexadecimal00000017
	; 23 - 1
	sub ebx, eax	; (ebx23 - eax1)result decimal22 in ebx hexadecimal00000016
	
	
	
	;ret
	
	
	
	; 9 / 2

	; ----Dividing Large Numbers---

	;mov eax, 0FFFFFFFFh	; largest 64bit value
	;mov edx, 0FFFFFFFFh
	;mov ebx, 2
	;div ebx
	;ret
	;error - integer overflow - result is too large must be less than 32bit


	;mov eax, 9		; eax(0000 0009) has the answer, edx(0000 0001) has the remainder
	;mov ebx, 2
	;mov edx, 1
	;div ebx
	;ret
	; ----Dividing Large Numbers---END
	
	
	;mov eax, 9		; eax has the answer, edx has the remainder
	;mov ebx, 2
	;div ebx
	
	; 2 useful assembly instrutions: nop , ret
	;nop				; no operation or do nothing for debugging
	;nop
	;nop
	;nop
	;ret				; return 
	
	
	
	; 8 * 4 

	;mov eax, 8		; eax is accumalator registry
	;mov ebx, 4
	;mov edx, 21323	; edx will fill the overflow	; edx is a data registry
	; mul eax, ebx	; syntacs error: mul only needs 1 argument	
	;mul ebx
	;mul 4
	
	;mov eax, 0FFFFFFFFh
	;mov ebx, 0FFFFFFFFh
	;mul ebx

	; the went bought. some I and, food to store	; wrong syntacs, semantics, parsing
	; I went to the store, and I bought some food. ;correct semantics, parse
	; I went to the run, and I bought some dive.	; wrong semantics

doit endp

end