%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro
%macro leer 2
	mov eax, 3
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro

section .data
	texto db "MATRIZ 3X5", 10
	len equ $ -texto
	espacio db " ", 10
	len_espacio equ $ -espacio
	numero db "Ingrese un numero", 10
	len_numero equ $ -numero
	
section .bss
	n resb 1

section .text
	global _start

_start:
	escribir texto, len
	escribir numero, len_numero 
	leer n, 1
	mov eax,[n]
	mov ecx, 5
	mov ebx, 3
	
fila:
	push ebx
	;~ mov eax, 5
	push 5
	escribir espacio, len_espacio
	pop ecx

columna:
	push ecx ;Rescato el valor de ecx -->5
	escribir n, 1 
	;mov ecx, n
	pop ecx ; rescato el 5
	
	loop columna; lo decrementa al ecx
	;~ 5 primeros
	
	pop ecx; rescato el valor de 3
	mov ebx, ecx
	dec ebx; se decrementa a 2

	loop fila
  
	
salir:
	mov eax, 1
	int 80H
