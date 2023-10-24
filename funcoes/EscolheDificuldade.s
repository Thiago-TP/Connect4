#########################################################
#	Gera a tela de selecao de dificuldade e		#
#	permite o jogador interagir com ela.		#
#	Terminada a selecao do simbolo, os simbolos	#
#	ficam numa tela e as difs em outro		#
#########################################################
#	- Inputs -				#
#	nenhum					#
#	- Outputs -				#
#	s1 = nivel de dificuldade decidido	#
#################################################
EscolheDificuldade:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	a1, 112
	li	a2, 88	
	li	t0, frameAddress
	lw	a3, 0(t0)
	xori	a3, a3, 1		# a3 = frame oculto
	li	a4, 96
	li	a5, 48	
	call	FundoPreto		# cobre em (a1,a2) os simbolos no frame a3 com um retangulo a4xa5 preto
	call	PrintDifs		# poe as caveirinhas na tela
	
	la	a0, Seletor		# sprite do seletor
	li	a2, selYdif
	li	a1, 88
	call	PrintCinza		# imprime o seletor cinza no canto esquerdo
	addi	a1, a1, 64
	call	Print			# imprime o seletor colorido no meio
	addi	a1, a1, 64
	call	PrintCinza		# imprime o seletor cinza no canto direito
	
	li	t0, frameAddress
	sw	a3, 0(t0)		# mostra o frame
	
	li	a1, selX0		# inicializacao para o loop: x inicial do seletor
	li	a2, selYdif		# inicializacao para o loop: y inicial do seletor
	 
loopDif:
	call	KeyPoll			# recebe em t0 uma tecla pressionada pelo user
	
	li	t1, '\n'
	beq	t0, t1, fimloopDif	# eh enter ?
	li	t1, 'a'
	beq	t0, t1, CharEsqDif	# eh esquerda ?
	li	t1, 'd'
	beq	t0, t1, CharDirDif	# eh direita ?
	j	loopDif
fimloopDif:	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	
	li	t0, selX0
	slt	s1, t0, a1	# dif = hard => s1 = 1
	beqz	s1, EasyOuMid
	ret
EasyOuMid:
	slt	s1, a1, t0
	sub	s1, zero, s1	# dif = easy => s1 = -1
	ret	
	
CharEsqDif:
	call	PrintCinza			# seletor atual fica cinza
	li	t0, 88
	beq	a1, t0, voltaDireitaDif		# estamos no maximo a esquerda ? da volta pela direita
	addi	a1, a1, -64
	call	Print				# imprime seletor azul a esquerda da posicao atual
	j	loopDif
voltaDireitaDif:
	addi	a1, a1, 128
	call	Print
	j	loopDif
	
CharDirDif:
	call	PrintCinza			# seletor atual fica cinza
	li	t0, 216
	beq	a1, t0, voltaEsquerdaDif	# estamos no maximo a esquerda ? da volta pela esquerda
	addi	a1, a1, 64
	call	Print
	j	loopDif
voltaEsquerdaDif:
	addi	a1, a1, -128
	call	Print
	j	loopDif
	
