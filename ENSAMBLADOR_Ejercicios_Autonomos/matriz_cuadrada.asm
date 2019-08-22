%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro

section .data
	texto db "----------MATRIZ----------", 10
	len equ $ -texto
	espacio db " ", 10
	len_espacio equ $ -espacio
	numero db "0"
	len_numero equ $ -numero
	
section .bss
	n resb 1

section .text
	global _start
_start:

	escribir texto, len
	
	mov ecx, 5
	mov ebx, 3
	
fila:
	push ebx
	;mov ecx, 5
	push 5
	escribir espacio, len_espacio
	pop ecx
	
columna:
	push ecx
	escribir numero, len_numero
	pop ecx
	loop columna
	
	pop ecx
	mov ebx, ecx
	;~ push ebx
	dec ebx
	
	loop fila

salir:
	mov eax, 1
	int 80H
