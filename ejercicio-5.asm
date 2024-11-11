section .data
    vector1 dw 0, 1, 2, 3        ; Vector de cuatro enteros de 16 bits
    vector2 dw 4, 5, 6, 7        ; Otro vector de cuatro enteros de 16 bits

section .text
global main
main:
    mov ebp, esp

    movq mm0, [vector1]          ; Carga cuatro enteros de 16 bits de vector1 en mm0
    movq mm1, [vector2]          ; Carga cuatro enteros de 16 bits de vector2 en mm1

    pmullw mm0, mm1              ; Multiplica los enteros de 16 bits en paralelo en mm0 y mm1

    movq mm5, mm0                ; Almacena el resultado en el registro mm5

    emms                         ; Finaliza el uso de MMX para evitar conflictos con la FPU

    xor eax, eax
    ret
