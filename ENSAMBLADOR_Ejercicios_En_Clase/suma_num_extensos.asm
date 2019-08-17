%macro escribir 2
	mov eax, 4
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro

section .data
	n1 db "518"
	n2 db "197"
	msj db "La suma es: ", 10
	len EQU $ -msj
	suma db '   '
	
section .text
	global _start
	
_start:

	mov ecx, 3
	mov esi, 2
	clc ;instruccion, CF = 0
	
ciclo_suma:
	mov al, [n1 + esi]
	adc al, [n2 + esi]
	aaa  ;ajuste estado original del carry
	pushf  ;Guarda en pila todos los valores de las banderas
	;~ add 48
	;~ or al, 30h --> add 48, add '0'
	or al, 30h
	popf
	mov [suma + esi], al
	dec esi
	
	loop ciclo_suma
	escribir msj, len
	escribir suma, 3

salir:
	mov eax, 1
	int 80H

