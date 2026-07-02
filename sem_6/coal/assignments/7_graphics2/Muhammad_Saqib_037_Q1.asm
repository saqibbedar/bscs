; Q1: Program to print 
;
;           *
;         * * *
;       * * * * *
;
; Name: Muhammad Saqib
; Reg. No: 04072313037
;

.model small
.stack 100h

.data

.code
main proc
    mov ax, @data
    mov ds, ax

    mov bh, 3          ; total number of rows
    mov bl, 1          ; starting number of stars

row_loop:

    ; print leading spaces before stars
    mov cl, bh        

space_loop:
    mov ah, 02h
    mov dl, ' '
    int 21h

    dec cl
    jnz space_loop

    ; print stars for current row
    mov cl, bl        

star_loop:
    mov ah, 02h
    mov dl, '*'
    int 21h

    dec cl
    jnz star_loop

    ; move cursor to next line
    mov ah, 02h

    mov dl, 0Dh
    int 21h

    mov dl, 0Ah
    int 21h

    ; update values for next row
    add bl, 2          ; increase stars by 2
    dec bh             ; decrease spaces/rows count

    cmp bh, 0
    jne row_loop       ; repeat until all rows printed

    ; terminate program
    mov ah, 4Ch
    int 21h

main endp
end main