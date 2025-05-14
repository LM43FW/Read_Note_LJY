    .data
prompt:     .ascii "请输入一个100以内的整数: "  # 定义一个字符串，作为输入提示
result:     .ascii "质数: "                       # 定义一个字符串，作为质数输出的提示
comma:      .ascii ", "                           # 定义一个字符串，用于输出逗号分隔

    .text
    .globl main                                   # 声明 main 函数为全局可见

main:
    # 打印提示信息
    li a7, 4                                      # 加载系统调用号 4（打印字符串）
    la a0, prompt                                 # 将提示字符串的地址加载到 a0
    ecall                                         # 调用系统调用，打印提示信息

    # 读取用户输入
    li a7, 5                                      # 加载系统调用号 5（读取整数）
    ecall                                         # 调用系统调用，获取用户输入的整数
    mv t0, a0                                     # 将读取的整数存储到 t0 中

    # 检查输入的范围
    li t1, 100                                    # 将 100 加载到 t1 中
    blt t0, zero, end                             # 如果输入的整数小于 0，跳转到 end
    bgt t0, t1, end                               # 如果输入的整数大于 100，跳转到 end

    # 打印质数的提示信息
    li a7, 4                                      # 加载系统调用号 4（打印字符串）
    la a0, result                                 # 将质数提示字符串的地址加载到 a0
    ecall                                         # 调用系统调用，打印质数提示

    # 从 2 到输入的整数，检查质数
    li t2, 2                                      # 将 t2 初始化为 2（质数的起始值）
    li t6, 0                                      # 初始化 t6 为 0，用于检查是否已经打印过质数

check_next:
    bge t2, t0, end_loop                          # 如果 t2 >= 输入的整数 t0，结束循环

    # 检查 t2 是否为质数
    li t3, 2                                      # 将 t3 初始化为 2（从 2 开始检查）
    li t4, 1                                      # 将 t4 初始化为 1，假设 t2 是质数

check_divisor:
    mul t5, t3, t3                                # 计算 t3 * t3，结果存储在 t5 中
    bgt t5, t2, print_prime                       # 如果 t3 的平方大于 t2，跳转到 print_prime（t2 是质数）

    rem t5, t2, t3                                # 计算 t2 % t3，结果存储在 t5 中
    beq t5, zero, not_prime                       # 如果 t2 % t3 == 0，t2 不是质数，跳转到 not_prime

    addi t3, t3, 1                                # t3 自增 1，检查下一个因子
    j check_divisor                                # 继续检查下一个因子

not_prime:
    li t4, 0                                      # 设置 t4 为 0，表示 t2 不是质数

print_prime:
    beq t4, zero, skip_print                      # 如果 t4 是 0（不是质数），跳过打印

    # 打印逗号（如果不是第一个质数）
    beq t6, zero, print_num                       # 如果 t6 是 0（第一个质数），跳转到 print_num
    li a7, 4                                      # 加载系统调用号 4（打印字符串）
    la a0, comma                                   # 将逗号字符串的地址加载到 a0
    ecall                                         # 调用系统调用，打印逗号

print_num:
    # 打印 t2
    li a7, 1                                      # 加载系统调用号 1（打印整数）
    mv a0, t2                                     # 将 t2 的值存储到 a0
    ecall                                         # 调用系统调用，打印质数

    addi t6, t6, 1                                # 将 t6 自增 1，表示已经打印过一个质数

skip_print:
    addi t2, t2, 1                                # t2 自增 1，检查下一个数
    j check_next                                  # 跳回 check_next，继续检查下一个数

end_loop:
end:
    li a7, 10                                     # 加载系统调用号 10（退出程序）
    ecall                                         # 调用系统调用，退出程序
