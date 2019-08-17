section .data
	n1 db "Ingrese el numero 1: ", 0xa
	len1 EQU $ -n1
	n2 db 10, "Ingrese el numero 2: ", 0xa
	len2 EQU $ -n2
	resultado db "La suma es: ", 10
	len3 EQU $ -resultado
	
section .bss
	a resb 1
	b resb 1
	suma resb 1 ; 1 --> se define un espacio sin valor inicial
	
section .text
	global _start
	
_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, n1
	mov edx, len1
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, a
	mov edx, 2
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, n2
	mov edx, len2
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, b
	mov edx, 2
	int 80H
	
	mov ax, [a]
	mov bx, [b]
	sub ax, '0'
	sub bx, '0' ; Convierte la cadena a numero
	
	add ax, bx 
	add ax, '0' ; Convierte el numero a cadena
	mov [suma], ax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, len3
	int 80H
	
	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 1
	int 80H

	mov eax, 1
	int 80H
