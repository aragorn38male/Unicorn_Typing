;unicorn.asm
org 0x7c00
;org 0x0100

mov ax, 0x0002
int 0x10
mov ax, 0xb800
mov ds, ax
mov es, ax
cld
xor di, di

start:
mov ax, 0x00	;keybd
int 0x16	;read
cmp al, 0x1b	;ESC ?
je exit

cmp al, 0x20	; SPACE ?
je cont 

inc cl
cont:

mov ah, 0x80
and cl, 0x0f
cmp cl, 0
jne col

mov cl, 1

col:

add ah, cl
stosw

jmp start

exit:
;int 0x20
jmp $
times 510-($-$$) db 0
db 0x55, 0xaa
