%include "io.inc"

section .data
    vector dd 1.0, 2.0, 3.0, 4.0, 5.0  ; Vector de números en punto flotante SP
    n db 5                             ; Número de elementos en el vector
    resultado dd 0.0                   ; Almacenar el resultado de la suma

section .text
global main
main:
    mov ebp, esp; for correct debugging
    
    mov ecx, [n]                       ; Cargar el número de elementos del vector en ECX
    lea esi, [vector]                  ; ESI = dirección del vector

    fldz                               ; Iniciar ST(0) en 0.0
    fldz                               ; Iniciar ST(1) en 0.0 (para fadd)

sum_loop:
    fld dword [esi]                    ; Cargar el siguiente valor del vector en ST(0)
    fadd                               ; Sumar ST(0) con ST(1), dejando el resultado en ST(0)
    add esi, 4                         ; Avanzar al siguiente elemento del vector
    dec ecx                            ; Decrementar ECX
    jnz sum_loop                       ; Repetir mientras ECX > 0

    fst dword [resultado]              ; Guardar el resultado de la suma en "resultado"

    xor eax, eax
    ret