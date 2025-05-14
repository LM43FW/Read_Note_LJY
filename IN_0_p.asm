    .data
prompt: .asciiz "请输入数字字符（0-9），输入非数字字符结束："
newline: .asciiz "\n"

    .text
    .globl main

main:
    # 打印提示信息
    li a7, 4          # syscall: print string
    la a0, prompt
    ecall

loop:
    # 读取一个字符
    li a7, 12         # syscall: read character
    ecall

    # 检查是否是数字字符（'0'到'9'）
    li t0, '0'        # t0 = '0'
    li t1, '9'        # t1 = '9'
    blt a0, t0, end   # 如果输入字符 < '0'，结束
    bgt a0, t1, end   # 如果输入字符 > '9'，结束

   
      # 打印换行
    li a7, 4          # syscall: print string
    la a0, newline
    ecall
       # 打印读取到的字符
    li a7, 11         # syscall: print character
    ecall

	# 打印换行
    li a7, 4          # syscall: print string
    la a0, newline
    ecall

    # 继续读取下一个字符
    j loop

end:
    # 结束程序
    li a7, 10         # syscall: exit
    ecall
