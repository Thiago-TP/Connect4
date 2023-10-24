QuatroEmLinha: # ve se tem quadrupla em linha com ind a0 a esquerda
	la	t0, Board
	add	t0, a0, t0
	
	lbu	t1, 0(t0)
	beqz	t1, sem4linha
	lbu	t2, 1(t0)
	bne	t1, t2, sem4linha
	lbu	t3, 2(t0)	
	bne	t2, t3, sem4linha
	lbu	t4, 3(t0)	
	bne	t3, t4, sem4linha
	
	la	t0, IndicesGanhadores	
	sb	a0, 0(t0)
	addi	t1, a0, 1
	sb	t1, 1(t0)
	addi	t1, t1, 1
	sb	t1, 2(t0)
	addi	t1, t1, 1
	sb	t1, 3(t0)
	
	xori	s3, s2, 1
	slli	s3, s3, 1		# s3 = 0 se pc (s2=1) ganhou, 2 se user (s2=0)
sem4linha:
	ret
