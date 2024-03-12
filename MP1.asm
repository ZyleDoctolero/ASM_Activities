section .data
    doctolero db 'D', 10, 'O', 10, 'C', 10, 'T', 10, 'O', 10, 'L', 10, 'E', 10, 'R', 10, 'O', 10 ; Each letter followed by two newlines
    zyle db 'Z', 10, 'Y', 10, 'L', 10, 'E', 10,  ; Each letter followed by two newlines

section .bss
    buffer resb 1

section .text
    global _start

_start:

    ; Display the entered character
    mov eax, 4           ; sys_write system call number corrected
    mov ebx, 1           ; file descriptor: stdout
    mov ecx, buffer      ; pointer to the entered character
    mov edx, 1           ; length of the character
    int 0x80             ; invoke system call

    ; Loop to display "ZYLE" with blank lines between letters
    mov eax, 4           ; sys_write system call number
    mov ebx, 1           ; file descriptor: stdout
    mov ecx, zyle        ; pointer to the "ZYLE" string
    mov edx, 8           ; length of the "Z\n\nY\n\nL\n\nE\n\n" string
    int 0x80             ; invoke system call

    ; Loop to display "DOCTOLERO" with blank lines between letters
    mov eax, 4           ; sys_write system call number
    mov ebx, 1           ; file descriptor: stdout
    mov ecx, doctolero   ; pointer to the "DOCTOLERO" string
    mov edx, 20          ; length of the "D\n\nO\n\nC\n\nT\n\nO\n\nL\n\nE\n\nR\n\nO\n\n" string
    int 0x80             ; invoke system call

    ; Exit the program
    mov eax, 1           ; sys_exit system call number
    xor ebx, ebx         ; exit code 0
    int 0x80             ; invoke system call
