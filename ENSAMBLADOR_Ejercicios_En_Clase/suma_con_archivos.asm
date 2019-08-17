;~ Nombre: Raquel Espinosa
;~ Ciclo: 6to B
;~ SUMA USANDO ARCHIVOS
%macro escribir 2
	mov eax, 4
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro

section .data
	msj db "Leer Archivos", 10
	len equ $ -msj
	path1 db "/home/raquel/Ensamblador/Trabajo_Clase/a1.txt", 0
	path2 db "/home/raquel/Ensamblador/Trabajo_Clase/a2.txt", 0
	suma_num db "La suma es: ", 10
	len_suma equ $ -suma_num
	suma db '    '
	espacio db "", 10
	len_esp equ $ -espacio

section .bss
	texto1 resb 30
	texto2 resb 30
	idarchivo1 resd 1
	idarchivo2 resd 1

section .texto	
	global _start
	
_start:
	
;~****************apertura del archivo 1****************
	mov eax, 5   
	mov ebx, path1  
	mov ecx, 0  
	mov edx, 0  
	int 80H
	
	test eax, eax
	jz salir
	
	mov dword [idarchivo1], eax 
	escribir msj, len
	
	mov eax, 3
	mov ebx, [idarchivo1] 
	mov ecx, texto1
	mov edx, 25
	int 80H
	
	escribir texto1, 25
	
	;~ Cierre del archivo 1
	mov eax, 6  		  
	mov ebx, [idarchivo1] 
	mov ecx, 0			  
	mov edx, 0  		 
	int 80H
	
;~****************apertura del archivo 2****************
	mov eax, 5   
	mov ebx, path2  
	mov ecx, 0  
	mov edx, 0  
	int 80H
	
	test eax, eax
	jz salir
	
	mov dword [idarchivo2], eax 
	escribir msj, len
	
	mov eax, 3
	mov ebx, [idarchivo2] 
	mov ecx, texto2
	mov edx, 25
	int 80H
	
	escribir texto2, 25
	
	;~ cierre del archivo 2
	mov eax, 6  		  
	mov ebx, [idarchivo2]  
	mov ecx, 0			  
	mov edx, 0  		  
	int 80H
	
sum_num:
	mov ecx, 3
	mov esi, 2
	clc 
	
suma_numeros:
	mov al, [texto1 + esi]
	adc al, [texto2 + esi]
	aaa  
	pushf  
	
	or al, 30h
	popf
	mov [suma + esi], al
	dec esi
	
	loop suma_numeros
	escribir suma_num, len_suma
	escribir suma, 3
	escribir espacio, len_esp
	
salir:
	mov eax, 1
	int 80H


