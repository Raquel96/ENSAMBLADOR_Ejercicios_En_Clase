section .data
	msj1 db 'ingrese a:',10
	len1 equ $-msj1
	msj2 db 'ingrese b:',10
	len2 equ $-msj2
	msj3 db 'ingrese c:',10
	len3 equ $-msj3
	msj4 db 'Son iguales',10
	len4 equ $-msj4
	msj5 db 'No son iguales',10
	len5 equ $-msj5
	
section .bss
	n1: resb 2
	n2: resb 2
	n3: resb 2
section .text
	global _start
	_start:
	mov eax,4
	mov ebx,1
	mov ecx,msj1
	mov edx,len1
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx,n1
	mov edx,2
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,msj2
	mov edx,len2
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx,n2
	mov edx,2
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,msj3
	mov edx,len3
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx,n3
	mov edx,2
	int 80h

	mov al,[n1]
	sub al,'0'
	mov bl,[n2]
	sub bl,'0'
	mov cl,[n3]
	sub cl,'0'
	div bl

	cmp al,cl
	jz suma
	jc caso1
	jmp caso1

suma:
	mov eax,4
	mov ebx,1
	mov ecx,msj4
	mov edx,len4
	int 80h
	
	jmp salir

caso1:
	mov al,[n1]
	sub al,'0'
	mov bl,[n2]
	sub bl,'0'
	mov cl,[n3]
	sub cl,'0'
	div cl
	cmp al,bl
	jz suma
	jc caso2
	jmp caso2

caso2:
	mov al,[n1]
	sub al,'0'
	mov bl,[n2]
	sub bl,'0'
	mov cl,[n3]
	sub cl,'0'
	div cl
	cmp al,bl
	jz suma
	jc no_suma
	jmp no_suma

no_suma:
	mov eax,4
	mov ebx,1
	mov ecx,msj5
	mov edx,len5
	int 80h
	
	jmp salir

salir:
	mov eax,1
	mov ebx,0
	int 80h

