section .data
    input_msg db 'Introduce un numero: ', 0
    pos_msg db 'El numero es positivo.', 0
    neg_msg db 'El numero es negativo.', 0
    zero_msg db 'El numero es cero.', 0
    newline db 0x0A, 0  ; Salto de línea

section .bss
    num resd 1  ; Reservar espacio para el número

section .text
    global _main
    extern _printf, _scanf, _ExitProcess

_main:
    ; Pedir el número al usuario
    push input_msg
    call _printf
    add esp, 4

    ; Leer el número ingresado
    lea eax, [num]
    push eax
    push format_input
    call _scanf
    add esp, 8

    ; Comparar el número
    mov eax, [num]    ; Mover el número a eax
    cmp eax, 0        ; Comparar con 0
    je es_cero        ; Si es igual a 0, saltar a es_cero
    jl es_negativo    ; Si es menor que 0, saltar a es_negativo

    ; Si es positivo, mostrar el mensaje correspondiente
    push pos_msg
    call _printf
    add esp, 4
    jmp fin

es_negativo:
    ; Si es negativo, mostrar el mensaje correspondiente
    push neg_msg
    call _printf
    add esp, 4
    jmp fin

es_cero:
    ; Si es cero, mostrar el mensaje correspondiente
    push zero_msg
    call _printf
    add esp, 4

fin:
    ; Saltar línea
    push newline
    call _printf
    add esp, 4

    ; Terminar el programa
    push 0
    call _ExitProcess

section .rodata
    format_input db '%d', 0  ; Formato para leer enteros
