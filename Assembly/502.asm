TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data
msg db 13,10,"Chyba vstupu!", 0
constant dw 10
negative db 0

.code
main PROC
	call Clrscr

	mov ECX, 5
	xor BX, BX
	xor DX, DX

	call ReadChar
	call WriteChar
	cmp al, '-'
	jne L2
	mov negative, 1

	



L1:
	call ReadChar
	cmp AL,'-'
	je Znam

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

	loop L1 

	jmp L3

L2:
	mov EDX,OFFSET msg
	call WriteString

L3:
	mov ax, si
	cmp negative,1
	jne exit
	neg AX

EXIT:
	exit
main ENDP

END main