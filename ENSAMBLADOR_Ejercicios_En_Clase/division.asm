section .data
	n1 db "Ingrese el numero 1: "
	len1 EQU $ -n1
	n2 db 10, "Ingrese el numero 2: "
	len2 EQU $ -n2
	resultado db 10, "El resultado de la division es: "
	len3 EQU $ -resultado
	residuo db 10,10, "Residuo: "
	len_res EQU $ -residuo
	
section .bss
	a resb 1
	b resb 1
	division resb 1 
	resi resb 1
	
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
	
	;Se realiza la división
	mov al, [a]
	mov bl, [b]
	sub ax, '0'
	sub bx, '0' ; Convierte la cadena a numero
	
	div bl
	add al, '0' ; Convierte el numero a cadena
	mov [division], ax
	
	add ah, '0'
	mov [resi], ah
	
	
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, len3
	int 80H
	
	mov eax, 4
	mov ebx, 1
	mov ecx, division
	mov edx, 1
	int 80H
	
	mov eax, 4
	mov ebx, 1
	mov ecx, residuo
	mov edx, len_res
	int 80H
	
	mov eax, 4
	mov ebx, 1
	mov ecx, resi
	mov edx, 1
	int 80H
	

	mov eax, 1;salir
	int 80H

