section .data
    estrellas TIMES 7 db '*'
section .text
    global _start
    
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, estrellas
    mov edx, 7
    int 80H
    
    mov eax, 1
    mov ebx, 0
    int 80H
