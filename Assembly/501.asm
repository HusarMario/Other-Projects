TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data
msg db 13,10,"Chyba vstupu!", 0
constant dw 10


.code
main PROC
	call Clrscr

	mov ECX, 5
	xor BX, BX
	xor DX, DX

L1:
	call ReadChar
	call WriteChar
	cmp AL,13
	je L3
	cmp AL,'0'
	jb L2
	cmp Al,'9'
	ja L2

	and AL, 0Fh

	mov bl, al
	mov ax, si
	mul constant
	add ax, bx
	mov si, ax


	loop L1 ;

	jmp L3;

L2:
	mov EDX,OFFSET msg
	call WriteString

L3:
	mov ax, si

	exit
main ENDP

END main