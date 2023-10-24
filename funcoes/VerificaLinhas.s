#################################################
#	Verifica todas em linhas do tabuleiro	#
#	em busca de uma quadrupla em linha	#
#################################################
#	- Inputs -				#
#	nenhum					#
#	- Outputs -				#
#	s3 = resultado do jogo (win. lose, etc)	#
#################################################
VerificaLinhas:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	s11, 6	# cont de linhas
	li	a0, 35  # ind da casa na quina inferior esqerda
forTodasLinhas:
	li	s10, 4 # cont de quadruplas verificadas numa linha
	for1Linha:
		call	QuatroEmLinha
		bgez	s3, fimVerificaLinhas
		addi	a0, a0, 1
		addi	s10, s10, -1
		bgtz	s10, for1Linha
	addi	a0, a0, -11	# sobe uma linha no board
	addi	s11, s11, -1	# contador diminui
	bgtz	s11, forTodasLinhas
fimVerificaLinhas:
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
