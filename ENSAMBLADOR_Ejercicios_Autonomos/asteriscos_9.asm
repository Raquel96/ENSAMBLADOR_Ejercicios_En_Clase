section .data
	aste db "*"
	salto db "",10
	leng_salto equ $ -salto
	ast db "Ingrese un valor "
	contador db 9
	len_ast equ $ -ast
	

section .bss
	dato_b resb 10
	
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


