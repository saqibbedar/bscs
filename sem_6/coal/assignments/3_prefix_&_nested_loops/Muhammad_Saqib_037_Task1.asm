; Task 1: Infix to Prefix Notation
; Q: write a program to convert mathematical expression to prefix notation.
;
; Name: Muhammad Saqib
; Reg. No: 04072313037

.model small
.stack 100h

.data
infix  db 100 dup('$')
prefix db 100 dup('$')
opstk  db 100 dup('$')

top dw -1

msg1 db "Please enter infix (e.g., a+b): $"
msg2 db 0dh,0ah,"prefix: $"

.code
main proc
    mov ax,@data
    mov ds,ax

    ; Show the input prompt to the user.
    lea dx,msg1
    mov ah,09h
    int 21h

    ; Read the infix expression one character at a time.
    lea si,infix

in1:
    mov ah,01h
    int 21h
    cmp al,0dh
    je in2
    mov [si],al
    inc si
    jmp in1

in2:
    ; Mark the end of the input string.
    mov byte ptr [si],'$'

    ; Reverse, swap brackets, convert, then reverse again to get prefix form.
    call rev
    call swp
    call post
    call rev2

    ; Display the final prefix expression.
    lea dx,msg2
    mov ah,09h
    int 21h

    lea si,prefix

pr1:
    ; Print characters until the string terminator is reached.
    mov dl,[si]
    cmp dl,'$'
    je exit
    mov ah,02h
    int 21h
    inc si
    jmp pr1

exit:
    ; Return control to DOS.
    mov ah,4ch
    int 21h
main endp

; -------------------------
; reverse infix
; -------------------------
rev proc
    ; Count the length of the infix string first.
    mov cx,0
    lea si,infix

r1:
    mov al,[si]
    cmp al,'$'
    je r2
    inc si
    inc cx
    jmp r1

r2:
    ; Swap characters from both ends toward the center.
    dec cx
    mov di,cx
    xor bx,bx

r3:
    cmp bx,di
    jge r4

    mov al,infix[bx]
    mov ah,infix[di]

    mov infix[bx],ah
    mov infix[di],al

    inc bx
    dec di
    jmp r3

r4:
    ret
rev endp

; -------------------------
; swap brackets
; -------------------------
swp proc
    ; Change '(' to ')' and ')' to '(' after reversing.
    lea si,infix

s1:
    mov al,[si]
    cmp al,'$'
    je s4

    cmp al,'('
    jne s2
    mov byte ptr [si],')'
    jmp s3

s2:
    cmp al,')'
    jne s3
    mov byte ptr [si],'('

s3:
    inc si
    jmp s1

s4:
    ret
swp endp

; -------------------------
; precedence
; -------------------------
prec proc
    ; Return precedence in AL: 0 for non-operator, 1 for +/-, 2 for */.
    cmp al,'+'
    je pl1
    cmp al,'-'
    je pl1
    cmp al,'*'
    je ph1
    cmp al,'/'
    je ph1

    mov al,0
    ret

pl1:
    mov al,1
    ret

ph1:
    mov al,2
    ret
prec endp

; -------------------------
; infix → postfix
; -------------------------
post proc
    ; Reset the operator stack and start scanning the converted infix string.
    mov word ptr top,-1
    lea si,infix
    lea di,prefix

pst0:
    ; Stop once the end of the string is reached.
    mov al,[si]
    cmp al,'$'
    jne pst0_cont
    jmp pst9

pst0_cont:

    ; check operand (0-9, A-Z, a-z)
    cmp al,'0'
    jb chk_alpha
    cmp al,'9'
    jbe operand

chk_alpha:
    cmp al,'A'
    jb chk_small
    cmp al,'Z'
    jbe operand

chk_small:
    cmp al,'a'
    jb pst2
    cmp al,'z'
    ja pst2

operand:
    ; Copy operands directly to the output.
    mov [di],al
    inc di
    inc si
    jmp pst0

pst2:
    ; Push an opening bracket onto the stack.
    cmp al,'('
    jne pst2a
    inc top
    mov bx,top
    mov opstk[bx],al
    inc si
    jmp pst0

pst2a:
    ; Pop until the matching opening bracket is found.
    cmp al,')'
    jne pst2b
    jmp pst5

pst2b:
    ; Handle operators by precedence.
    cmp al,'+'
    je pstop
    cmp al,'-'
    je pstop
    cmp al,'*'
    je pstop
    cmp al,'/'
    je pstop

    inc si
    jmp pst0

pstop:
    ; Save the current operator and its precedence for later comparison.
    mov dl,al
    call prec
    mov dh,al

pst4:
    ; Pop higher or equal precedence operators before pushing the new one.
    mov ax,top
    cmp ax,-1
    je pst7

    mov bx,ax
    mov al,opstk[bx]
    cmp al,'('
    je pst7

    call prec
    cmp al,dh
    jl pst7

    mov bx,top
    mov al,opstk[bx]
    mov [di],al
    inc di
    dec top
    jmp pst4

pst7:
    ; Push the current operator onto the stack.
    inc top
    mov bx,top
    mov opstk[bx],dl
    inc si
    jmp pst0

pst5:
    ; Unwind the stack until the opening bracket is removed.
    mov ax,top
    cmp ax,-1
    je pst5d

    mov bx,ax
    mov al,opstk[bx]
    cmp al,'('
    je pst6

    mov [di],al
    inc di
    dec top
    jmp pst5

pst6:
    dec top

pst5d:
    inc si
    jmp pst0

pst9:
    ; Flush any remaining operators after the full expression is processed.
    mov ax,top
    cmp ax,-1
    je pst10

    mov bx,ax
    mov al,opstk[bx]
    cmp al,'('
    je pst9a

    mov [di],al
    inc di
    dec top
    jmp pst9

pst9a:
    dec top
    jmp pst9

pst10:
    ; Terminate the output string.
    mov byte ptr [di],'$'
    ret
post endp

; -------------------------
; reverse prefix
; -------------------------
rev2 proc
    ; Measure the output length before reversing it.
    mov cx,0
    lea si,prefix

rr1:
    mov al,[si]
    cmp al,'$'
    je rr2
    inc si
    inc cx
    jmp rr1

rr2:
    ; Reverse the prefix string in place.
    dec cx
    mov di,cx
    xor bx,bx

rr3:
    cmp bx,di
    jge rr4

    mov al,prefix[bx]
    mov ah,prefix[di]

    mov prefix[bx],ah
    mov prefix[di],al

    inc bx
    dec di
    jmp rr3

rr4:
    ret
rev2 endp

end main