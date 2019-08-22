section .data
	asterisco db "*"
	espacio db " ",10
	n db "Ingrese un valor: "
	len EQU $ -n

section .bss
	numero resb 1

section .text
	global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, n
	mov edx, len
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, numero
	mov edx, 2
	int 80H

	mov al, [numero]
	sub al, '0'
	
	mov ecx, eax
	push ecx

	jmp columna


fila:
	pop ecx
	cmp ecx, 0
		jz  columna
		push ecx
		jmp impr

columna:
	mov eax, 4
	mov ebx, 1
	mov ecx, espacio
	mov edx, 2
	int 80H

	pop ecx
	cmp ecx, 0
		jz  salir
	dec ecx
	push ecx
	mov al, [numero]
	sub eax, '0'
	
	mov ecx, eax
	push ecx

	jmp fila

impr:
	mov eax, 4
	mov ebx, 1
	mov ecx, asterisco
	mov edx, 1
	int 80H
	pop ecx
	dec ecx
	push ecx

	jmp fila

salir:
	mov eax, 1
	int 80H
