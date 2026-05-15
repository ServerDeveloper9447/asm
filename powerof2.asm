section .data
    p db "Enter a number: ", 0
    pl equ $ - p

section .bss
    buff resb 16

section .text
    global _start

_start:
    mov rax, 16  ;fixed until i learn how to take integer inputs
    mov rdi, rax
    dec rdi
    and rax, rdi
    jz if_true

if_false:
    mov rdi, 0
    jmp exit

if_true:
    mov rdi, 1
    jmp exit

exit:
    mov rax, 60
    syscall