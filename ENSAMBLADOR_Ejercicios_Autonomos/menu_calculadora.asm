section .data
	mensaje db "", 10,"	SELECCIONE UNA DE LAS SIGUIENTES OPCIONES: ", 10, "1--> SUMA", 10, "2--> RESTA", 10,"3--> MULTIPLICACION", 10, "4--> DIVISION", 10,"5--> SALIR",10, "", 10
	len_msj EQU $ -mensaje
	espacio db 10, "	", 10
	len_espacio EQU $ -espacio
	n1 db "Ingrese el valor del número 1: "
	len_n1 EQU $ -n1
	n2 db "Ingrese el valor del número 2: "
	len_n2 EQU $ -n2
	
	resultado db 10,"La rpta es: "
	len_presentar_suma equ $ -resultado

section .bss
	a resb 10
	b resb 10
	cociente resb 10
	residuo resb 10
	suma resb 10
	resta resb 10
	multiplicacion resb 10
	opcion resb 10
	

section .text
	global _start
	

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, len_msj
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, opcion
	mov edx, 2
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, espacio
	mov edx, len_espacio
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, n1
	mov edx, len_n1
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, a
	mov edx, 2
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, n2
	mov edx, len_n2
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, b
	mov edx, 2
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, espacio
	mov edx, len_espacio
	int 80H


	mov al, [opcion]
	sub al, '0'
	cmp al, 1 
	jz suma_calc

	cmp al, 2 
	jz resta_calc

	cmp al, 3 
	jz multiplicacion_calc

	cmp al, 4 
	jz division_cal

	jmp salir

;SUMA
	suma_calc:
		mov eax, [a]
		sub eax, '0'
		mov ebx, [b]
		sub ebx, '0'
		add eax, ebx
		add eax,'0'
		mov [suma], eax
		mov[resultado+4], dword 'suma'

		mov eax, 4
		mov ebx, 1
		mov ecx, resultado
		mov edx, len_presentar_suma
		int 80H

		mov eax, 4
		mov ebx, 1
		mov ecx, suma
		mov edx, 1
		int 80H

		jmp salir
		
		
;RESTA
	resta_calc:
		mov eax, [a]
		sub eax, '0'
		mov ebx, [b]
		sub ebx, '0'
		sub eax, ebx
		add eax,'0'
		mov [resta], eax

		mov[resultado+4], dword 'rest'

		mov eax, 4
		mov ebx, 1
		mov ecx, resultado
		mov edx, len_presentar_suma
		int 80H

		mov eax, 4
		mov ebx, 1
		mov ecx, resta
		mov edx, 1
		int 80H

		jmp salir

	
;MULTIPLICACION
	multiplicacion_calc:
		mov eax, [a]
		sub eax, '0'
		mov ebx, [b]
		sub ebx, '0'
		mul ebx
		add eax,'0'
		mov [multiplicacion], eax

		mov[resultado+4], dword 'Mult'

		mov eax, 4
		mov ebx, 1
		mov ecx, resultado
		mov edx, len_presentar_suma
		int 80H

		mov eax, 4
		mov ebx, 1
		mov ecx, multiplicacion
		mov edx, 1
		int 80H

		jmp salir
		
		
;DIVISION		
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

		mov[resultado+4], dword 'divi'

		mov eax, 4
		mov ebx, 1
		mov ecx, resultado
		mov edx, len_presentar_suma
		int 80H

		mov eax, 4
		mov ebx, 1
		mov ecx, cociente
		mov edx, 1
		int 80H

		jmp salir


;OPCION SALIR
	salir:
		mov eax, 4
		mov ebx, 1
		mov ecx, espacio
		mov edx, len_espacio
		int 80H

		mov eax, 1
		int 80H
