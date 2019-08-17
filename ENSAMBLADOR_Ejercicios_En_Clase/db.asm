section .data
	mensaje db 'Hola clase', 10
	len EQU $-mensaje

section .text
	global _start
	
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, len
	int 80H

	mov [mensaje], dword 'mala' ; mov [mensaje + 0], dword 'mala'
	
	mov eax, 1	; ax define el tipo de operacion (1=salir --> exit)
	mov ebx, 0
	int 80H
	
	;mov [mensaje+5], word 'niña'
	
