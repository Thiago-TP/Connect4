PrintDifs:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	a0, chooseD
	li	a1, 76
	li	a2, 72
	mv	a4, a3
	li	a3, 0x000000ff	
	call	PrintString
	mv	a3, a4
	
	la	a0, Easy
	li	a1, 80		# 80 = 320/2 - 32/2 -32 -32
	li	a2, 104		# 104 = 240/2 - 16
	call	Print		# imprime dif facil

	la	a0, Mid
	li	t0, tileLen
	slli	t0, t0, 1	# t0 = 2*tileLen
	add	a1, a1, t0
	call	Print		# imprime dif media
	
	la	a0, Hard
	li	t0, tileLen
	slli	t0, t0, 1	# t0 = 2*tileLen
	add	a1, a1, t0
	call	Print		# imprime dif media	
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
