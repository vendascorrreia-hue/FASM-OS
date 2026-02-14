format binary
use16
org 0x7C00
    xor ax, ax 
    mov ds, ax 
    mov ss, ax
    mov es, ax 
    mov sp, 0x7C00
    mov ax, 0x13
    int 0x10
start:
    call input_start
    cmp al, 8
    je bbb
    cmp al, 13
    je eee
    cmp al, '&'
    je lll
    cmp al, '!'
    je calcular
    mov bl, 0x0A
    call print_start
    jmp start
bbb:
    mov al, 8
    call print_start
    mov al, ' '
    call print_start
    mov al, 8
    call print_start
    jmp start
eee:
    mov al, 0x0D
    call print_start
    mov al, 0x0A
    call print_start
    jmp start
lll:
    mov ax, 0x13
    int 0x10
    jmp start
calcular:
    mov ax, 0x0013
    int 0x10
    mov al, '{'
    call print_start
    call input_start
    call print_start
    sub al, '0'
    mov dl, 10
    mul dl 
    mov cl, al
    call input_start
    call print_start
    sub al, '0'
    add cl, al 
    mov al, '+'
    call print_start
    call input_start
    call print_start
    sub al, '0'
    mul dl 
    mov bl, al 
    call input_start
    call print_start
    sub al, '0'
    add bl, al 
    add cl, bl 
    mov al, '='
    call print_start
    movzx ax, cl
    mov bl, 10
    div bl 
    push ax
    mov ah, 0 
    div bl 
    mov dl, ah 
    add al, '0'
    call print_start
    mov al, dl 
    add al, '0'
    call print_start
    pop ax 
    mov al, ah 
    add al, '0'
    call print_start
    mov al, '}'
    call print_start
    jmp start
print_start:
    mov ah, 0x0E
    int 0x10
    ret
input_start:
    mov ah, 0x00
    int 0x16
    ret
    jmp $
times 510-($-$$) db 0
dw 0xAA55
