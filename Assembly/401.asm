TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data
R DB 21 DUP(0)
S DB 21 DUP(0)

.code
main PROC
	call Clrscr

	;nacitanie retazca
	mov edx,OFFSET R 
	mov ecx,SIZEOF R
	call ReadString

	;cyklus pre kopirovanie po znakoch z retazca z R do S
	mov EBX, OFFSET R
	mov EDX, OFFSET S
	xor esi, esi
	xor edi, edi
L1:
	mov AL,[EBX+ESI]
	cmp AL,'a'
	jne L2
	inc esi
	mov AL,[EBX+ESI]
	cmp AL,'s'
	jne L3
	mov AL,'*'
	mov [EDX+EDI],AL
	inc esi
	inc edi
	jmp L4
L3:
	mov AL,'a'
	mov [EDX+EDI], AL
	inc edi
	mov Al,'s'

L2:
	mov [EDX+EDI], AL
	inc esi
	inc edi
L4:
	cmp AL, 0
	JNE L1

	;vypis retazca S
	mov EDX, OFFSET S
	call WriteString

	exit
main ENDP

END main