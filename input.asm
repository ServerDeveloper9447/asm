section .bss
    buff resb 16

section .data
    q db "What is your name?: ", 0
    qL equ $ - q
    o db "Your name is: ", 0
    oL equ $ - o
    a db "What is your age?: ", 0
    aLen equ $ - a
    an db "Your age is: ", 0
    anL equ $ - an

section .text
    global _start

_start:
    mov rdi, q
    mov rsi, qL
    call print_prompt

    mov rdi, buff
    call take_input
    mov r12, rax

    mov rdi, o
    mov rsi, oL
    call print_prompt

    mov rdi, buff
    mov rsi, r12
    call print_prompt

    mov rdi, a
    mov rsi, aLen
    call print_prompt

    mov rdi, buff
    call take_input
    mov r12, rax

    mov rdi, an
    mov rsi, anL
    call print_prompt

    mov rdi, buff
    mov rsi, r12
    call print_prompt

    mov rax, 60
    xor rdi, rdi
    syscall

take_input:
    mov rsi, rdi
    mov rdx, 16
    xor rax, rax
    xor rdi, rdi
    syscall
    ret

print_prompt:
    mov r10, rdi
    mov rdx, rsi
    mov rax, 1
    mov rdi, 1
    mov rsi, r10
    syscall
    ret