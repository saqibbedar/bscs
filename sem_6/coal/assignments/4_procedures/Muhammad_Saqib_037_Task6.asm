; Task 6
; Name: Muhammad Saqib 04072313037
;
; Task description:
;
;   Write an Assembly Language program that:
;
;   1. Stores two numbers in memory.
;   2. Creates three procedures:
;       ADD_NUM → to add two numbers
;       SUB_NUM → to subtract two numbers
;       DIV_NUM → to divide one number by another
;   3. Calls all procedures one by one.
;   4. Stores all results in separate variables.
;   5. Displays all results on the screen.
;

.model small
.stack 100h

.data

; user inputs
first_num  dw ?
second_num dw ?

; results
sum_result dw ?
sub_result dw ?
div_result dw ?

; messages
msg_input1 db 'Please enter first number: $'
msg_input2 db 13,10,'Please enter second number: $'
msg_sum    db 13,10,'Addition: $'
msg_sub    db 13,10,'Subtraction: $'
msg_div    db 13,10,'Division: $'

.code
main proc

    mov ax, @data
    mov ds, ax

    ; take first input
    lea dx, msg_input1
    mov ah, 09h
    int 21h

    call read_number
    mov first_num, ax

    ; take second input
    lea dx, msg_input2
    mov ah, 09h
    int 21h

    call read_number
    mov second_num, ax

    ; perform operations
    call ADD_NUM
    call SUB_NUM
    call DIV_NUM

    ; display results
    lea dx, msg_sum
    mov ah, 09h
    int 21h
    mov ax, sum_result
    call print_number

    lea dx, msg_sub
    mov ah, 09h
    int 21h
    mov ax, sub_result
    call print_number

    lea dx, msg_div
    mov ah, 09h
    int 21h
    mov ax, div_result
    call print_number

    ; exit
    mov ah, 4ch
    int 21h

main endp


; arithmetic procedures
ADD_NUM proc
    mov ax, first_num
    add ax, second_num
    mov sum_result, ax
    ret
ADD_NUM endp

SUB_NUM proc
    mov ax, first_num
    sub ax, second_num
    mov sub_result, ax
    ret
SUB_NUM endp

DIV_NUM proc
    mov dx, 0          ; required before division
    mov ax, first_num
    mov bx, second_num
    div bx
    mov div_result, ax
    ret
DIV_NUM endp


; input procedure
read_number proc
    mov bx, 0          ; will store final number

read_loop:
    mov ah, 01h
    int 21h

    cmp al, 13         ; Enter pressed?
    je done_input

    sub al, 48         ; ASCII → digit
    mov cl, al
    mov ch, 0

    mov ax, bx
    mov dx, 10
    mul dx             ; shift left (×10)

    add ax, cx         ; add new digit
    mov bx, ax

    jmp read_loop

done_input:
    mov ax, bx         ; return result
    ret
read_number endp


; display procedure
print_number proc
    mov cx, 0
    mov bx, 10

split_digits:
    mov dx, 0
    div bx             ; AX / 10
    push dx            ; remainder
    inc cx
    cmp ax, 0
    jne split_digits

print_digits:
    pop dx
    add dl, 48         ; digit → ASCII
    mov ah, 02h
    int 21h
    loop print_digits

    ret
print_number endp

end main