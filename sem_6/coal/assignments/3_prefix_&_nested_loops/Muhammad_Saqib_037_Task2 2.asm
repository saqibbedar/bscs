; Task 2: Triangle Pattern
; Q: Write a program to print the triangle upwards and downwards. use nested loops.
;   
; *
; * *
; * * *
; * * * *
; * * * * *
; * * * *
; * * *
; * *
; *
;
; Name: Muhammad Saqib
; Reg. No: 04072313037

.model small
.stack 100h

.data
n db 5
newline db 0dh,0ah,'$'

.code
main proc
    mov ax,@data
    mov ds,ax

    ; Start from the first row of the triangle.
    mov cl,1

upper:
    ; Print the upper half row by row.
    mov bl,cl

print1:
    ; Keep printing stars with spaces between them until the row is complete.
    cmp bl,0
    je next1
    mov dl,'*'
    mov ah,02h
    int 21h
    dec bl
    cmp bl,0
    je print1
    mov dl,' '
    mov ah,02h
    int 21h
    jmp print1

next1:
    ; Move to the next line before processing the next row.
    mov dx,offset newline
    mov ah,09h
    int 21h

    inc cl
    cmp cl,n
    jle upper

    ; Reuse the same logic for the lower half, starting one row below the peak.
    mov cl,n
    dec cl

lower:
    ; Print the lower half row by row.
    mov bl,cl

print2:
    ; Keep printing stars with spaces between them until the lower row is complete.
    cmp bl,0
    je next2
    mov dl,'*'
    mov ah,02h
    int 21h
    dec bl
    cmp bl,0
    je print2
    mov dl,' '
    mov ah,02h
    int 21h
    jmp print2

next2:
    ; Finish the row and continue moving downward.
    mov dx,offset newline
    mov ah,09h
    int 21h

    dec cl
    cmp cl,0
    jg lower

    ; Exit cleanly back to DOS.
    mov ah,4ch
    int 21h

main endp
end main