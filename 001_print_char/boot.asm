ORG 0x7c00
BITS 16
start:
    mov ah, 0eh
    mov al, 'H'
    int 0x10
    jmp $

times 510-($-$$) db 00
dw 0xAA55