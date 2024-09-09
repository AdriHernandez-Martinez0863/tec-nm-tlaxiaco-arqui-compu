section .data
    input_msg db 'Introduce un numero: ', 0
    result_msg db 'El resultado es: ', 0
    newline db 0x0A, 0  ; Salto de línea

section .bss
    num1 resb 4  ; Espacio para el primer número
    num2 resb 4  ; Espacio para el segundo número
    sum resb 4   ; Espacio para la suma

section .text
    global _main
    extern _printf, _scanf, _ExitProcess

_main:
    ; Pedir el primer número
    push input_msg
    call _printf
    add esp, 4

    ; Leer el primer número (entero)
    lea eax, [num1]
    push eax
    push format_input
    call _scanf
    add esp, 8

    ; Pedir el segundo número
    push input_msg
    call _printf
    add esp, 4

    ; Leer el segundo número (entero)
    lea eax, [num2]
    push eax
    push format_input
    call _scanf
    add esp, 8

    ; Sumar los dos números
    mov eax, [num1]
    add eax, [num2]
    mov [sum], eax

    ; Mostrar el resultado
    push result_msg
    call _printf
    add esp, 4

    ; Mostrar el valor de la suma
    lea eax, [sum]
    push dword [eax]
    push format_output
    call _printf
    add esp, 8

    ; Saltar línea
    push newline
    call _printf
    add esp, 4

    ; Terminar el programa
    push 0
    call _ExitProcess

section .rodata
    format_input db '%d', 0  ; Leer números enteros
    format_output db '%d', 0  ; Mostrar números enteros
