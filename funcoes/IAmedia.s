IAmedia:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	a1, 0
loopMedia:
	call	ColocaPeca
	addi	a1, a1, 1
	beqz	a4, loopMedia
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret