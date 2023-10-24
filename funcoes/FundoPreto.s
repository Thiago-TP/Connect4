#########################################################################
#	Imprime um retangulo preto a4xa5 em (a1, a2) no frame a3	#
#########################################################################
FundoPreto: 
	li	t0, 0xFF0
	add	t0, t0, a3
	slli	t0, t0, 20	# t1 = endereco do primeiro byte
	
	add	t0, t0, a1
	li	t1, 320
	mul	t1, t1, a2
	add	t0, t0, t1
	
	mv	t1, a4		# cont de largura
	mv	t2, a5		# cont de altura
	
linhaPreta:
	sw	zero, 0(t0)	# 4 bytes pretos
	addi	t0, t0, 4
	addi	t1, t1, -4
	bgtz	t1, linhaPreta	 
	
	li	t3, 320
	add	t0, t0, t3
	sub	t0, t0, a4
	mv	t1, a4
	addi	t2, t2, -1
	bgtz	t2, linhaPreta
	
	ret
