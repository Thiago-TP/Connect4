TelaFinal:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	a3, frameAddress
	lw	a3, 0(a3)
	call	FundoCinza
	
	li	a2, 228		# y
	mv	a4, a3		# frame
	
	beqz	s3, Derrota
	li	t0, 1
	beq	s3, t0, Empate
#Vitoria:
	la	a0, ganhou
	li	a1, 116		# x
	li	a3, 0x0000C732	# cor (verde + fundo inv)
	call	PrintString
	j	fimTelaFinal
Derrota:
	la	a0, perdeu
	li	a1, 120		# x		
	li	a3, 0x0000C707	# cor (vermelho + fundo inv)
	call	PrintString
	j	fimTelaFinal
Empate:
	la	a0, empatou
	li	a1, 132		# x
	li	a3, 0x0000C717	# cor (laranja + fundo inv)
	call	PrintString
	j	naoDestaca
fimTelaFinal:	
	call	Destaca4		# destaca a ligacao vencedora
naoDestaca:
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
