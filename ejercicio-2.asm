%include "io.inc"
extern printf

section .data
    valor_a dq 0.0
    valor_b dq 1.0
    valor_c dq -1.0E10
    valor_d dq 6.02E23
    valor_e dq 3.4159265358979323846
    formato db "La suma es: %f", 10, 13, 0

section .bss
    resultado resq 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    fld qword [valor_a]
    fld qword [valor_b]
    fadd
    fld qword [valor_c]
    fadd
    fld qword [valor_d]
    fadd
    fld qword [valor_e]
    fadd

    call imprimir

    mov eax, 1
    xor ebx, ebx
    int 0x80

imprimir:
    fstp qword [resultado]    
    push dword [resultado+4]  
    push dword [resultado]   
    push formato             
    call printf              
    add esp, 16              
    ret
