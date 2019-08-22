section .data
	numero db 10,"Ingrese un numero"
	len EQU $ -numero
	espacio db 10, " "

section .bss
	n1 resb 1
	n resb 1

section .text
	global _start
	
_start:
	mov eax, 4 
    mov ebx, 1
    mov ecx, numero
    mov edx, len
    int 80H
        
    mov eax, 3
    mov ebx, 2
    mov ecx, n1
    mov edx, 10
    int 80H

    mov al,[n1]
    sub al,'0'
    push eax
    pop ecx
    mov ebx, 1

l1:

	push ecx 
	push ebx
	call imprimir_enter

	pop ecx
	mov ebx, ecx
	push ebx
	
l2:
	push ecx
	call imprimir_numero
	pop ecx
	loop l2
	pop ebx
	pop ecx
	inc ebx
	loop l1
	jmp salir

imprimir_enter:
	mov eax,4
	mov ebx,1
	mov ecx,espacio
	mov edx,1
	int 80h
	ret

imprimir_numero:

	mov eax, ecx
    add eax,'0'
    mov [n],eax

	mov eax,4
	mov ebx,1
	mov ecx,n
	mov edx,1
	int 80h
	ret
	
salir:
	
	mov eax,1
	int 80h
