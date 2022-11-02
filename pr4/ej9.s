#    EJERCICIO 9
    
    .data
A:      .word 10
X:      .word 0
Y:      .word 2

    .code
        ld r1, A(r0)
        ld r2, X(r0)
        ld r3, Y(r0)
while:  beqz r1, fin
        dadd r2, r2, r3
        j while
        daddi r1, r1, -1
fin:    halt