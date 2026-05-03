section .text
    global _start

_start:
    mov rdi, 50
    mov rsi, 70
    call add_f

    mov rdi, rax
    mov rax, 60
    syscall

add_f:
    mov rax, rdi
    add rax, rsi
    ret