#########################################################
#	Inicializa o tabuleiro para o GameLoop		#
#########################################################
#	- Inputs -				#
#	nenhum					#
#	- Outputs -				#
#	tabuleiro impresso nos dois frames	#
#################################################
InicializaBoard:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	a0, Tile
	li	a1, boardX0
	li	a2, boardY0
	li	a3, frameAddress
	lw	a3, 0(a3)
	xori	a3, a3, 1	# frame oculto
	call	PrintBoard	# tabuleiro + seletor + pecas na laterais no bmp (frame oculto)
	
	li	t0, frameAddress	
	sw	a3, 0(t0)	# mostra o frame oculto
	
	xori	a3, a3, 1
	call	PrintBoard	# tabuleiro + seletor + pecas na laterais no bmp (frame oculto)
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
