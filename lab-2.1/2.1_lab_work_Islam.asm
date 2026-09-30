.model small                  ;use small memory model
.stack 100h                   ;reserve stack memory

.data                         ;start data segment

;name and surname are stored as individual letters
studentname db 'M','d',' ','N','a','h','i','d','u','l'
namelen equ $ - studentname
studentsurname db 'I','s','l','a','m'
surnamelen equ $ - studentsurname

promptrow1 db 'Enter 1st row (1-21): $'
promptcol1 db 'Enter 1st column (1-71): $'
promptrow2 db 'Enter 2nd row (1-25): $'
promptcol2 db 'Enter 2nd column (1-40): $'
invalidmsg db 'Invalid value. Try again.',13,10,'$'
crlf db 13,10,'$'

;buffer accepts a decimal number with up to two digits
inputbuffer db 3,0,3 dup(0)

row1 db ?
col1 db ?
row2 db ?
col2 db ?

.code                         ;start code segment

main proc                     ;start main procedure

    ;initialize the data segment
    mov ax, @data
    mov ds, ax

    ;read the first row, valid range 1-21
readrow1:
    lea dx, promptrow1
    mov ah, 09h
    int 21h
    call readnumber
    push ax
    pushf
    lea dx, crlf
    mov ah, 09h
    int 21h
    popf
    pop ax
    jc badrow1
    cmp al, 1
    jb badrow1
    cmp al, 21
    ja badrow1
    mov row1, al
    jmp readcol1
badrow1:
    lea dx, invalidmsg
    mov ah, 09h
    int 21h
    jmp readrow1

    ;read the first column, valid range 1-71
readcol1:
    lea dx, promptcol1
    mov ah, 09h
    int 21h
    call readnumber
    push ax
    pushf
    lea dx, crlf
    mov ah, 09h
    int 21h
    popf
    pop ax
    jc badcol1
    cmp al, 1
    jb badcol1
    cmp al, 71
    ja badcol1
    mov col1, al
    jmp readrow2
badcol1:
    lea dx, invalidmsg
    mov ah, 09h
    int 21h
    jmp readcol1

    ;read the second row, valid range 1-25
readrow2:
    lea dx, promptrow2
    mov ah, 09h
    int 21h
    call readnumber
    push ax
    pushf
    lea dx, crlf
    mov ah, 09h
    int 21h
    popf
    pop ax
    jc badrow2
    cmp al, 1
    jb badrow2
    cmp al, 25
    ja badrow2
    mov row2, al
    jmp readcol2
badrow2:
    lea dx, invalidmsg
    mov ah, 09h
    int 21h
    jmp readrow2

    ;read the second column, valid range 1-40
readcol2:
    lea dx, promptcol2
    mov ah, 09h
    int 21h
    call readnumber
    push ax
    pushf
    lea dx, crlf
    mov ah, 09h
    int 21h
    popf
    pop ax
    jc badcol2
    cmp al, 1
    jb badcol2
    cmp al, 40
    ja badcol2
    mov col2, al
    jmp coordinatesok
badcol2:
    lea dx, invalidmsg
    mov ah, 09h
    int 21h
    jmp readcol2

coordinatesok:
    ;set 80x25 text mode and clear the screen
    mov ax, 0003h
    int 10h

    ;print the name five times vertically in the same column
    mov bl, row1
    mov cx, 5
namecolumn:
    mov dh, bl
    mov dl, col1
    call setcursor
    call printname
    inc bl
    loop namecolumn

    ;print the surname seven times on the same line
    mov dh, row2
    mov dl, col2
    call setcursor
    mov cx, 7
surnameline:
    call printsurname
    cmp cx, 1
    je nospace
    mov dl, ' '
    mov ah, 02h
    int 21h
nospace:
    loop surnameline

    ;move the cursor to the last line before program termination
    mov dh, 25
    mov dl, 1
    call setcursor

    ;terminate the program and return to MS-DOS
    mov ax, 4c00h
    int 21h

main endp                     ;end main procedure

;read a one- or two-digit decimal number from the keyboard
;returns the value in al and sets carry if the input is invalid
readnumber proc
    push bx
    push cx
    push dx
    push si

    mov byte ptr [inputbuffer+1], 0
    lea dx, inputbuffer
    mov ah, 0ah
    int 21h

    mov cl, [inputbuffer+1]
    xor ch, ch
    cmp cx, 0
    je numberinvalid

    lea si, inputbuffer+2
    xor ax, ax
numberloop:
    mov bl, [si]
    cmp bl, '0'
    jb numberinvalid
    cmp bl, '9'
    ja numberinvalid
    sub bl, '0'
    xor bh, bh
    mov dl, 10
    mul dl
    add ax, bx
    inc si
    loop numberloop

    pop si
    pop dx
    pop cx
    pop bx
    clc
    ret

numberinvalid:
    pop si
    pop dx
    pop cx
    pop bx
    stc
    ret
readnumber endp

;place the cursor at a 1-based row and column using BIOS
setcursor proc
    push ax
    push bx
    push dx

    dec dh
    dec dl
    mov ah, 02h
    mov bh, 00h
    int 10h

    pop dx
    pop bx
    pop ax
    ret
setcursor endp

;print the name from its individual letters
printname proc
    push ax
    push cx
    push dx
    push si

    lea si, studentname
    mov cx, namelen
nameloop:
    mov dl, [si]
    mov ah, 02h
    int 21h
    inc si
    loop nameloop

    pop si
    pop dx
    pop cx
    pop ax
    ret
printname endp

;print the surname from its individual letters
printsurname proc
    push ax
    push cx
    push dx
    push si

    lea si, studentsurname
    mov cx, surnamelen
surnameloop:
    mov dl, [si]
    mov ah, 02h
    int 21h
    inc si
    loop surnameloop

    pop si
    pop dx
    pop cx
    pop ax
    ret
printsurname endp

end main                      ;end program
