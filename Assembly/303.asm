TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data
myMSG BYTE "Assembly language program example",0Ah,0
loadMSG BYTE 20 dup(0)
loadChar BYTE ?
count dword ?

.code
main PROC
	call Clrscr

	mov edx, OFFSET loadMSG
	mov ecx, SIZEOF loadMSG
	call ReadString


	call ReadChar
	mov loadChar,AL

	xor esi, esi
	mov count, 0

RESET:
	mov AL, loadMSG[esi]
	cmp AL, 0
	jne ZNAK
	jmp Koniec

ZNAK:
	inc esi
	cmp AL, loadChar
	jne RESET
	inc count
	jmp RESET
	
KONIEC:
	mov EAX, count
	call WriteDec
	

	exit
main ENDP

END main