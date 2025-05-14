.data  
input_string: .string "hello blcu"  # 定义输入字符串  
  
.text  
.globl main  
  
main:  
    la a0, input_string  # 加载输入字符串的地址到a0  
    li a1, 0             # 初始化索引寄存器a1为0  
  
convert_and_print_loop:  
    # 检查是否到达字符串末尾  
    lb t0, 0(a0)         # 加载当前字符
    beq t0, zero, done   # 如果字符是'\0'，结束循环
 
  
    # 检查是否为小写字母  
    li t1, 'a'           # t1 = 'a'  
    li t2, 'z'           # t2 = 'z'  
    blt t0, t1, print_char  # 如果字符小于'a'，则直接打印字符  
    bgt t0, t2, print_char  # 如果字符大于'z'，则直接打印字符  
  
    # 转换为大写字母  
    li t3, 32            # 32是小写和大写字母之间的ASCII码差值  
    sub t0, t0, t3       # 将小写字母转换为大写字母  
  
print_char:  
    # 输出字符  
    li a7, 11            # 系统调用号：写字符  
    mv a0, t0            # 将要打印的字符移动到a0  
    ecall                # 执行系统调用  
  
    # 更新索引寄存器a1以指向下一个字符  
    addi a1, a1, 1       # 将索引寄存器a1增加1  
    j convert_and_print_loop  # 跳回到循环的开始  
  
done:  
    # 退出程序  
    li a7, 10            # 系统调用号：退出  
    ecall                # 执行系统调用