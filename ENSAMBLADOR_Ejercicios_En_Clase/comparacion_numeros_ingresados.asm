;UNIVERSIDAD NACIONAL DE LOJA
;Nombre: Raquel Teresa Espinosa Hurtado
;Ciclo: Sexto "B"

section .data
	n1 db "Ingrese el numero 1: "
	len1 EQU $ -n1
	n2 db 10, "Ingrese el numero 2: "
	len2 EQU $ -n2
	
	son_iguales db 10, "Los numeros son iguales"
	len_i EQU $ -son_iguales
	
	mayor_n db 10, "El numero 1 es mayor"
	len_mayor EQU $ -mayor_n
	
	menor_n db 10, "El numero 1 es menor"
	len_menor EQU $ -menor_n	
	
	
section .bss
	a resb 1
	b resb 1
	
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
	
	mov al, [a]
	mov bl, [b]
	sub al, '0'
	sub bl, '0'
	
	cmp al, bl
	jz igual
	
	cmp al, bl
	jg mayor
	jmp menor
	
	
	mayor:
		mov eax, 4
		mov ebx, 1
		mov ecx, mayor_n
		mov edx, len_mayor
		int 80H
		jmp salir
	
	menor:
		mov eax, 4
		mov ebx, 1
		mov ecx, menor_n
		mov edx, len_menor
		int 80H
		jmp salir
	
	
	igual:
		mov eax, 4
		mov ebx, 1
		mov ecx, son_iguales
		mov edx, len_i
		int 80H
		jmp salir
		
	salir:	
		mov eax, 1
		int 80H

