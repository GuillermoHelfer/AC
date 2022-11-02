#testing
 .data
letra:      .ascii 'O'
vocales:    .asciiz 'AEIOUaeiou'
result:     .word 0
palabra:    .asciiz 'MURCIELAGO'
 .code
    lbu $a0, letra($0)
    jal es_vocal
    sd $v0, result($zero)
    lbu $a1, palabra($0)
    jal CONTAR_VOC
 halt

es_vocal:   dadd $v0, $0, $0
            dadd $t0, $0, $0
 loop:      lbu $t1, vocales($t0)
            beqz $t1, fin_vocal
            beq $a0, $t1, si_es_voc
            daddi $t0, $t0, 1
            j loop
si_es_voc:  daddi $v0, $0, 1
fin_vocal:  jr $ra

CONTAR_VOC: dadd $t0, $0, $0
            dadd $v1, $0, $0
loop2:      lbu $t2, palabra($t0)
            beqz $t2, volver
            dadd $t1, $0, $0
buscar:     lbu $t3, vocales($t1)
            beq $t2, $t3, encontre
            daddi $t1, $t1, 1
            bnez $t3, buscar
            daddi $t0, $t0, 1
            bnez $t2, loop2
encontre:   daddi $v1, $v1, 1
            daddi $t0, $t0, 1
            bnez $t2, loop2
volver:     jr $ra