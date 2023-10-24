VerificaDiagonais:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	s11, 3	# cont de linhas
	li	a0, 35  # ind da casa na quina inferior esqerda
forTodasDiagonais:
	li	s10, 4 # cont de quadruplas verificadas numa linha
	for1DiagonalD:
		call	QuatroEmDiagonalDir
		bgez	s3, fimVerificaDiagonais
		addi	a0, a0, 1	# vai 1 coluna para a direita
		addi	s10, s10, -1
		bgtz	s10, for1DiagonalD
	li	s10, 4 	# cont de quadruplas verificadas numa linha
	addi	a0, a0, -1	# ajuste devido ao do while
	for1DiagonalE:
		call	QuatroEmDiagonalEsq
		bgez	s3, fimVerificaDiagonais
		addi	a0, a0, 1	# vai 1 coluna para a direita
		addi	s10, s10, -1
		bgtz	s10, for1DiagonalE
		
	addi	a0, a0, -14	# sobe 1 linha no board
	addi	s11, s11, -1	# contador diminui
	bgtz	s11, forTodasDiagonais
fimVerificaDiagonais:
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret