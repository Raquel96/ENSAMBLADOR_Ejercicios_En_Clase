;Saltos no condicionales
;JMP operando

section .data
	
	n1 db "Ingrese el numero 1: ", 0xa
	len1 EQU $ -n1
	n2 db 10, "Ingrese el numero 2: ", 0xa
	len2 EQU $ -n2
	
	mensaje db 10, "Resultado ***:"
	len_msj EQU $ -mensaje
	
section .bss
	a resb 1
	b resb 1
	sum resb 1 
	res resb 1 
	multi resb 1 
	divi resb 1
	resi resb 1
	
section .text
	global _start
	
_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, n1
	mov edx, len1
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, a
	mov edx, 2
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, n2
	mov edx, len2
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, b
	mov edx, 2
	int 80H
	
	jmp division
	
	suma:
		mov ax, [a]
		mov bx, [b]
		sub ax, '0'
		sub bx, '0' 
		
		add ax, bx 
		add ax, '0' 
		mov [sum], ax
		
		mov eax, 4
		mov ebx, 1
		mov ecx, mensaje
		mov edx, len_msj
		int 80H
		
		mov [mensaje+14], dword 'Suma'
		
		mov eax, 4
		mov ebx, 1
		mov ecx, sum
		mov edx, 1
		int 80H
		
		
		jmp multiplicacion

	resta:
		mov ax, [a]
		mov bx, [b]
		sub ax, '0'
		sub bx, '0' 
		
		sub ax, bx 
		add ax, '0' 
		mov [res], ax
		
		mov eax, 4
		mov ebx, 1
		mov ecx, mensaje
		mov edx, len_msj
		int 80H
		
		mov [mensaje+14], dword 'Rest'
		
		mov eax, 4
		mov ebx, 1
		mov ecx, res
		mov edx, 1
		int 80H
		
		jmp suma

	multiplicacion:
		mov ax, [a]
		mov bx, [b]
		sub ax, '0'
		sub bx, '0' ; Convierte la cadena a numero
		
		mul bx
		add ax, '0' ; Convierte el numero a cadena
		mov [multi], ax
		
		mov eax, 4
		mov ebx, 1
		mov ecx, mensaje
		mov edx, len_msj
		int 80H
		
		mov [mensaje+14], dword 'Mult'
		
		mov eax, 4
		mov ebx, 1
		mov ecx, multi
		mov edx, 1
		int 80H
		
		jmp salir
		
	division:
		;Se realiza la división
		mov al, [a]
		mov bl, [b]
		sub ax, '0'
		sub bx, '0' ; Convierte la cadena a numero
		
		div bl
		add al, '0' ; Convierte el numero a cadena
		mov [divi], ax
		
		add ah, '0'
		mov [resi], ah
		
		
		mov eax, 4
		mov ebx, 1
		mov ecx, mensaje
		mov edx, len_msj
		int 80H
		
		mov [mensaje+14], dword 'Div'
		
		mov eax, 4
		mov ebx, 1
		mov ecx, divi
		mov edx, 1
		int 80H
		
		mov eax, 4
		mov ebx, 1
		mov ecx, mensaje
		mov edx, len_msj
		int 80H
		
		mov [mensaje+14], dword 'Mod'
		
		mov eax, 4
		mov ebx, 1
		mov ecx, resi
		mov edx, 1
		int 80H
		
		jmp resta

	salir:

		mov eax, 1
		int 80H

