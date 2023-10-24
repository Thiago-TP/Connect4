IAdificil:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	s0, 1		# flag de jogada do pc => 0 se uma peca foi lancada
	
	li	a2, 2
	call	ColocaTerceira	# 2 pecas do pc alinhadas ? coloca a terceira, se der
	beqz	s0, fimIAdif
	
	li	a2, 1	
	call	ColocaTerceira	# 2 pecas do user alinhadas ? bloqueia a terceira, se der
	beqz	s0, fimIAdif
	
	call	jogaCentro	# joga na coluna do meio, se der
	beqz	s0, fimIAdif
	
	call	jogaCentroAdjacente
	beqz	s0, fimIAdif
	
	call	jogaCantoAdjacente
	beqz	s0, fimIAdif
	
	call	jogaCanto
fimIAdif:	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
	
	
	
jogaCentro:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	a1, 3
	call	ColocaPeca
	beqz	a4, centroOcupado
	li	s0, 0
centroOcupado:	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret

jogaCentroAdjacente:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	a1, 2
	call	ColocaPeca
	beqz	a4, outroCentroAdj
	j	marcaCentroAdj
outroCentroAdj:
	li	a1, 4
	call	ColocaPeca
	beqz	a4, fimCentroAdj
marcaCentroAdj:
	li	s0, 0
fimCentroAdj:	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret	

jogaCantoAdjacente:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	a1, 1
	call	ColocaPeca
	beqz	a4, outroCantoAdj
	j	marcaCantoAdj
outroCantoAdj:
	li	a1, 5
	call	ColocaPeca
	beqz	a4, fimCantoAdj
marcaCantoAdj:
	li	s0, 0
fimCantoAdj:	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret	

jogaCanto:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	a1, 0
	call	ColocaPeca
	beqz	a4, outroCanto
	j	marcaCanto
outroCanto:
	li	a1, 6
	call	ColocaPeca
	beqz	a4, fimCentroAdj
marcaCanto:
	li	s0, 0
fimCanto:	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret	