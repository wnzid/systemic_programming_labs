.model small                  ;use small memory model
.stack 100h                   ;reserve stack memory

.data                         ;start data segment

output db 13,10               ;move to line 2
       db 13,10               ;move to line 3
       db 13,10               ;move to line 4
       db 13,10               ;move to line 5
       db 13,10               ;move to line 6
       db 13,10               ;move to line 7
       db 13,10               ;move to line 8
       db '      Md Nahidul'    ;line 8, position 7. position 7 means 6 spaces before the name
       db 13,10               ;move to line 9
       db 13,10               ;move to line 10
       db 13,10               ;move to line 11
       db 13,10               ;move to line 12

       ;lines 12-15, position 2. position 2 means 1 space before surname
       db ' Islam',13,10      ;line 12
       db ' Islam',13,10      ;line 13
       db ' Islam',13,10      ;line 14
       db ' Islam',13,10      ;line 15

       db 13,10               ;empty line 16, move to line 17

       ;lines 17-19, position 4. position 4 means 3 spaces before the surname and name
       db '   Islam Md Nahidul',13,10  ;line 17
       db '   Islam Md Nahidul',13,10  ;line 18
       db '   Islam Md Nahidul$'       ;line 19

.code                         ;start code segment

main proc                     ;start main procedure

       ;initializing the data segment
       mov ax, @data
       mov ds, ax

       ;putting the address of the output data block into DX
       mov dx, offset output

       ;DOS interrupts 21h, function 09h prints
       ;the string points to by DS:DX until $
       mov ah, 09h
       int 21h

       ;DOS interrupts 21h, function 4Ch
       ;terminates the program.
       mov ax, 4C00h
       int 21h

main endp                     ;end main procedure

end main                      ;end program