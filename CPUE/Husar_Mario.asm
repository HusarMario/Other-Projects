Reset:	;Nastavenie Pociatocnych hodnot
	mvi A,00000011b	;Prepnutie displejov na 0
	out 000000000b,A

	mvi A,1	;Nastavenie aktualneho displeja
	smi 0,A
	mvx M,A

	mvi A,00000011b	;Nastavenie hodnot jednotlivych displejov
	smi 1,A
	smi 2,A
	smi 3,A
	smi 4,A
	smi 5,A
	smi 6,A
	smi 7,A

	
	mvi A,00000000b	;Nastavenie boolean cyklu
	smi 8,A

	smi 16,A	;Nastavenie vypoctovej pamate
	smi 17,A
	smi 18,A
	smi 19,A
	smi 20,A

Start:	;Zaciatok programu (kontrola cyklu posuvu)
	mvi A,0
	lmi A,8
	cmi A,0
	jzr Continue
	
	inn B,110111111111b	;Zistenie ukoncenia cyklu
	ani B,00001111b
	cmi B,15
	jzr Repair
	jmp Start

Repair:	;Odnastavenie cykla
	mvi A,0
	smi 8,A
	
Continue:	;Nastavenie vypoctu spravneho displeja
	lmi A,0
	mvi B,0
	mvx M,A


	inn B,110111111111b	;Nacitanie tlacidiel
	ani B,00001111b
	inn C,101111111111b
	ani C,00001111b
	inn D,011111111111b
	ani D,00001111b


	cmi D,14	;Kontrola stlaceneho tlacidla
	jzr 0
	cmi D,13
	jzr 1
	cmi D,11
	jzr 2
	cmi D,7
	jzr 3
	cmi C,14
	jzr 4
	cmi C,13
	jzr 5
	cmi C,11
	jzr 6
	cmi C,7
	jzr 7
	cmi B,14
	jzr 8
	cmi B,13
	jzr 9
	cmi B,11
	jzr vlavo
	cmi B 7
	jzr vpravo

	mxi M,1	;Vypisovanie displejov bez zmeny
	jmp prvy

prvy:	;Vypis displejov
	lmr A
	out 111111000b, A
	mxi M,2;	
druhy:
	lmr A
	out 111110100b, A
	mxi M,3;
treti:
	lmr A
	out 111101100b, A
	mxi M,4;
stvrty:
	lmr A
	out 111011100b, A
	mxi M,17;
	jmp vypocet

	
suradnica:	;Zmena zobrazovaneho displeja
	smr A	;Ulozenie zapisu
	mvx C,M
	adi D,16
	mov C,B
	mov A,D
	mvi B,0
	mvx M,A
	smr C	;Ulozenie cisla


	mxi M,1
	jmp prvy

vlavo:	;Posun displejov vlavo
	mvi A,1
	smi 8,A

	mxi M,0
	lmr A
	cmi A,0
	jzr Start
	dec A
	smr A
	jmp Start

vpravo:	;Posun displejov vpravo
	mvi A,1
	smi 8,A

	mxi M,0
	lmr A
	cmi A,4
	jzr Start
	inc A
	smr A
	jmp Start

0:	;Jednotlive kody cisiel
	mvi A, 00000011b
	mvi B,0
	jmp suradnica
1:
	mvi A, 10011111b
	mvi B,1 
	jmp suradnica
2:
	mvi A, 00100101b
	mvi B,2
	jmp suradnica
3:
	mvi A, 00001101b
	mvi B,3
	jmp suradnica
4:
	mvi A, 10011001b
	mvi B,4
	jmp suradnica
5:
	mvi A, 01001001b
	mvi B,5
	jmp suradnica
6:
	mvi A, 01000001b
	mvi B,6
	jmp suradnica
7:
	mvi A, 00011111b
	mvi B,7
	jmp suradnica
8:
	mvi A, 00000001b
	mvi B,8
	jmp suradnica
9:
	mvi A, 00001001b
	mvi B,9
	jmp suradnica

vypocet:
	mvi A,0
	mvi D,0

	lmr D
	add A,D	;prve cislo prva cifra
	add A,D
	add A,D
	add A,D
	add A,D
	add A,D
	add A,D
	add A,D
	add A,D
	add A,D
	
	mxi M,18
	lmr D
	add A,D ;prve cislo druha cifra

	mxi M,19
	lmr D
	add A,D	;druhe cislo prva cifra
	add A,D
	add A,D
	add A,D
	add A,D
	add A,D
	add A,D
	add A,D
	add A,D
	add A,D
	
	mxi M,20
	lmr D
	add A,D ;druhe cislo druha cifra

	mxi M,16
	smr A
	mxi M,5
	

	mvi B,0	;hladanie cifier
	mvi C,0
	mvi D,0
	
Skuska:	;vypocet
	cmi A,0
	jzr Koniec
	jmp Jednotka

Jednotka:
	dec A
	inc D
	cmi D,10
	jzr Desiatka
	jmp Skuska

Desiatka:
	inc C
	mvi D,0
	cmi C,10
	jzr Stovka
	jmp Skuska

Stovka:
	inc B
	mvi C,0
	jmp Skuska
	

Koniec:	;vypis poslednych 3 displejov
	cmi B,0
	jzr 50
	jmp 51

50:
	mvi A,00000011b
	jmp piaty
51:
	mvi A,10011111b
	jmp piaty
piaty:
	out 110111100b, A
	
	cmi C,0
	jzr 60
	cmi C,1
	jzr 61
	cmi C,2
	jzr 62
	cmi C,3
	jzr 63
	cmi C,4
	jzr 64
	cmi C,5
	jzr 65
	cmi C,6
	jzr 66
	cmi C,7
	jzr 67
	cmi C,8
	jzr 68
	cmi C,9
	jzr 69

60:
	mvi A,00000011b
	jmp siesty
61:
	mvi A,10011111b
	jmp siesty
62:
	mvi A,00100101b
	jmp siesty
63:
	mvi A,00001101b
	jmp siesty
64:
	mvi A,10011001b
	jmp siesty
65:
	mvi A,01001001b
	jmp siesty
66:
	mvi A,01000001b
	jmp siesty
67:
	mvi A,00011111b
	jmp siesty
68:
	mvi A,00000001b
	jmp siesty
69:
	mvi A,00001001b
	jmp siesty

siesty:
	out 101111100b, A
	
	cmi D,0
	jzr 70
	cmi D,1
	jzr 71
	cmi D,2
	jzr 72
	cmi D,3
	jzr 73
	cmi D,4
	jzr 74
	cmi D,5
	jzr 75
	cmi D,6
	jzr 76
	cmi D,7
	jzr 77
	cmi D,8
	jzr 78
	cmi D,9
	jzr 79

70:
	mvi A,00000011b
	jmp siedmy
71:
	mvi A,10011111b
	jmp siedmy
72:
	mvi A,00100101b
	jmp siedmy
73:
	mvi A,00001101b
	jmp siedmy
74:
	mvi A,10011001b
	jmp siedmy
75:
	mvi A,01001001b
	jmp siedmy
76:
	mvi A,01000001b
	jmp siedmy
77:
	mvi A,00011111b
	jmp siedmy
78:
	mvi A,00000001b
	jmp siedmy
79:
	mvi A,00001001b
	jmp siedmy

siedmy:
	out 011111100b, A
	jmp Start
