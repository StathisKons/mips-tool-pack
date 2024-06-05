.data
    max:    .asciiz "Max is : "
    min:    .asciiz "Min is : "
    endl:   .asciiz "\n"

.text
    .globl main

main:
    li $a0, -10    # Initialize variables
    li $a1, -30    #
    li $a2, 120    #
    li $a3, 200    #

    jal MinMax
    move $t0, $v1
    move $t1, $v0
    la $a0, max
    li $v0, 4
    syscall      # display "Max is :"
    move $a0, $t0
    li $v0, 1
    syscall      # display max
    la $a0, endl
    li $v0, 4
    syscall      # display end of line
    la $a0, min
    li $v0, 4
    syscall      # display "Min is :"
    move $a0, $t1
    li $v0, 1
    syscall      # display min
    la $a0, endl
    li $v0, 4
    syscall      # display end of line
    li $v0, 10
    syscall      # exit

MinMax:
    blt $a0, $a1, A1gret
A0gret:
    move $v0, $a0
    move $v1, $a1
    j done1
A1gret:
    move $v0, $a1
    move $v1, $a0
done1:
compare2_with_3:
    bge $a2, $a3, A2gret

A3gret:
  is3max:
    bge $v0, $a3, is2min
    move $v0, $a3
  is2min:
    blt $v1, $a2, done
    move $v1, $a2

    j done

A2gret:
  is2max:
    bge $v0, $a2, is3min
    move $v0, $a2
  is3min:
    blt $v1, $a3, done
    move $v1, $a3

done:
    jr $ra
