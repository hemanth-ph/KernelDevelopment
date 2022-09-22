ORG 0
BITS 16
start:
    mov ax,0X7C0 ;we cannot directly load into seg regs. so we are using ax as via.
    mov ds,ax    ;instead of specifying at ORG, we are loading 0x7c0(seg. addr.) to DS
    mov si, message ; We are loading offset of msg to SI
    call print
    jmp $
print:
    mov bx,0
.loop:
    lodsb ;lodsb will use DS:SI combination
    cmp al, 0
    je .done
    call print_char
    jmp .loop
.done:
    ret

print_char:
    mov ah, 0eh
    int 0x10
    ret
message:
    db 'Hi hemanth!!', 0

times 510-($-$$) db 0
dw 0xAA55


; ORG 0x7c00
; BITS 16

; start:
;     mov si, message
;     call print
;     jmp $

; print:
;     mov bx, 0
; .loop:
;     lodsb
;     cmp al, 0
;     je .done
;     call print_char
;     jmp .loop
; .done:
;     ret

; print_char:
;     mov ah, 0eh
;     int 0x10
;     ret

; message: db 'Hello World!', 0

; times 510-($ - $$) db 0
; dw 0xAA55