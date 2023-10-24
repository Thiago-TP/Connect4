ColocaTerceira:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	call	VerificaColunas2	# procura dupla em coluna
	beqz	s0, fimColocaTerceira
	call	VerificaLinhas2		# procura dupla em linha
fimColocaTerceira:
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret