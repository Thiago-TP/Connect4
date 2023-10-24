ProcuraVazia:	# recebe o indice da coluna em t0 e retorna a altura da casa vazia em a4 (0 se n tiver)	
	addi	t0, a1, 35		# t0 = ind do fundo	
	la	t1, Board
	add	t0, t0, t1		# t0 = end do fundo
	li	t2, 6			# contador de linhas
loopProcuraVazia:
	lbu	t1, 0(t0)	
	beqz	t1, MarcaCasa
	addi	t0, t0, -7
	addi	t2, t2, -1
	bgtz	t2, loopProcuraVazia
	j	naoMarcaCasa
MarcaCasa:
	addi	t1, s2, 1		# vez+1 = ID de ocupacao no board
	sb	t1, 0(t0)		# marca como ocupada pelo user/PC
	#la	t1, Board
	#sub	t0, t0, t1		# t0 = ind da casa vazia
	#la	t1, PosUltimaCasa
	#sb	t0, 0(t1)		# ind da ultima casa ocupada eh atualizado	
naoMarcaCasa:
	slli	a1, a1, 5		
	addi	a1, a1, boardX0		# ind de coluna vira pos em x	
	slli	a4, t2, 5		# a4 = 32*cont
	ret
