section .data
	lado dd "Ingrese el lado del cuadrado: ", 0xa
	len_lado EQU $ -lado
	
	resultado dd "El àrea del cuadrado es: ", 10
	len_rta EQU $ -resultado
	
section .bss
	l resd 1
	multi resd 1 
	
section .text
	global _start
	
_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, lado
	mov edx, len_lado
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, l
	mov edx, 3
	int 80H
	
	mov al, [l+0]
	mov bl, [l+0]
	sub al, '0'
	sub bl, '0' 
	
	mul bl 
	;mul dword [multi+5], 10
	add al, '0' 
	mov [multi], al
	
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, len_rta
	int 80H
	
	mov eax, 4
	mov ebx, 1
	mov ecx, multi
	mov edx, 1
	int 80H

	mov eax, 1
	int 80H
