[bits 16]
[org 0x8000]

mov si, msg
.print:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E
    int 0x10
    jmp .print

.done:
.hang:
    hlt
    jmp .hang

msg db "Hello from REAL MODE kernel!", 0

