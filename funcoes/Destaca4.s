#################################################
#	Destaca as 4 pecas vencedoras do jogo:	#
#	o frame exposto esta cinza, dai as	#
#	cores sao coletadas a no outro frame	#
#################################################################
#	- Inputs -						#
#	IndicesGanhadores = indices das pecas vencedoras	#
#	- Outputs -						#
#	4 pecas coloridas num tabuleiro cinza			#
#################################################################
Destaca4:
	addi	sp, sp, -4
	sw	ra, 0(sp)		# guarda ra
	
	la	s11, IndicesGanhadores
	li	s10, 4			# contador de pecas coloridas
forDestaca:
	li	t0, 7
	lbu	a0, 0(s11)		# a0 = indice de uma peca
	
	rem	a1, a0, t0
	slli	a1, a1, 5
	addi	a1, a1, boardX0		# a1 = x da peca no bmp (ind % 7)
	
	div	a2, a0, t0
	slli	a2, a2, 5
	addi	a2, a2, boardY0		# a2 = y da peca no bmp (ind // 7)
	
	li	a3, frameAddress
	lw	a3, 0(a3)		# a3 = frame
	call	UnGray			# efetivamente desfaz a coloracao cinza das pecas
	
	addi	s11, s11, 1		# prox indice
	addi	s10, s10, -1		# contador diminui
	bgtz	s10, forDestaca		# pintamos todas as pecas ?
	
	lw	ra, 0(sp)		# recupera ra
	addi	sp, sp, 4
	ret
