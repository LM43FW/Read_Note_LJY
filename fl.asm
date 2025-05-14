    .data
num1:   .float  56.0
num2: .float  37.0
result: .float  0.0

    .text
    .globl main
main:
    # Load the floating-point numbers into F registers
    flw     fa0, num1        # Load 56.0 into fa0
    flw     fa1, num2        # Load 37.0 into fa1

    # Perform division
    fdiv.s  fa2, fa0, fa1    # fa2 = fa0 / fa1 (56.0 / 37.0)

    # Round to 4 decimal places
    # We will multiply by 10000, round, then divide by 10000
    li      t0, 10000        # Load 10000 into t0
    fmul.s  fa2, fa2, t0     # fa2 = fa2 * 10000

    # Round to the nearest integer
    frint.s fa2, fa2         # Round fa2 to nearest integer

    # Divide by 10000 to get back to the original scale
    fdiv.s  fa2, fa2, t0     # fa2 = fa2 / 10000

    # Store the result
    fsw     fa2, result      # Store the result in memory

    # Exit the program (if running in a simulator)
    li      a7, 10           # Load the exit syscall number
    ecall                    # Make the syscall to exit
