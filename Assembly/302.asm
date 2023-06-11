TITLE MASM Template			

INCLUDE Irvine32.inc
.data
	buffer BYTE 21 DUP(0);

.code
main PROC
    call clrscr
	mov edx, OFFSET buffer 
	mov ecx, SIZEOF buffer
	call ReadString

    xor esi, esi
L1:
    mov Al, buffer[esi]
	cmp AL, 0
	jz LZ
	call Writechar


	inc Al
outz:
	cmp AL, 90
	jz z
	call Writechar




	call CRLF
	inc esi
	jmp L1

z:
	mov Al, 97
	jmp outz

LZ:

	exit
main ENDP

END main