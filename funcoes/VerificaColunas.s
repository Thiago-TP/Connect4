VerificaColunas:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	s11, 3	# cont de linhas
	li	a0, 35  # ind da casa na quina inferior esqerda
forTodasColunas:
	li	s10, 7 # cont de quadruplas verificadas numa linha
	for1Coluna:
		call	QuatroEmColuna
		bgez	s3, fimVerificaColunas
		addi	a0, a0, 1	# vai 1 coluna para a direita
		addi	s10, s10, -1
		bgtz	s10, for1Coluna
	addi	a0, a0, -14	# sobe 1 linha no board
	addi	s11, s11, -1	# contador diminui
	bgtz	s11, forTodasColunas
fimVerificaColunas:
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret