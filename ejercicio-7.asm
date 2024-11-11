%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    pxor mm0, mm0
    
    mov eax, 1
    xor ebx, ebx
    int 0x80