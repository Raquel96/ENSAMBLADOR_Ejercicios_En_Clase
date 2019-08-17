%macro escribir 2
	mov eax, 4
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro
	
section .data
	mensaje1 db "Iniciar ciclos", 0xA
	len_msj1 EQU $ -mensaje1

	mensaje2 db "Realizado por: ", 0xA
	len_msj2 EQU $ -mensaje2
	
	texto db "Raquel", 0xA
	len_texto EQU $ -texto
	
	mensaje3 db "Fin de ciclo", 0xA
	len_msj3 EQU $ -mensaje3
	
section .text
	global _start
	
_start:

	escribir mensaje1, len_msj1
	escribir mensaje2, len_msj2
	
	mov ecx, 5	

ciclo:
	push ecx
	
	escribir texto, len_texto
	
	pop ecx
	loop ciclo
	
	escribir mensaje3, len_msj3
	
salir:
	mov eax, 1
	int 80H
