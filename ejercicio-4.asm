section .data
    vector1 dd 1.0, 2.0, 3.0, 4.0, 5.0 ; Vector de números en punto flotante
    vector2 dd 2.0, 1.0, 2.0, 1.0, 2.0 ; Vector de números en punto flotante
    resultado dd 0.0                   ; Almacenar el resultado de la suma
    len equ 5                          ; Longitud del vector

section .text
global main
main:
    mov ebp, esp; for correct debugging
    
    lea esi, [vector1]                 ; ESI = dirección del vector1
    lea edi, [vector2]                 ; EDI = dirección del vector2
    mov ecx, len                       ; ECX = número de elementos en el vector
    fldz                               ; Inicializa ST(0) en 0.0 para acumulación de resultados
    
calc_product_esc:
    fld dword [esi]                    ; Carga el valor de vector1[i] en el registro ST(0)
    fld dword [edi]                    ; Carga el valor de vector2[i] en ST(0), desplaza el valor anterior a ST(1)
    fmul                               ; Multiplica ST(0) * ST(1) y almacena el resultado en ST(0)
    faddp st1, st0                     ; Suma ST(0) al acumulador en ST(1) y reduce el stack
    add esi, 4                         ; Avanza al siguiente elemento en vector1
    add edi, 4                         ; Avanza al siguiente elemento en vector2
    loop calc_product_esc              ; Repite hasta procesar todos los elementos
    
    fst dword [resultado]
    
    xor eax, eax
    ret