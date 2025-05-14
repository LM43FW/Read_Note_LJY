    .data
msg:    .asciz "爱我中华！"  # 以 NULL 结尾的字符串

    .text
    .globl _start

_start:
    # 写入系统调用
    li a7, 64               # syscall number for write (在 RISC-V 中是 64)
    li a0, 1                # file descriptor 1 is stdout
    la a1, msg              # pointer to the string
    li a2, 15               # length of the string in bytes (UTF-8 encoding)
    ecall                   # invoke operating system to do the write

