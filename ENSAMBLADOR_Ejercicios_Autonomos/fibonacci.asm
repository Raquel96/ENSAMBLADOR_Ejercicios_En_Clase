;~ codifique una subrutina usando loop que calcule la sucesión de fibonacci
;~ 1, 1, 2, 3, 5, 8
section .data
	fibo db 10, "Serie Fibonacci: 1, 1, "
	len EQU $ -fibo
	
	coma db ", "
	len_coma EQU $ -coma

	
section .bss
	suma resb 10
	aux resb 10
	
section .text
	global _start
	
_start:
l1:
	mov ax, 1
	mov bx, 1
	mov ecx, 6
			
	push eax
	push ebx
	push ecx
	call presentar
	jmp suma_fibo
	
	
suma_fibo:

	pop ecx
	pop ebx
	pop eax
	push eax
	push ebx
	push ecx
	
	mov [aux], ebx
	add eax, ebx
	add eax, '0' 
	mov [suma], eax
	
			
	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 6
	int 80H
	
	mov eax, 4
	mov ebx, 1
	mov ecx, coma
	mov edx, len_coma
	int 80H
	
	pop ecx
	pop ebx
	pop eax

	mov eax, [aux]
	mov ebx, [suma]
	sub ebx, '0'

	push eax
	push ebx

	dec ecx
	push ecx
	loop suma_fibo
	jmp salir
	
presentar:
	mov eax, 4
	mov ebx, 1
	mov ecx, fibo
	mov edx, len
	int 80H
	
	ret
	
salir:
	mov eax, 1
	int 80H

