PrintCinza:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	t0, 0xFF0 		# carrega 0xFF0 em t0
        add 	t0, t0, a3 		# adiciona o frame a FF0 
        slli 	t0, t0, 20 		# shift de 20 bits pra esquerda      
      
        add   	t0, t0, a1  		# adiciona x ao t0
        li    	t1, 320     		# t1 = 320
        mul   	t1, t1, a2 		# multiplica y por t1
        add   	t0, t0, t1 		# coloca o endereco em t0      
      
        mv  	t1, zero      		# zera t1
        mv  	t2, zero      		# zera t2
        mv  	t6, a0        		# data em t6 para nao mudar a0
        lw 	t3, 0(t6)     		# carrega a largura em t3
        lw 	t4, 4(t6)     		# carrega a altura em t4
        addi 	t6, t6, 8    		# primeira cor em t6   
PrintLinhaCinza:
        lbu   	t5, 0(t6)   		# carrega em t5 um byte da imagem
        jal	ByteCinza
        sb    	t5, 0(t0)   		# imprime no bitmap o byte da imagem
        addi  	t0, t0, 1   		# incrementa endereco do bitmap
        addi  	t6, t6, 1   		# incrementa endereco da imagem
        addi  	t2, t2, 1   		# incrementa contador de coluna
        blt   	t2, t3, PrintLinhaCinza 	# cont da coluna < largura ?      
      
        addi  	t0, t0, 320 		# t0 += 320
        sub   	t0, t0, t3  		# t0 -= largura da imagem
        mv    	t2, zero    		# zera t2 (cont de coluna)
        addi  	t1, t1, 1   		# incrementa contador de linha
        bgt   	t4, t1, PrintLinhaCinza 	# altura > contador de linha ?
        
        lw	ra, 0(sp)
        addi	sp, sp, 4
        ret               		# retorna
        
        
        
        
        
        
        
        
        
        
        
        
        
#################################################
#	Esta funcao recebe um byte de cor e 	#
#	retorna a versao cinza desse byte	#
#################################################
#	- Inputs -				#
#	t5 = bbgggrrr				#
#################################################
#	- Outputs -				#
#	t5 = byte cinza (R=G=B=media[R,G,B])	#
#################################################
#	- Variaveis internas			#
#################################################
ByteCinza:	
	addi 	sp, sp, -20
	sw	ra, 0(sp)
	sw	t0, 4(sp)
	sw	t1, 8(sp)
	sw	t2, 12(sp)
	sw	t3, 16(sp)
	
	#li	s11, 0xC7
	#beq	s11, t5, fimByteCinza
	
	jal	byte2RGB	# t0 <- R, t1 <- G, t2 <- B
	
	add	t0, t0, t1	# t0 <- R + G
	add	t0, t0, t2	# t0 <- R + G + B
	li	t1, 3		# t1 = 3
	divu	t0, t0, t1	# t0 <- media[R,G,B]
	mv	t1, t0		# t1 <- G=R=media
	mv	t2, t0		# t2 <- B=R=media
	
	jal	RGB2byte	# t5 <- versao cinza do byte original
fimByteCinza:	
	lw	ra, 0(sp)
	lw	t0, 4(sp)
	lw	t1, 8(sp)
	lw	t2, 12(sp)
	lw	t3, 16(sp)
	addi	sp, sp, 20
	ret			# retorno por pseudo

#################################################
#	Esta funcao cria o byte de cor a	#
#	partir do valor RGB correspondente	#
#################################################
#	- Inputs -		#
#	RGB = (R, G, B)		#
#	t0 = R			#
#	t1 = G			#
#	t2 = B			#
#################################
#	- Outputs -		#
#	t5 = bbgggrrr		#
#################################
#	- Variaveis internas	#
#	t3 = divisor		#
#################################
RGB2byte:
	# bits de vermelho
	li	t3, 32		# t3 <- 32
	divu	t0, t0, t3	# t0 <- R/32 = 0...000 rrr
	# bits de verde
	divu	t1, t1, t3	# t1 <- G/32 = 0...000 ggg
	slli	t1, t1, 3	# t1 <- 0...00 ggg000
	# bits de azul
	li	t3, 64		# t3 <- 64
	divu	t2, t2, t3	# t2 <- B/64 = 0...000 0bb
	slli	t2, t2, 6	# t2 <- 0...0 bb000000
	# montagem de t5
	add	t5, x0, t0	# t5 <- 0...0 00000rrr
	add	t5, t5, t1	# t5 <- 0...0 00gggrrr
	add	t5, t5, t2	# t5 <- 0...0 bbgggrrr
	
	ret			# retorno por pseudo

#################################################
#	Esta funcao cria o valor RGB a 		#
#	partir do byte de cor correspondente	#
#################################################
#	- Inputs -				#
#	t5 = bbgggrrr				#
#################################################
#	- Outputs -				#
#	t0 = R					#
#	t1 = G					#
#	t2 = B					#
#################################################
#	- Variaveis internas -			#
#	t3 = multiplicador			#
#################################################
byte2RGB:
	# bits de vermelho	# t5 =  bbgggrrr
	andi 	t0, t5, 0x07	# t0 <- 0000 0rrr 
	li	t3, 32		# t3 <- 32
	mul	t0, t0, t3	# t0 <- rrr*32 = R
	# bits de verde
	andi	t1, t5, 0x38	# t1 <- 00GG G000
	srli	t1, t1, 3	# t1 <- 00000ggg
	#li	t3, 32		# t0 <- 32
	mul	t1, t1, t3	# t1 <- ggg*32 = G
	# bits de azul
	srli	t2, t5, 6	# t0 <- 000000bb
	li	t3, 64		# t3 <- 64 
	mul	t2, t2, t3	# t2 <- bb*64 = B
	
	ret			# retorno por pseudo
