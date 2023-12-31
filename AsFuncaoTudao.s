.data
TempBuffer:	.space 512
.align 2

# Tabela de caracteres desenhados segundo a fonte 8x8 pixels do ZX-Spectrum
LabelTabChar:
.word 	0x00000000, 0x00000000, 0x10101010, 0x00100010, 0x00002828, 0x00000000, 0x28FE2828, 0x002828FE, 
	0x38503C10, 0x00107814, 0x10686400, 0x00004C2C, 0x28102818, 0x003A4446, 0x00001010, 0x00000000, 
	0x20201008, 0x00081020, 0x08081020, 0x00201008, 0x38549210, 0x00109254, 0xFE101010, 0x00101010, 
	0x00000000, 0x10081818, 0xFE000000, 0x00000000, 0x00000000, 0x18180000, 0x10080402, 0x00804020, 
	0x54444438, 0x00384444, 0x10103010, 0x00381010, 0x08044438, 0x007C2010, 0x18044438, 0x00384404, 
	0x7C482818, 0x001C0808, 0x7840407C, 0x00384404, 0x78404438, 0x00384444, 0x1008047C, 0x00202020, 
	0x38444438, 0x00384444, 0x3C444438, 0x00384404, 0x00181800, 0x00001818, 0x00181800, 0x10081818, 
	0x20100804, 0x00040810, 0x00FE0000, 0x000000FE, 0x04081020, 0x00201008, 0x08044438, 0x00100010, 
	0x545C4438, 0x0038405C, 0x7C444438, 0x00444444, 0x78444478, 0x00784444, 0x40404438, 0x00384440,
	0x44444478, 0x00784444, 0x7840407C, 0x007C4040, 0x7C40407C, 0x00404040, 0x5C404438, 0x00384444, 
	0x7C444444, 0x00444444, 0x10101038, 0x00381010, 0x0808081C, 0x00304848, 0x70484444, 0x00444448, 
	0x20202020, 0x003C2020, 0x92AAC682, 0x00828282, 0x54546444, 0x0044444C, 0x44444438, 0x00384444, 
	0x38242438, 0x00202020, 0x44444438, 0x0C384444, 0x78444478, 0x00444850, 0x38404438, 0x00384404, 
	0x1010107C, 0x00101010, 0x44444444, 0x00384444, 0x28444444, 0x00101028, 0x54828282, 0x00282854, 
	0x10284444, 0x00444428, 0x10284444, 0x00101010, 0x1008047C, 0x007C4020, 0x20202038, 0x00382020, 
	0x10204080, 0x00020408, 0x08080838, 0x00380808, 0x00442810, 0x00000000, 0x00000000, 0xFE000000, 
	0x00000810, 0x00000000, 0x3C043800, 0x003A4444, 0x24382020, 0x00582424, 0x201C0000, 0x001C2020, 
	0x48380808, 0x00344848, 0x44380000, 0x0038407C, 0x70202418, 0x00202020, 0x443A0000, 0x38043C44, 
	0x64584040, 0x00444444, 0x10001000, 0x00101010, 0x10001000, 0x60101010, 0x28242020, 0x00242830, 
	0x08080818, 0x00080808, 0x49B60000, 0x00414149, 0x24580000, 0x00242424, 0x44380000, 0x00384444, 
	0x24580000, 0x20203824, 0x48340000, 0x08083848, 0x302C0000, 0x00202020, 0x201C0000, 0x00380418, 
	0x10381000, 0x00101010, 0x48480000, 0x00344848, 0x44440000, 0x00102844, 0x82820000, 0x0044AA92, 
	0x28440000, 0x00442810, 0x24240000, 0x38041C24, 0x043C0000, 0x003C1008, 0x2010100C, 0x000C1010, 
	0x10101010, 0x00101010, 0x04080830, 0x00300808, 0x92600000, 0x0000000C, 0x243C1818, 0xA55A7E3C, 
	0x99FF5A81, 0x99663CFF, 0x10280000, 0x00000028, 0x10081020, 0x00081020

.text
.include "funcoes/ColocaPeca.s"
.include "funcoes/ColocaTerceira.s"
.include "funcoes/Destaca4.s"
.include "funcoes/DoisEmLinha.s"
.include "funcoes/DoisEmColuna.s"
.include "funcoes/EscolheDificuldade.s"
.include "funcoes/EscolheSimbolo.s"
.include "funcoes/FundoCinza.s"
.include "funcoes/FundoPreto.s"		
.include "funcoes/GuardaFundo.s"
.include "funcoes/IAdificil.s"
.include "funcoes/IAfacil.s"
.include "funcoes/IAmedia.s"
.include "funcoes/ImprimeFundo.s"
.include "funcoes/InicializaBoard.s"
.include "funcoes/KeyPoll.s"
.include "funcoes/MostraDados.s"
.include "funcoes/PcJoga.s"
.include "funcoes/Print.s"		# feito no livrao
.include "funcoes/PrintBoard.s"
.include "funcoes/PrintCinza.s"		# feito no livrao		
.include "funcoes/PrintChar.s"		# retirado do SYSTEMv21
.include "funcoes/PrintDifs.s"
.include "funcoes/PrintInt.s"		# retirado do SYSTEMv21
.include "funcoes/PrintSimbolos.s"
.include "funcoes/PrintString.s"	# retirado do SYSTEMv21
.include "funcoes/ProcuraVazia.s"
.include "funcoes/QuatroEmColuna.s"
.include "funcoes/QuatroEmDiagonalDir.s"
.include "funcoes/QuatroEmDiagonalEsq.s"
.include "funcoes/QuatroEmLinha.s"
.include "funcoes/TelaFinal.s"
.include "funcoes/UnGray.s"
.include "funcoes/UserJoga.s"
.include "funcoes/VerificaColunas.s"
.include "funcoes/VerificaColunas2.s"
.include "funcoes/VerificaDiagonais.s"
.include "funcoes/VerificaLinhas.s"
.include "funcoes/VerificaLinhas2.s"
.include "funcoes/VerificaWin.s"
