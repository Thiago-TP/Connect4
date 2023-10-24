DoisEmLinha:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	t0, Board
	add	t0, a0, t0
	
	li	a7, 7
	remu	a7, a0, a7		# a7 = ind de coluna
	
	lbu	t1, 0(t0)
	lbu	t2, 1(t0)
	lbu	t3, 2(t0)
	
	li	t4, 35
	bge	a0, t4, ultimaLinha
	lbu	t4, 7(t0)
	lbu	t5, 14(t0)
	lbu	t6, 21(t0)
casos:
	beqz	t1, gotoCaso022linha
	beqz	t2, gotoCaso202linha
	beqz	t3, gotoCaso220linha
	j	fimDoisEmLinha	
ultimaLinha:	
	li	t4, 1
	li	t5, 1
	li	t6, 1
	j	casos
fimDoisEmLinha:
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
	
	
gotoCaso022linha:	caso(t2, t3, t4, fimDoisEmLinha, 0)
gotoCaso202linha:	caso(t1, t3, t5, fimDoisEmLinha, 1)
gotoCaso220linha:	caso(t1, t2, t6, fimDoisEmLinha, 2)