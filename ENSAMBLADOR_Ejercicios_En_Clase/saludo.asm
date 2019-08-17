section .data
	saludo db 'Hola ensamblador',0xa
	len EQU $-saludo ;directiva que define una constante --> hace lo mismo que el lenght o size
	
section .text
	global _start

_start:

	mov eax, 04 	;ax define el tipo de operación (4 = write)
	mov ebx, 01	;bx define la unidad estándar --> caracteres
	mov ecx, saludo	;en cx se almacena la referencia de la constante saludo para imprimir
	mov edx, len	;dx define el número de caracteres que se va a imprimir
	int 80H	;interrupción --> verifica el ultimo valor de eax, ebx, ecx, edx
	
	;Por cada operacion de escritura se debe hacer un ret

	mov eax, 1	; ax define el tipo de operacion (1=salir --> exit)
	mov ebx, 0
	int 80H
