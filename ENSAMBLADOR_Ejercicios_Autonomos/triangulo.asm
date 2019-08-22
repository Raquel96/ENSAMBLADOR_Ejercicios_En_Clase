section .data
	asterisco db '*'
	espacio db 10, ''
	n db "Ingrese un valor: "
	len EQU $ -n

;section .bss
;	numero resb 1

section .text
	global _start

_start:
	mov ecx, 20
	mov ebx, 1
	
linea1:	;Imprimir 1 asterisco
	push ecx
	;mov ecx, ebx
	;push ecx
	push ebx
	call imprimir_enter
	
	;pop ecx
	;mov ebx, ecx
	pop ecx
	mov ebx, ecx
	push ebx
	
	
linea2:	;Imprimir 2 asteriscos
	push ecx
	call imprimir_asterisco
	pop ecx
	loop linea2	;loop --> Instrucción utilizada para ciclos. Hace un salto y decrementa el registro cx de forma automática
	pop ebx
	pop ecx
	inc ebx
	loop linea1 ; salta hasta que ecx != 0
	
	jmp salir
	

imprimir_asterisco:
	mov eax, 4
	mov ebx, 1
	mov ecx, asterisco
	mov edx, 1
	int 80H
	ret	;Retorna a la ultima linea del llamado(call 
	
imprimir_enter:
	mov eax, 4
	mov ebx, 1
	mov ecx, espacio
	mov edx, 1
	int 80H
	ret	;Retorna a la ultima linea del llamado(call imprimir)
	
salir:
	mov eax, 1
	int 80H
	
	;DEBER
	
;	   *	*******		*******
;	  **	******		 ******
;    ***	*****		  *****
;   ****	****		   ****
;  *****	***				***
; ******	**				 **
;*******	*				  *
