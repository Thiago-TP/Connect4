VerificaColunas2:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	s11, 4	# cont de linhas
	li	a0, 35  # ind da casa na quina inferior esqerda
forTodasColunas2:
	li	s10, 7 # cont de colunas numa linha
	for1Coluna2:
		call	DoisEmColuna
		beqz	s0, fimVerificaColunas2
		addi	a0, a0, 1
		addi	s10, s10, -1
		bgtz	s10, for1Coluna2
	addi	a0, a0, -14	# sobe uma linha no board
	bltz	a0, fimVerificaColunas2
	addi	s11, s11, -1	# contador diminui
	bgtz	s11, forTodasColunas2
fimVerificaColunas2:
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret