    .data
cadena: .asciiz "adbdcdedfdgdhdid"
car:    .asciiz "d"
cant:   .word 0
    .code
        dadd r4, r0, r0
        lbu r1, car(r0)
        lbu r2, cadena(r4)
        dadd r3, r0, r0
while:  beqz r2, fin
        bne r1, r2, neq
        daddi r4, r4, 1
        daddi r3, r3, 1
neq:    j while
        lbu r2, cadena(r4)
fin:    sd r3, cant(r0)
        
        halt