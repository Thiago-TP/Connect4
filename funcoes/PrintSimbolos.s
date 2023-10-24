PrintSimbolos:	
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	a0, chooseS
	li	a1, 88
	li	a2, 72
	mv	a4, a3
	li	a3, 0x000000ff	
	call	PrintString		# "Choose your symbol" em (a1,a2) no frame a4 e cor a3
	mv	a3, a4
	
	la	a0, PedraAmarela
	li	a1, 112			# 144 = 320/2 - 32 - 16
	li	a2, 104			# 104 = 240/2 - 32/2
	call	Print			# imprime pedra amarela
	
	la	a0, PedraVermelha
	li	t0, tileLen
	slli	t0, t0, 1		# t0 = 2*tileLen = 2*len da pedra
	add	a1, a1, t0		
	call	Print			# imprime pedra vermelha
	
	li	a2, 88			# 88 = 104 - 16
	la	a0, Seletor
	beqz	a3, selEsquerda
	addi	a1, a1, 8
	call	Print
	addi	a1, a1, -64
	call	PrintCinza
	j	fimPrintSimbolos
selEsquerda:
	li	a1, 112
	addi	a1, a1, 8	
	call	Print
	addi	a1, a1, 64
	call	PrintCinza
fimPrintSimbolos:		
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
