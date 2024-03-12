section .bss
    buffer resb 1

section .text
    global _start

_start:
    
    mov eax, 3           
    mov ebx, 0           
    mov ecx, buffer      
    mov edx, 1          
    int 0x80             

    
    cmp byte [buffer], 'A'   ; Compare with 'A'
    jl not_uppercase         ; Jump if less than 'A'
    cmp byte [buffer], 'Z'   ; Compare with 'Z'
    jg not_uppercase         ; Jump if greater than 'Z'

    ; Convert the character to lowercase
    add byte [buffer], 32    ; Add 32 to make it lowercase

not_uppercase:
    ; Display the entered character
    mov eax, 4           
    mov ebx, 1          
    mov ecx, buffer      
    mov edx, 1           
    int 0x80             

    ; Exit the program
    mov eax, 1           ; sys_exit system call number
    xor ebx, ebx         ; exit code 0
    int 0x80             ; invoke system call
