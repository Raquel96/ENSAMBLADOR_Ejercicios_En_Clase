;Pedir un numero par, si es impar entonces salir
section .data
	numero db 10, "Ingrese un numero par"
	len EQU $ -numero
	numero_impar db 10, "Numero Impar"
	len1 EQU $ -numero_impar
	
section .bss
	n resb 1
	
section .text
	global _start
	
_start:

verificar:
	mov al, [n]
	sub al, '0'
	and al, 01
		
		jz par
		jmp impar
	
impar:
		mov eax, 4
		mov ebx, 1
		mov ecx, numero_impar
		mov edx, len1
		int 80H
		jmp salir
	
par:
	
	mov eax, 4
	mov ebx, 1
	mov ecx, numero
	mov edx, len
	int 80H
	
	mov eax, 3
	mov ebx, 2
	mov ecx, n
	mov edx, 2
	int 80H
	jmp verificar
	
salir:
	mov eax, 1
	int 80H
