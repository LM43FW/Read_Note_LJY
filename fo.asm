.data  
input_string: .string "hello blcu"  # ���������ַ���  
  
.text  
.globl main  
  
main:  
    la a0, input_string  # ���������ַ����ĵ�ַ��a0  
    li a1, 0             # ��ʼ�������Ĵ���a1Ϊ0  
  
convert_and_print_loop:  
    # ����Ƿ񵽴��ַ���ĩβ  
    lb t0, 0(a0)         # ���ص�ǰ�ַ�
    beq t0, zero, done   # ����ַ���'\0'������ѭ��
 
  
    # ����Ƿ�ΪСд��ĸ  
    li t1, 'a'           # t1 = 'a'  
    li t2, 'z'           # t2 = 'z'  
    blt t0, t1, print_char  # ����ַ�С��'a'����ֱ�Ӵ�ӡ�ַ�  
    bgt t0, t2, print_char  # ����ַ�����'z'����ֱ�Ӵ�ӡ�ַ�  
  
    # ת��Ϊ��д��ĸ  
    li t3, 32            # 32��Сд�ʹ�д��ĸ֮���ASCII���ֵ  
    sub t0, t0, t3       # ��Сд��ĸת��Ϊ��д��ĸ  
  
print_char:  
    # ����ַ�  
    li a7, 11            # ϵͳ���úţ�д�ַ�  
    mv a0, t0            # ��Ҫ��ӡ���ַ��ƶ���a0  
    ecall                # ִ��ϵͳ����  
  
    # ���������Ĵ���a1��ָ����һ���ַ�  
    addi a1, a1, 1       # �������Ĵ���a1����1  
    j convert_and_print_loop  # ���ص�ѭ���Ŀ�ʼ  
  
done:  
    # �˳�����  
    li a7, 10            # ϵͳ���úţ��˳�  
    ecall                # ִ��ϵͳ����