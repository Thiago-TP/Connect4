#################################################################
#	Realiza a jogada da IA facil: escolhe aleatoriamente	#
#	uma coluna e joga nela se tiver espaco			#
#################################################################
#	- Inputs -		#
#	nenhum			#
#	- Outputs -		#
#	animacao da jogada	#
#################################
IAfacil:		
	addi	sp, sp, -4
	sw	ra, 0(sp)
chutaDeNovo:			# caso toda uma coluna esteja ocupada
	csrr	a1, time
	srli	a1, a1, 1	# tempo pode ficar muito grande no RARS, dividimos por 2
	li	t1, 7
	remu	a1, a1, t1	# a1 = ind da coluna
	call	ColocaPeca
	beqz	a4, chutaDeNovo	# novo chute se a coluna ja estiver ocupada
	
	lw	ra, 0(sp)
	addi	sp, sp, 4	
	ret
