; Program to that gets input from the user about the number of squares and size of square
;
; Muhammad Saqib 
; Reg. No: 04072313037
;
; Note: Program supports number between 1-9
; first input for size of square to be printed
; second input print no. of squares asked

.model small
.stack 100h

.data

squareSize db ?
numSquares db ?

.code
main proc

    ; initialize data segment
    mov ax, @data
    mov ds, ax

    ; input size of square
    mov ah, 01h
    int 21h
    sub al, 30h
    mov squareSize, al

    ; input number of squares
    mov ah, 01h
    int 21h
    sub al, 30h
    mov numSquares, al

    ; move number of squares in bl
    mov bl, numSquares

    ; counter for square number
    mov si, 1

    ; starting column
    mov dl, 0

printAllSquares:

    ; compare counter with number of squares
    cmp si, bx
    jg exitProgram

    ; move square size in al
    mov al, squareSize

    ; call procedure for printing square
    call printSquare

    ; move cursor for next square
    add dl, squareSize
    add dl, 2

    ; increment square counter
    inc si

    jmp printAllSquares

exitProgram:

    ; terminate 
    mov ah, 4ch
    int 21h

main endp


; procedure for printing square
printSquare proc

    ; save registers
    push ax
    push bx
    push cx
    push dx

    ; move size in bl
    mov bl, al

    ; top row of window
    mov ch, 0

    ; left most column of window
    mov cl, dl

    ; bottom row of window
    mov dh, bl
    dec dh

    ; right most column of window
    mov al, cl
    add al, bl
    dec al
    mov dl, al

    ; routine to scroll lines
    mov ah, 6

    ; number of lines to be scrolled
    mov al, 0

    ; color attribute
    mov bh, 00010000b

    int 10h

    ; restore registers
    pop dx
    pop cx
    pop bx
    pop ax

    ret

printSquare endp

end main