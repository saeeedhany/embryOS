; bootloader.asm - Boot sector header + minimal init
[org 0x7C00]        
bits 16             

start:
    cli             
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00  
    sti             

    
    mov si, msg
.print_char:
    lodsb
    or al, al
    jz .done_print
    mov ah, 0x0E
    int 0x10
    jmp .print_char
.done_print:

hang:
    hlt
    jmp hang

msg db "Embryos boot", 0

; pad the rest of the sector with zeros up to 510 bytes,
; then write the 2-byte boot signature 0xAA55 at the end.
times 510 - ($ - $$) db 0
dw 0xAA55

