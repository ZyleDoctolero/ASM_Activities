section .data
    newline db 10

section .text
    global _start

_start:
    ; Print ASCII art
    mov   eax, 4      ; sys_write syscall
    mov   ebx, 1      ; stdout fileno

    ; ASCII art pattern
    mov   ecx, art_pattern
    mov   edx, art_size
    int   80h         ; sys_write(1, art_pattern, art_size)

    ; Print newline
    mov   eax, 4
    mov   ebx, 1
    mov   ecx, newline
    mov   edx, 1
    int   80h

    ; System exit
    mov eax, 1
    mov ebx, 0
    int 80h

section .data
    art_pattern db '  ***  ', 10
                db ' ***** ', 10
                db '**   **', 10
                db ' ***** ', 10
                db '  ***  ', 0
    art_size equ $ - art_pattern

