li a0, 1  
li a1, 100  
li t0, 0  
addi t1, zero, 0  
  
loop:  
    add t0, t0, a0  
    addi a0, a0, 1  
    addi t1, t1, 1  
    bne t1, a1, loop  
  
mv a0, t0  
li a7, 1  
ecall  
  
li a7, 10  
ecall
