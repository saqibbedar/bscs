; Q2: Program to print circle on screen
; 
; Name: Muhammad Saqib
; Reg. No: 04072313037
;

.model small
.stack 100h

.data
xc      dw 160          ; center x-position of circle
yc      dw 100          ; center y-position of circle
r       dw 40           ; circle radius
r2      dw 1600         ; radius squared for circle formula
color   db 02h          ; pixel color (green)

.code
main Proc
    mov ax, @data
    mov ds, ax

    mov ax, 0013h       ; switch to graphics mode
    int 10h

    mov dx, yc
    sub dx, r           ; start from top boundary of circle

y_loop:
    mov cx, xc
    sub cx, r           ; start from left boundary of circle

x_loop:
    ; calculate (x - xc)^2
    mov ax, cx
    sub ax, xc
    mov bx, ax

    push dx
    imul bx
    mov bx, ax
    pop dx

    ; calculate (y - yc)^2
    mov ax, dx
    sub ax, yc

    push dx
    push bx
    mov bx, ax
    imul bx
    pop bx
    pop dx

    ; check if point lies inside circle
    add ax, bx
    cmp ax, r2
    jg skip_draw

    ; draw pixel
    mov ah, 0Ch
    mov al, color
    mov bh, 00h
    int 10h

skip_draw:
    inc cx              ; move to next x-coordinate
    mov ax, xc
    add ax, r
    cmp cx, ax
    jle x_loop

    inc dx              ; move to next y-coordinate
    mov ax, yc
    add ax, r
    cmp dx, ax
    jle y_loop

    mov ah, 00h         ; wait for key press
    int 16h

    mov ax, 0003h       ; return to text mode
    int 10h

    mov ah, 4Ch         ; terminate program
    int 21h

main Endp
end main