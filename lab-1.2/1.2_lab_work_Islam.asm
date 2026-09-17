.model small                  ;use small memory model
.stack 100h                   ;reserve stack memory

.data                         ;start data segment

;student's name and surname declared in the data segment
studentname db 'Md Nahidul Islam','$'

;13,10 moves to a new line. two pairs place the drawing on line 3, and nine spaces place the first letter in column 10. the letters follow the sequence `MDNAHIDULISLAM`
floweroutput db 13,10,13,10
             db '         MDNAH       IDULI',13,10
             db '         S   LAM   MDN   A',13,10
             db '         H     ID UL     I',13,10
             db '         SLA    M M    DNA',13,10
             db '           HID  ULI  SLA',13,10
             db '             MMD N AHI',13,10
             db '               DULIS',13,10
             db '             LAM M DNA',13,10
             db '           HID  ULI  SLA',13,10
             db '         MMD    N A    HID',13,10
             db '         U     LI SL     A',13,10
             db '         M   MDN   AHI   D',13,10
             db '         ULISL       AMMDN','$'

.code                         ;start code segment

main proc                     ;start main procedure

    ;initializing the data segment
    mov ax, @data
    mov ds, ax

    ;print the complete flower drawing
    ;dx contains the address of the output string
    lea dx, floweroutput

    ;ah = 09h prints a $-terminated string
    mov ah, 09h
    int 21h

    ;terminate the program and return to MS-DOS
    mov ax, 4c00h
    int 21h

main endp                     ;end main procedure

end main                      ;end program