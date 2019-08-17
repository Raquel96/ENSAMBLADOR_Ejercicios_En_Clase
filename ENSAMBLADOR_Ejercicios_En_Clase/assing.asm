section .data
	;% assing _identificador valor
	%assign signos '*'
	mensaje db 'Hola clase', signos, signos, signos, 10
	len EQU $-mensaje

section .text
	global _start
	
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, len
	int 80H

	mov eax, 1	
	mov ebx, 0
	int 80H
	

	
