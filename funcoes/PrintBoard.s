PrintBoard:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	s11, boardXf
	li	s10, boardYf 
loopColuna:
	call	Print
	addi	a1, a1, tileLen
	blt	a1, s11, loopColuna
proxLinha:
	li	a1, boardX0
	addi	a2, a2, tileLen
	blt	a2, s10, loopColuna	

	# impressao das pedras de cada jogador
	la	a0, userSymbol
	lw	a0, 0(a0)
	li	a1, 8
	li	a2, 104
	call	Print
	la	a0, pcSymbol
	lw	a0, 0(a0)
	li	a1, 280
	call	Print
	
	# impressao de YOU e PC
	la	a0, VC
	li	a1, 12
	li	a2, 138
	mv	a4, a3 
	li	a3, 0x000000FF
	call	PrintString
	la	a0, PC
	li	a1, 288
	li	a2, 138
	li	a3, 0x000000FF
	call	PrintString
	mv	a3, a4

	# impressao do seletor
	la	a0, Seletor
	li	a1, 56
	li	a2, selY
	li	s11, 280
loopSeletor:
	call	PrintCinza
	addi	a1, a1, tileLen
	blt	a1, s11, loopSeletor
	
	li	a1, selX0
	call	Print
	
	la	a0, Tile	# reseta a0
	li	a1, boardX0	# reseta a1
	li	a2, boardY0	# reseta a2
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
