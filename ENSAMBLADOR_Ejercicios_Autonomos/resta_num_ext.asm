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
	msj db "La resta es: ", 10
	len EQU $ -msj
	resta db '   '
	
section .text
	global _start
	
_start:

	mov ecx, 3 ;Número de operacionde de resta
	mov esi, 2 ;Posición del dígitp en cada cadena n1, n2
	clc ;instruccion, CF = 0
	
ciclo_suma:
	mov al, [n1 + esi]
	sbb al, [n2 + esi] ;suma el acarreo a la resta en binario
	aas  ;ajusta la operación binaria al sistema decimal
	pushf  ;Guarda en pila todos los valores de las banderas
	;~ add 48
	;~ or al, 30h --> add 48, add '0'
	or al, 30h
	popf
	
	mov [resta + esi], al 
	dec esi
	
	loop ciclo_suma
	escribir msj, len
	escribir resta, 3

salir:
	mov eax, 1
	int 80H


