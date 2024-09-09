section .data
    input_msg db 'Introduce un numero: ', 0
    prime_msg db 'El numero es primo.', 0
    not_prime_msg db 'El numero no es primo.', 0
    newline db 0x0A, 0  ; Salto de línea

section .bss
    num resd 1      ; Reservar espacio para el número
    i resd 1        ; Variable de iteración para comprobar divisores
    remainder resd 1; Para almacenar el resto de la división

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

    ; Verificar si el número es menor o igual a 1
    mov eax, [num]
    cmp eax, 2
    jl no_es_primo

    ; Inicializar i a 2
    mov dword [i], 2

check_prime:
    ; Comparar si i*i > num
    mov eax, [i]
    imul eax, eax
    cmp eax, [num]
    jg es_primo

    ; Calcular num % i
    mov eax, [num]
    mov ebx, [i]
    xor edx, edx       ; Limpiar edx para la división
    div ebx            ; eax / ebx, el resto queda en edx
    cmp edx, 0
    je no_es_primo     ; Si el resto es 0, no es primo

    ; Incrementar i
    inc dword [i]
    jmp check_prime

es_primo:
    ; Mostrar el mensaje de que es primo
    push prime_msg
    call _printf
    add esp, 4
    jmp fin

no_es_primo:
    ; Mostrar el mensaje de que no es primo
    push not_prime_msg
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
