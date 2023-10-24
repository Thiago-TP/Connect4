#########################################################
#	Decide qual jogada fazer de acordo com a IA	#
#	previamente escolhida pelo jogador		#
#########################################################
#	- Inputs -		#
#	s1 = dificuldade	#
#	- Outputs -		#
#	s2 = flag de vez do pc	#
#################################

#	TO DO: implementar IA dificil
PcJoga:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	a7, T		# inicializa dados
	la	a6, I
	la	a5, C	
	csrr	t0, time
	csrr	t1, instret
	csrr	t2, cycle
	sw	t0, 0(a7)
	sw	t1, 0(a6)
	sw	t2, 0(a5)
	
	li	s2, 1		# vez eh do RARS
	bgtz	s1, gotoDificil
	beqz	s1, gotoMedia
	call	IAfacil
fimPcJoga:
	la	a7, T		# termina a coleta de dados
	la	a6, I
	la	a5, C
	csrr	t0, time
	csrr	t1, instret
	csrr	t2, cycle
	sw	t0, 4(a7)
	sw	t1, 4(a6)
	sw	t2, 4(a5)
	call	MostraDados	# exibe os dados na tela
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret

gotoDificil:
	call	IAdificil
	j	fimPcJoga
gotoMedia:
	call	IAmedia
	j	fimPcJoga
