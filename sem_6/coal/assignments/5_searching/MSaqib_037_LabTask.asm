; Program to search number from array of 10 numbers and display the message found and not found
;
; Muhammad Saqib 
; Reg. No: 04072313037

.model small
.stack 100h

.data
msg1 db 13, 10, "Found$"
msg2 db 13, 14, "Not Found$"
arr1 db 3,7,1,9,4,0,6,2,8,5

.code
main proc
    mov ax, @data
    mov ds, ax

    ; input number
    mov ah, 01h
    int 21h
    sub al, 30h

    ; mov input number in bl
    mov bl, al

    ; call function
    call find_num

    ; terminate 
    mov ah, 4ch
    int 21h

; procedure to find 
find_num proc

    mov si, 0          ; array index
    mov cx, 10         ; total elements

search_loop:

    mov al, arr1[si]

    cmp al, bl
    je found_label

    inc si
    loop search_loop

    ; not found
    lea dx, msg2
    mov ah, 09h
    int 21h
    ret

found_label:

    lea dx, msg1
    mov ah, 09h
    int 21h

    ret

find_num endp

main endp
end main