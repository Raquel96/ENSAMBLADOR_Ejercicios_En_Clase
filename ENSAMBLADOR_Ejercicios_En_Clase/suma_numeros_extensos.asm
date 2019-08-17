;UNIVERSIDAD NACIONAL DE LOJA
;Nombre: Raquel Teresa Espinosa Hurtado
;Ciclo: Sexto "B"

section .data
	n1 dd 10, "Ingrese el numero 1: ", 10
	len1 EQU $ -n1
	n2 dd 10, "Ingrese el numero 2: ", 10
	len2 EQU $ -n2
	resultado dd 10, "La suma es: ", 10, "	", 10
	len3 EQU $ -resultado
	
section .bss
	a resd 1
	b resd 1
	suma resb 1 
	
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
	mov edx, 3
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, n2
	mov edx, len2
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, b
	mov edx, 3
	int 80H
	
	mov al, [a+0]
	mov bl, [b+0]
	sub al, '0'
	sub bl, '0' 
	add al, bl 
	add dword [suma+4], 10
	add al, '0' 
	mov [suma], al
	
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

	mov al, [a+1]
	mov bl, [b+1]
	sub al, '0'
	sub bl, '0' 
	add al, bl 
	add dword [suma+4], 10
	add al, '0' 
	mov [suma], al
	
	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 1
	int 80H

	mov eax, 1
	int 80H
