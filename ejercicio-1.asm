%include "io.inc"

section .data
valor_a dq 0.0
valor_b dq 1.0
valor_c dq -1.0E10
valor_d dq 6.02E23
valor_e dq 3.4159265358979323846

formato db 'Todo cargado!',0xa
lenFormato equ $ - formato

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    fld qword [valor_a]
    fld qword [valor_b]
    fld qword [valor_c]
    fld qword [valor_d]
    fld qword [valor_e]

    call imprimir
    
    mov eax, 1
    xor ebx, ebx
    int 0x80
    
imprimir:
    mov eax, 4
    mov ebx, 1
    mov ecx, formato
    mov edx, lenFormato
    int 0x80
    ret