    .data
msg:    .asciz "�����л���"  # �� NULL ��β���ַ���

    .text
    .globl _start

_start:
    # д��ϵͳ����
    li a7, 64               # syscall number for write (�� RISC-V ���� 64)
    li a0, 1                # file descriptor 1 is stdout
    la a1, msg              # pointer to the string
    li a2, 15               # length of the string in bytes (UTF-8 encoding)
    ecall                   # invoke operating system to do the write

