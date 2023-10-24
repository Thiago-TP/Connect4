DoisEmColuna:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	t0, Board
	add	t0, a0, t0
	
	li	a7, 7
	remu	a7, a0, a7		# a7 = ind de coluna
	
	lbu	t1, 0(t0)
	beqz	t1, fimDoisEmColuna
	bne	a2, t1, fimDoisEmColuna
	
	lbu	t2, -7(t0)	
	beqz	t1, fimDoisEmColuna
	bne	a2, t2, fimDoisEmColuna
	
	lbu	t3, -14(t0)
	beqz	t3, marcaColuna
fimDoisEmColuna:
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret

marcaColuna:
	mv	a1, a7
	li	s0, 0
	call	ColocaPeca
	j	fimDoisEmColuna