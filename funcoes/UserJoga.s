UserJoga:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	s2, 0
	la	a0, Seletor
	li	a2, selY
	la	s11, selX
loopUser:
	lw	a1, 0(s11)
	call	KeyPoll
	li	t1, '\n'
	beq	t0, t1, fimloopUser
	li	t1, 'a'
	beq	t0, t1, CharEsq
	li	t1, 'd'
	beq	t0, t1, CharDir
	j	loopUser
fimloopUser:
	addi	a1, a1, -56		# 56 = 8 + 48 = selLen/2 + boardX0
	srli	a1, a1, 5		# a1 = a1 // 32 = ind da coluna
	call	ColocaPeca
	beqz	a4, loopUser	
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
CharEsq:
	call	PrintCinza
	xori	a3, a3, 1
	call	PrintCinza
	li	t0, 56
	beq	t0, a1, voltaD
	addi	a1, a1, -32
	sw	a1, 0(s11)
	xori	a3, a3, 1
	call	Print
	xori	a3, a3, 1
	call	Print
	j	loopUser
voltaD:
	li	a1, 248	
	sw	a1, 0(s11)
	xori	a3, a3, 1
	call	Print
	xori	a3, a3, 1
	call	Print
	j	loopUser

CharDir:
	call	PrintCinza
	xori	a3, a3, 1
	call	PrintCinza
	li	t0, 248
	beq	t0, a1, voltaE
	addi	a1, a1, 32	
	sw	a1, 0(s11)
	xori	a3, a3, 1
	call	Print
	xori	a3, a3, 1
	call	Print
	j	loopUser
voltaE:
	li	a1, 56
	sw	a1, 0(s11)
	xori	a3, a3, 1
	call	Print
	xori	a3, a3, 1
	call	Print
	j	loopUser
