#########################################################################
#	Recebe um indice de coluna (0 a 6 da esquerda para direita)	#
#	e joga a pedra da vez nela, se houver espaco disponivel		#	
#########################################################################
#	- Inputs -			#
#	a1 = 0 a 6 = indice da coluna	#
#	s2 = 0 ou 1 = flag da vez do PC	#
#	- Outputs -			#
#	uma animacao daora :^)		#
#########################################

ColocaPeca:
	addi	sp, sp, -8		
	sw	ra, 0(sp)		# armazena ra
	sw	a1, 4(sp)		# armazena a1
	
	call	ProcuraVazia		# verifica se tem casa vazia na coluna
	beqz	a4, fimColocaPeca	# a4 = 0 => nao tem casa vazia
	beqz	s2, pedraUser		# vez eh do user ?
	la	a0, pcSymbol 
	j	comecaAnimacao
pedraUser :
	la	a0, userSymbol
comecaAnimacao:
	lw	a0, 0(a0)
	li	a2, 0			# altura inicial
	li	t0, frameAddress
	lw	a3, 0(t0)		# frame atual
loopCai:
	beq	a2, a4, fimLoopCai	# chegou na altura final ?
	call	GuardaFundo		# guarda o fundo no outro frame para limpar o rastro
	addi	a2, a2, 4		# desce 4 pixeis
	xori	a3, a3, 1		# troca o frame
	call	Print			# imprime a peca
	li	t0, frameAddress	
	sw	a3, 0(t0)		# mostra peca na nova posicao
	addi	a2, a2,-4
	call	ImprimeFundo		# apaga o rastro que ficou no frame original
	addi	a2, a2, 4
	j	loopCai
fimLoopCai:	
	xori	a3, a3, 1		
	call	Print			# imprime a peca na posicao final em ambos os frames
fimColocaPeca:	
	lw	ra, 0(sp)		# recupera ra
	lw	a1, 4(sp)		# recupera a1
	addi	sp, sp, 8
	ret
