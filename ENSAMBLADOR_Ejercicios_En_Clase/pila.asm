section .data
	nombre db "Raquel"
	len_n EQU $ -nombre
	
	apellido db "Espinosa"
	len_a EQU $ -apellido
	
section .bss
	msj resb 1
	
section .text
	global _start
		
	
_start:

	mov eax, [nombre]
	push eax
	
	;mov ax, 2
	
	mov eax, [apellido]
	push eax
	
	pop ebx
	mov [msj], ebx
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msj
	mov edx, 7
	int 80H
	
	pop ebx
	mov [msj], ebx
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msj
	mov edx, 7
	int 80H
	
	mov eax, 1
	int 80H
