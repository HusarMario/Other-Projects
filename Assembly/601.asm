TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data
buffer DB 5 dup(0)
delitel DW 10

.code
main PROC
	call Clrscr

	mov AX, 12345
	
	
	xor esi, esi
	
L1:
	cmp ax,0
	je L2

	xor dx, dx
	div delitel

	or dl,30h
	mov buffer[esi],dl
	inc esi
	
	jmp L1

L2:
	mov ecx, esi


L3:
	mov al,buffer[ecx-1]
	call WriteChar

	loop L3

	exit
main ENDP

END main