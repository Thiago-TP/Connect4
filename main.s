.data
.include "AsSpriteTudao.data"
.include "AsGlobalTudao.data"

.text
#	Regs do GameLoop
#	s1	dificuldade:		-1 -> facil   	| 0 -> media	| 1 -> dificil
#	s2	vez: 			0 -> user 	| 1 -> pc
#	s3	resultado do jogo:	0 -> derrota	| 1 -> empate	| 2 -> vitoria
#	s11	glorified temporary	
main:
	call	EscolheSimbolo
	call	EscolheDificuldade
	call	InicializaBoard
	bgtz	s1, GameLoop2		# IA dificil ? IA joga primeiro

GameLoop1:
	call	UserJoga		# usuario faz sua jogada
	call	VerificaWin
	bgez	s3, GameEnd		# usuario ganhou ?
	
	call	PcJoga			# pc faz sua jogada
	call	VerificaWin
	bgez	s3, GameEnd		# pc ganhou ?
	
	j	GameLoop1		# continua o jogo
GameLoop2:
	call	PcJoga			# pc faz sua jogada
	call	VerificaWin
	bgez	s3, GameEnd		# pc ganhou ?
	
	call	UserJoga		# usuario faz sua jogada
	call	VerificaWin
	bgez	s3, GameEnd		# usuario ganhou ?
	
	j	GameLoop2		# continua o jogo

GameEnd:
	call	TelaFinal
	fim:	j fim			# fim do programa

.include "AsFuncaoTudao.s"
