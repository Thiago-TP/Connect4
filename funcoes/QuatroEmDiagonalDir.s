QuatroEmDiagonalDir:
	la	t0, Board
	add	t0, a0, t0
	
	lbu	t1, 0(t0)
	beqz	t1, sem4diadir
	lbu	t2, -6(t0)		# offset = sobe 1 linha + vai 1 para direita = -7+1 = -6
	bne	t1, t2, sem4diadir
	lbu	t3, -12(t0)	
	bne	t2, t3, sem4diadir
	lbu	t4, -18(t0)	
	bne	t3, t4, sem4diadir
	
	la	t0, IndicesGanhadores	
	sb	a0, 0(t0)
	addi	t1, a0, -6
	sb	t1, 1(t0)
	addi	t1, t1, -6
	sb	t1, 2(t0)
	addi	t1, t1, -6
	sb	t1, 3(t0)
	
	xori	s3, s2, 1
	slli	s3, s3, 1		# s3 = 0 se pc (s2=1) ganhou, 2 se user (s2=0)
sem4diadir:
	ret
