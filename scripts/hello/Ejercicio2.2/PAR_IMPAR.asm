section .data
    input_msg db 'Introduce un numero: ', 0
    even_msg db 'El numero es par.', 0
    odd_msg db 'El numero es impar.', 0
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

    ; Leer el número
    lea eax, [num]
    push eax
    push format_input
    call _scanf
    add esp, 8

    ; Verificar si es par o impar
    mov eax, [num]    ; Mover el número a eax
    and eax, 1        ; Verificar el bit menos significativo
    cmp eax, 0        ; Si el bit es 0, el número es par
    je es_par

    ; Si es impar, mostrar el mensaje correspondiente
    push odd_msg
    call _printf
    add esp, 4
    jmp fin

es_par:
    ; Si es par, mostrar el mensaje correspondiente
    push even_msg
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
