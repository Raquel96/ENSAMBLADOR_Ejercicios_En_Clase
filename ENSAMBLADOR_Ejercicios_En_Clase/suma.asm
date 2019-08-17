section .data
	msj db "La suma es: ", 10
	len EQU $ -msj	
	
section .bss
	suma resb 10
	
section .text
	global _start
	
_start:
	mov eax, 2
	mov ebx, 5
	add ax, bx
	add ax, '0' ; Convierte el numero a cadena
	
	mov [suma], ax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msj
	mov edx, len
	int 80H
	
	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 1
	int 80H
	
	mov eax, 1
	int 80H
	
