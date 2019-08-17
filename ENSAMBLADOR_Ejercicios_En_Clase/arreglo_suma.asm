section .data
	mensaje db "Ingrese un numero y presione enter", 0xA
	len_msj EQU $ -mensaje
	
	arreglo db 0,0,0,0,0
	len_arreglo EQU $ -arreglo
	
	resp db "La suma es: ", 0xA
	len_resp EQU $ -resp
	
section .bss
	resultado resb 2
	
section .text
	global _start
	
_start:
	mov esi, arreglo
	mov edi, 0
	
	
imprimir:
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, len_msj
	int 80H
	
leer:
	mov eax, 3
	mov ebx, 2
	mov ecx, resultado
	mov edx, 2
	int 80H
	
	mov al, [resultado]
	sub al, '0'
	
	mov [esi], al
	inc esi
	inc edi
	
	cmp edi, len_arreglo ;Cuando edi es menor a len_arreglo, se activa la bandera de carri
	jb leer
	mov ecx, 0
	mov bl,0
	
suma:
	mov al, [arreglo+ecx]
	add bl, al
	
contador:
	inc ecx
	cmp ecx, len_arreglo
	jb suma 
	
imprimir_suma:
	add bl, '0'
	mov [resultado], bl
	
	mov eax, 4
	mov ebx, 1
	mov ecx, resp
	mov edx, len_resp
	int 80H
	
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80H
	jmp salir
	
salir:
	mov eax, 1
	int 80H
