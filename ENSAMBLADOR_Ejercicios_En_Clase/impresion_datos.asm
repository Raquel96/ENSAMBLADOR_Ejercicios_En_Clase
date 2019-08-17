section .data
	asignatura db 'Lenguaje Ensamblador',0xa
	ciclo db 'Sexto Ciclo B',0xa
	nombre db 'Raquel Espinosa', 0xa
	
	len1 EQU $-asignatura 
	len2 EQU $-ciclo 
	len3 EQU $-nombre 
	
section .text
	global _start

_start:

	;Primera impresión
	mov eax, 04 	;ax define el tipo de operación (4 = write)
	mov ebx, 01	;bx define la unidad estándar --> caracteres
	mov ecx, asignatura	;en cx se almacena la referencia de la constante saludo para imprimir
	mov edx, len1	;dx define el número de caracteres que se va a imprimir
	int 80H	;interrupción --> verifica el ultimo valor de eax, ebx, ecx, edx

	mov eax, 1	; ax define el tipo de operacion (1=salir --> exit)
	mov ebx, 0
	int 80H

	;Segunda impresión
	mov eax, 04 	;ax define el tipo de operación (4 = write)
	mov ebx, 01	;bx define la unidad estándar --> caracteres
	mov ecx, ciclo	;en cx se almacena la referencia de la constante saludo para imprimir
	mov edx, len2	;dx define el número de caracteres que se va a imprimir
	int 80H	;interrupción --> verifica el ultimo valor de eax, ebx, ecx, edx

	mov eax, 1	; ax define el tipo de operacion (1=salir --> exit)
	mov ebx, 0
	int 80H

	;Tercera impresión
	mov eax, 04 	;ax define el tipo de operación (4 = write)
	mov ebx, 01	;bx define la unidad estándar --> caracteres
	mov ecx, nombre	;en cx se almacena la referencia de la constante saludo para imprimir
	mov edx, len3	;dx define el número de caracteres que se va a imprimir
	int 80H	;interrupción --> verifica el ultimo valor de eax, ebx, ecx, edx

	mov eax, 1	; ax define el tipo de operacion (1=salir --> exit)
	mov ebx, 0
	int 80H
