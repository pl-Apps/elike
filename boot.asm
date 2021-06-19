%include "shutdown.asm"

jmp _start

_start:

mov ah, 0x00
int 0x16

mov ah, 0x0e
int 0x10

cmp al, 'e'
je shutdown

jmp _start

jmp $
times 510-($-$$) db 0
db 0x55, 0xaa