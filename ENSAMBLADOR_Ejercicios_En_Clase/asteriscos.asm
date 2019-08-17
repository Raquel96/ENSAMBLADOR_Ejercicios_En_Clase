section .data
	aste db "*"
	
section .text
	global _start
			
_start:
	mov ecx, 9
	jmp principal

principal:
	cmp ecx, 0
	jz salir
	jmp imprimir

imprimir:
	dec ecx
	push ecx
	
	mov eax, 4
	mov ebx, 1
	mov ecx, aste
	mov edx, 1
	int 80H
	
	pop ecx
	
	jmp principal

salir:
	mov eax, 1
	int 80H

