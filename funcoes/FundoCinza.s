#################################################
#	Deixa o tabuleiro no frame a3 cinza	#
#################################################
#	- Inputs -			#
#	a3 = frame do acinzentamento	#
#	- Outputs -			#
#	uma tela cinza :^)		#
#########################################
FundoCinza:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	t0, 0xFF0
	add	t0, t0, a3
	slli	t0, t0, 20
	li	t1, 0x2830	# 0x2830 = 48 + (32*320)
	add	t0, t0, t1	# t0 = end inicial do board no bmp
	li	t1, 224		# largura 
	li	t2, 192		# altura
	li	t3, 0		# cont de col
	li	t4, 0		# cont de linha
linhaCinza:
	lbu	t5, 0(t0)
	jal	ByteCinza	# nunca chame esta funcao com call, isso altera t1
	sb	t5, 0(t0)
	addi	t0, t0, 1
	addi	t3, t3, 1
	blt	t3, t1, linhaCinza	# deu o num de colunas ?
	
	addi	t4, t4, 1		# prox linha
	li	t3, 0			# volta a primeira coluna
	addi	t0, t0, 320
	addi	t0, t0, -224		# t0 = end da proxima linha
	blt	t4, t2, linhaCinza	# deu o num de linhas ?
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
