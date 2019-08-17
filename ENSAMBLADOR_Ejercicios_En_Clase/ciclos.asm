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

	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje1
	mov edx, len_msj1
	int 80H
	
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje2
	mov edx, len_msj2
	int 80H
	
	mov ecx, 5	

ciclo:
	push ecx
	mov eax, 4
	mov ebx, 1
	mov ecx, texto
	mov edx, len_texto
	int 80H
	pop ecx
	loop ciclo
	
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje3
	mov edx, len_msj3
	int 80H
	
salir:
	mov eax, 1
	int 80H
