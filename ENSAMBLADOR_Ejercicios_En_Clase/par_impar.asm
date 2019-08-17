;UNIVERSIDAD NACIONAL DE LOJA
;Nombre: Raquel Teresa Espinosa Hurtado
;Ciclo: Sexto "B"

section .data
	n1 db "Ingrese el numero 1: "
	len1 EQU $ -n1
	
	n_par db 10, "El numero ingresado es Par"
	len_par EQU $ -n_par
	
	n_impar db 10, "El numero ingresado es Impar"
	len_impar EQU $ -n_impar
	
	
section .bss
	a resb 1
	
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

	mov al, [a]
	sub al, '0'
	and al, 01
		
		jz par
		jmp impar
	
	par:
		mov eax, 4
		mov ebx, 1
		mov ecx, n_par
		mov edx, len_par
		int 80H
		jmp salir
	
	impar:
		mov eax, 4
		mov ebx, 1
		mov ecx, n_impar
		mov edx, len_impar
		int 80H
		jmp salir
		
	salir:	
		mov eax, 1
		int 80H

