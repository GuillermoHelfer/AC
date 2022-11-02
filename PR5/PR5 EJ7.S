    .data
M:      .word 18
tabla:  .word 0,1,2,3,4,5,6,7,8,9
elem:   .word 10
    .code
        daddi $sp, $0, 0x400
        ld $a0, M($0)
        dadd $s0, $0, $0
        ld $a1, tabla($a2)
        ld $a3, elem($0)
        jal subr
    halt

subr:   slt $t0, $a1, $a0
        daddi $a2, $a2, 8
        beqz $t0, nIgual
        daddi $v0, $v0, 1
nIgual: daddi $a3, $a3, -1
        ld $a1, 0($a2)
        bnez $a3, subr
        jr $ra