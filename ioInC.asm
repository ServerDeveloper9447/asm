default rel

section .data
    fmt db "The input is: %s", 0
    q db "Enter something: ", 0
    qL equ $ - q

section .bss
    buff resb 16

section .text
    global main
    extern printf

main:
    push rbp                     ; didnt know this is called register base pointer
    mov rbp, rsp

    lea rdi, [rel q]             ; well, relative adressing really is tuff
    mov rsi, qL
    call print_prompt

    lea rdi, [rel buff]
    call take_input

    lea rdi, [rel fmt]           ; this is like printf(fmt,...
    lea rsi, [rel buff]          ; here the printf ends like printf(fmt, num)
    xor rax, rax                 ; set to zero
    call printf WRT ..plt        ; and... the celebrity enters

    mov rax, 0
    leave                        ; ive come to know this restores the stack pointer and pops rbp
    ret

take_input:
    mov rsi, rdi
    mov rdx, 15
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