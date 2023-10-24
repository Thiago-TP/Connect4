#########################################################
#	Recebe a tecla pressionada pelo usuario.	#
#	Entra em loop ate que uma tecla apareca		#
#########################################################
#	- Inputs -		#
#	nenhum			#
#	- Outputs -		#
#	t0 = tecla pressionada	#
#################################
KeyPoll:	
	li	t0, 0xFF200000
	lw	t1, 0(t0)		
	andi	t1, t1, 1		# t1 = 1 se tecla foi pressionada, 0 se nao
	beqz	t1, KeyPoll
	lw	t0, 4(t0)		# t0 = valor da tecla pressionada
	ret
