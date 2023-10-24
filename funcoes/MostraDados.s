MostraDados:
	addi	sp, sp, -8
	sw	ra, 0(sp)
	sw	a3, 4(sp)
	
	# print("IA: xxxx")
	bltz	s1, stringFacil
	beqz	s1, stringMedia
	la	a0, strIAdificil
volta:
	li	a1, 136
	li	a2, 4
	li	a3, 0x000000DD
	li	a4, 0
	call	PrintString
	li	a4, 1
	call	PrintString
	
	# print("tempo:")
	la	a0, tempo
	li	a1, 0
	li	a2, 0
	call	PrintString
	li	a4, 0
	call	PrintString
	
	# print("instr:")
	la	a0, instr
	li	a2, 8
	call	PrintString
	li	a2, 8
	li	a4, 1
	call	PrintString
	
	# print("cycle:")
	la	a0, cycles
	li	a2, 232
	call	PrintString
	li	a4, 0
	call	PrintString
	
	# imprime o tempo de execucao
	la	t0, T
	lw	t1, 0(t0)
	lw	t0, 4(t0)
	sub	a0, t0, t1
	li	a1, 52
	li	a2, 0
	call	PrintInt
	li	a1, 52
	li	a2, 0
	li	a4, 1
	call	PrintInt
	
	# imprime o num de instrucoes
	la	t0, I
	lw	t1, 0(t0)
	lw	t0, 4(t0)
	sub	a0, t0, t1
	li	a2, 8
	call	PrintInt
	li	a4, 0
	call	PrintInt
	
	# imprime o num de ciclos
	la	t0, C
	lw	t1, 0(t0)
	lw	t0, 4(t0)
	sub	a0, t0, t1
	li	a2, 232
	call	PrintInt
	li	a4, 1
	call	PrintInt
	
	lw	ra, 0(sp)
	lw	a3, 4(sp)
	addi	sp, sp, 8
	ret
	
stringFacil:
	la	a0, strIAfacil
	j	volta	
stringMedia:
	la	a0, strIAmedia
	j	volta	
