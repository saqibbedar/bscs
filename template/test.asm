section .data
    msg db "Hello, VSCode!", 0  ; String data
    num1 dq 10                  ; 64-bit integer
    num2 dq 20                  ; 64-bit integer

section .bss
    result resq 1               ; Reserve space for result

section .text
    global _start

_start:
    ; Arithmetic Operators
    mov rax, [num1]    ; Load num1 into RAX
    add rax, [num2]    ; rax = num1 + num2
    sub rax, 5         ; rax = rax - 5
    imul rax, 2        ; rax = rax * 2
    mov [result], rax  ; Store the result

    ; Logical Operators
    mov rbx, 0xA       ; Load 1010 in binary
    and rbx, 0x3       ; AND with 0011 (Result: 0010)
    or rbx, 0x5        ; OR with 0101 (Result: 0111)
    xor rbx, 0xF       ; XOR with 1111 (Result: 1000)
    not rbx            ; NOT operation

    ; Comparison Operators
    mov rcx, 10
    cmp rcx, 20
    jg greater_label   ; Jump if greater
    jl lesser_label    ; Jump if lesser
    je equal_label     ; Jump if equal

greater_label:
    mov rdx, 1
    jmp end_program

lesser_label:
    mov rdx, 2
    jmp end_program

equal_label:
    mov rdx, 3

end_program:
    ; Exit Program
    mov rax, 60        ; syscall: exit
    xor rdi, rdi       ; status: 0
    syscall
