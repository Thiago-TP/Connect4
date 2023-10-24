#########################################################
#	Ve se ou o usuario ou o pc formaram uma		# 
#	quadrupla dentre as todas possiveis		#
#########################################################
#	- Inputs -		#
#	nenhum			#
#	- Outputs -		#
#	s3 = resultado do jogo	#
#################################
VerificaWin:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	s3, -1		# valor padrao, partida continua
	# verifica empate
	la	t0, Board
	li	t1, 7		# cont de colunas
forEmpate:	# empate: toda a primeira linha foi preenchida
	lbu	t2, 0(t0)
	beqz	t2, semEmpate
	addi	t0, t0, 1
	addi	t1, t1, -1
	bgtz	t1, forEmpate
	li	s3, 1		# s3 marca empate
	j	fimVerificaWin
	
semEmpate:
	call	VerificaLinhas		# procura quadrupla em linha
	bgez	s3, fimVerificaWin
	call	VerificaColunas		# procura quadrupla em coluna
	bgez	s3, fimVerificaWin
	call	VerificaDiagonais	# procura quadrupla em diagonal
fimVerificaWin:
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
