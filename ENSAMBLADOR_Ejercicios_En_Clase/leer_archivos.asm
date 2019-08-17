%macro escribir 2
	mov eax, 4
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro


section .data
	msj db "Leer el archivo", 10
	len equ $ -msj
	path db "/home/raquel/Ensamblador/archivo.txt", 0
;~ pwd -->ruta del archivo

section .bss
	texto resb 30x
	idarchivo resd 1

section .texto	
	global _start
	
_start:
;~****************apertura del archivo****************
	mov eax, 5   ; servicio para abrir el archivo
	mov ebx, path  ; direccion del archivo
	mov ecx, 0  ;modo de acceso, read only=0
	mov edx, 0  ; permisos del archivo
	int 80H
	
	;~ test == and --> el test solo modifica el estado de las banderas y define un 0
	test eax, eax
	jz salir
	
	;~ **********archivo sin excepciones************
	mov dword [idarchivo], eax ; respaldo el id del archivo
	escribir msj, len
	
	mov eax, 3
	mov ebx, [idarchivo] ;entrada estandar
	mov ecx, texto
	mov edx, 25
	int 80H
	
	escribir texto, 25
	
	
;~****************cierre del archivo****************
	mov eax, 6  		  ; servicio para abrir el archivo
	mov ebx, [idarchivo]  ; direccion del archivo
	mov ecx, 0			  ;modo de acceso, read only=0
	mov edx, 0  		  ; permisos del archivo
	int 80H
	
salir:
	mov eax, 1
	int 80H
