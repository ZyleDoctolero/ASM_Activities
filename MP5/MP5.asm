section .data
    charter db 'a'
    
    newline db 10

section .text
    global _start

_start:
    mov eax, 3         
    mov ebx, 0         
    mov ecx, charter   
    mov edx, 1          
    int 0x80           

    cmp byte [charter], 'a'
    jl not_lower
    cmp byte [charter], 'z'
    jg not_lower

    sub byte [charter], 0x20    
    jmp print_char

not_lower:
    cmp byte [charter], 'A'
    jl print_char
    cmp byte [charter], 'Z'
    jg print_char

    add byte [charter], 0x20     

print_char:
    mov eax, 4          
    mov ebx, 1         
    mov ecx, charter    
    mov edx, 1         
    int 0x80           

    ; Print newline character
    mov eax, 4          
    mov ebx, 1         
    mov ecx, newline   
    mov edx, 1        
    int 0x80          

    ; Exit program
    mov eax, 1          
    xor ebx, ebx        
    int 0x80          
