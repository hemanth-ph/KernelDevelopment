ORG 0
BITS 16

_start:
    jmp short start
    nop
times 33 db 0
start:
    cli;
    mov ax,0x7c0
    mov ds,ax
    mov es,ax
    mov ax,0
    mov ss,ax
    mov sp,0x7c00

    sti;

    ; AH = 02h
    ; AL = number of sectors to read (must be nonzero)
    ; CH = low eight bits of cylinder number
    ; CL = sector number 1-63 (bits 0-5)
    ; high two bits of cylinder (bits 6-7, hard disk only)
    ; DH = head number
    ; DL = drive number (bit 7 set for hard disk)
    ; ES:BX -> data buffer

    ; Return:
    ; CF set on error
    ; if AH = 11h (corrected ECC error), AL = burst length
    ; CF clear if successful
    ; AH = status (see #00234)
    ; AL = number of sectors transferred (only valid if CF set for some
    ; BIOSes)

    ; TO read a disk file
    mov AH,0x02
    mov AL,1
    mov CH,1
    mov CL,1
    int 0x13
    jmp $
print:
    mov bx,0
.loop:
    lodsb
    cmp al,0
    je .done
    call print_char
    jmp .loop
.done:
    ret 
print_char:
    mov ah,0eh
    int 0x10
    ret 
error_message:
    db 'loading failed',0
