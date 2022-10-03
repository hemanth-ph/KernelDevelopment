ORG 0x7c00

start:
    mov ah,2
    mov ds,ax
    mov es,ax

    mov ah,2
    mov al,1
    mov ch,0
    mov cl,2
    mov dh,0
    mov bx,buffer
    int 0x13
    jc error
    mov si, buffer
    call print
    jmp $
error:
    mov si, error_msg
    call print
    jmp $

print:
    mov ah, 0x0e
.loop:
    lodsb
    cmp al,0
    je .done
    call print_char
    jmp .loop
.done:
    ret
print_char:
    int 0x10
    ret

error_msg:
    db 'failed to load message', 0

times 510-($-$$) db 0
dw 0xAA55
buffer: