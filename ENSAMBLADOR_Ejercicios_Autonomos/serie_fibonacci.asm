;~ codifique una subrutina usando loop que calcule la sucesión de fibonacci
;~ 1, 1, 2, 3, 5, 8.....
section .data
	fibonacci db 10, "Serie Fibonacci		 1, 1, "
	len_fibo EQU $ -fibonacci

	coma db ", "
	len_coma EQU $ -coma
	
section .bss
	suma resb 10
	aux resb 10
	
section .text
	global _start
	
_start:
	
	
inicio:
	mov ecx, 5
	mov eax, 1
	mov ebx, 1

	push eax
	push ebx
	push ecx
	call presentar
	jmp serieFibonacci
	
serieFibonacci:
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
	mov edx, 5
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
	loop serieFibonacci
	jmp salir

	
presentar:
	mov eax, 4
	mov ebx, 1
	mov ecx, fibonacci
	mov edx, len_fibo
	int 80H

	ret
	
salir:
	mov eax, 1
	int 80H
