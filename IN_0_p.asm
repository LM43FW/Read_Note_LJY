    .data
prompt: .asciiz "�����������ַ���0-9��������������ַ�������"
newline: .asciiz "\n"

    .text
    .globl main

main:
    # ��ӡ��ʾ��Ϣ
    li a7, 4          # syscall: print string
    la a0, prompt
    ecall

loop:
    # ��ȡһ���ַ�
    li a7, 12         # syscall: read character
    ecall

    # ����Ƿ��������ַ���'0'��'9'��
    li t0, '0'        # t0 = '0'
    li t1, '9'        # t1 = '9'
    blt a0, t0, end   # ��������ַ� < '0'������
    bgt a0, t1, end   # ��������ַ� > '9'������

   
      # ��ӡ����
    li a7, 4          # syscall: print string
    la a0, newline
    ecall
       # ��ӡ��ȡ�����ַ�
    li a7, 11         # syscall: print character
    ecall

	# ��ӡ����
    li a7, 4          # syscall: print string
    la a0, newline
    ecall

    # ������ȡ��һ���ַ�
    j loop

end:
    # ��������
    li a7, 10         # syscall: exit
    ecall
