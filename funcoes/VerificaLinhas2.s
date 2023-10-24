VerificaLinhas2:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	s11, 6	# cont de linhas
	li	a0, 35  # ind da casa na quina inferior esqerda
forTodasLinhas2:
	li	s10, 5 # cont de duplas verificadas numa linha
	for1Linha2:
		call	DoisEmLinha
		beqz	s0, fimVerificaLinhas2
		addi	a0, a0, 1
		addi	s10, s10, -1
		bgtz	s10, for1Linha2
	addi	a0, a0, -13	# sobe uma linha no board
	addi	s11, s11, -1	# contador diminui
	bgtz	s11, forTodasLinhas2
fimVerificaLinhas2:
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret