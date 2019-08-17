section .data
	numero db 10, "numero x"
	len EQU $ -numero
	
section .text
	global _start
	
_start:
	mov ecx, 9
	
l1:
	push ecx
	add ecx, '0'
	mov [numero+8], dword ecx
	
	mov eax, 4
	mov ebx, 1
	mov ecx, numero
	mov edx, len
	int 80H
	pop ecx
	loop l1
	
salir:
	mov eax, 1
	int 80H
