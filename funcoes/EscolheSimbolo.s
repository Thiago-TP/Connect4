#########################################################
#	Gera a tela de selecao de simbolos e		#
#	permite ao jogador interagir com ela.		#
#	Num frame o disco amarelo esta selecionado	#
#	e no outro o vermelho.				#
#################################################################
#	- Inputs -						#
#	nenhum							#
#	- Outputs -						#
#	userSymbol = endereco do endereco da sprite do jogador	#
#	pcSymbol = endereco do endereco da sprite do pc		#
#################################################################
EscolheSimbolo:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	t0, frameAddress
	li	t1, 1
	sw	t1, 0(t0)		# mostra o frame 1
	
	li	a1, 0
	li	a2, 0
	li	a3, 0
	li	a4, 320
	li	a5, 240
	call	FundoPreto		# cobre em (a1,a2) os simbolos no frame a3 com um retangulo a4xa5 preto
	call	PrintSimbolos		# seletor na pedra direita no frame 0
	
	li	t0, frameAddress
	sw	zero, 0(t0)		# mostra o frame 0
	
	li	a1, 0
	li	a2, 0
	li	a3, 1
	li	a4, 320
	li	a5, 240
	call	FundoPreto		# cobre em (a1,a2) os simbolos no frame a3 com um retangulo a4xa5 preto
	call	PrintSimbolos		# seletor na pedra esquerda no frame 1

	li	a3, 0			# se n quando o jogador apertar enter direto vai ficar com a peca vermelha
loopSimbolo:	
	call	KeyPoll			# t0 = valor da tecla pressionada
	
	# tecla pressionada -> decide-se o que fazer		
	li	t1, 'a'
	beq	t0, t1, MudaFrame	# eh esquerda ?
	li	t1, 'd'
	beq	t0, t1, MudaFrame	# eh direita ?
	li	t1, '\n'
	beq	t0, t1, CharEnt		# eh enter ?
	j	loopSimbolo
fimEscolheSimbolo:
	la	t0, userSymbol
	la	t1, pcSymbol
	sw	a0, 0(t0)		# ponteiro de ponteiros inicializados
	sw	a1, 0(t1)
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
CharEnt:
	beqz	a3, userAmarelo		# verifica qual eh o frame exposto 
	la	a0, PedraVermelha	# user escolheu vermelho
	la	a1, PedraAmarela	# pc fica com amarelo
	j	fimEscolheSimbolo
userAmarelo:
	la	a0, PedraAmarela	# user escolheu amarelo
	la	a1, PedraVermelha	# pc fica com vermelho
	j	fimEscolheSimbolo

MudaFrame:
	li	t0, frameAddress
	lw	a3, 0(t0)		# a3 = frame atual
	xori	a3, a3, 1		# a3 = frame oculto
	sw	a3, 0(t0)		# troca o frame
	j	loopSimbolo
