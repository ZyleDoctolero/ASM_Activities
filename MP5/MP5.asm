section .data
    charter db 'a'
    
    newline db 10

section .text
    global _start

_start:
    mov eax, 3          ; sys_read syscall
    mov ebx, 0          ; stdin
    mov ecx, charter    ; buffer to read
    mov edx, 1          ; number of bytes to read
    int 0x80            ; call kernel

    cmp byte [charter], 'a'
    jl not_lower
    cmp byte [charter], 'z'
    jg not_lower

    sub byte [charter], 0x20    ; convert lowercase to uppercase
    jmp print_char

not_lower:
    cmp byte [charter], 'A'
    jl print_char
    cmp byte [charter], 'Z'
    jg print_char

    add byte [charter], 0x20    ; convert uppercase to lowercase 

print_char:
    mov eax, 4          ; sys_write syscall
    mov ebx, 1          ; stdout
    mov ecx, charter    ; buffer to write
    mov edx, 1          ; number of bytes to write
    int 0x80            ; call kernel

    ; Print newline character
    mov eax, 4          ; sys_write syscall
    mov ebx, 1          ; stdout
    mov ecx, newline    ; buffer to write
    mov edx, 1          ; number of bytes to write
    int 0x80            ; call kernel

    ; Exit program
    mov eax, 1          ; sys_exit syscall
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel
