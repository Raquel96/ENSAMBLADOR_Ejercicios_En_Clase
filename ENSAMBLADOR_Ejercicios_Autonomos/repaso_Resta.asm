;# pares --> suma
;# impares --> resta
;# iguales --> multiplicacion
;# diferentes --> division
section .data
	n1 db "Ingrese un numero", 10
	len1 EQU $ -n1
	n2 db "Ingrese un numero", 10
	len2 EQU $ -n2
	rta_suma db "La suma es: ", 10
	len_suma EQU $ -rta_suma
	rta_resta db "La resta es: ", 10
	len_resta EQU $ -rta_resta
	rta_mult db "La mult es: ", 10
	len_mult EQU $ -rta_mult
	rta_div db "La div es: ", 10
	len_div EQU $ -rta_div
	
section .bss
	a resb 1
	b resb 1
	cociente resb 10
	residuo resb 10
	suma resb 10
	resta resb 10
	multiplicacion resb 10

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
	
	mov al, [a]
	sub al, '0'
	and al, 01
	
		jz suma_calc
		jmp resta_calc
	mov bl, [b]
	sub bl, '0'
	and bl, 01
		
		jz suma_calc
		jmp resta_calc
	
suma_calc:
	mov eax, [a]
	sub eax, '0'
	mov ebx, [b]
	sub ebx, '0'
	add eax, ebx
	add eax,'0'
	mov [suma], eax
	;mov[resultado+4], dword 'suma'

	mov eax, 4
	mov ebx, 1
	mov ecx, rta_suma
	mov edx, len_suma
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 1
	int 80H

	jmp salir
		
resta_calc:
	mov eax, [a]
	sub eax, '0'
	mov ebx, [b]
	sub ebx, '0'
	sub eax, ebx
	add eax,'0'
	mov [resta], eax

	;mov[resultado+4], dword 'rest'

	mov eax, 4
	mov ebx, 1
	mov ecx, rta_resta
	mov edx, len_resta
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, resta
	mov edx, 1
	int 80H

	jmp salir


multiplicacion_calc:
	mov eax, [a]
	sub eax, '0'
	mov ebx, [b]
	sub ebx, '0'
	mul ebx
	add eax,'0'
	mov [multiplicacion], eax

	;mov[resultado+4], dword 'Mult'

	mov eax, 4
	mov ebx, 1
	mov ecx, rta_mult
	mov edx, len_mult
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, multiplicacion
	mov edx, 1
	int 80H

	jmp salir
		
				
division_cal:

	mov al, [a]
	sub al, '0'
	mov bl, [b]
	sub bl, '0'
	div bl
	add al, '0'
	add ah, '0'

	mov [cociente], al
	mov [residuo], ah

	;mov[resultado+4], dword 'divi'

	mov eax, 4
	mov ebx, 1
	mov ecx, rta_div
	mov edx, len_div
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, cociente
	mov edx, 1
	int 80H

	jmp salir

salir:	
	mov eax, 1
	int 80H
