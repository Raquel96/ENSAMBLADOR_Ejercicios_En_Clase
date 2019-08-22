%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro

%macro leer 2 
	mov eax,3
	mov ebx,2
	mov ecx,%1   
	mov edx,%2   
	int 80h
%endmacro

section .data
	texto db "MATRIZ COLUMNA IGUAL", 10
	len equ $ -texto
	espacio db " ", 10
	len_espacio equ $ -espacio
	numero db "Ingrese el numero 1", 10
	len_numero equ $- numero
	
section .bss
	n resb 1

section .text
	global _start

_start:
	escribir texto, len
	escribir numero, len_numero 
	leer n,1
	mov ecx, 5
	mov ebx, 3
	
fila:
	push ebx
	push 5
	escribir espacio, len_espacio
	pop ecx

columna:
	
	push ecx 
	escribir n, 1 
	
	mov eax, [n]
	inc eax
	mov [n], eax
	pop ecx
	loop columna
	
	mov eax, 1
	add eax, '0' 
	mov [n], eax
	
	pop ecx
	mov ebx, ecx
	dec ebx
	
	loop fila
	
salir:
	mov eax, 1
	int 80H

