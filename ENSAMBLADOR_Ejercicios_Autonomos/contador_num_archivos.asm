%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	mensaje db 'Arreglo de Números: ', 10
	len_msj equ $-mensaje
	path1 db "/home/raquel/Ensamblador/arreglo.txt",0
	path2 db "/home/raquel/Ensamblador/repeticiones.txt",0
	numeros_rep db " n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces, n    = n     veces"
	len_num_rep equ $-numeros_rep
	salto db "", 10
	len_salto equ $- salto
	arreglo db '0000000000'
	
section .bss
	texto1 resb 10
	idarchivo1 resb 1 

section .text
	global _start
	
_start:
;~ ------------------------------LECTURA DEL ARCHIVO 1--------------------------------

;~ Abrir el archivo y leer los datos del mismo
	mov eax, 5
	mov ebx, path1
	mov ecx, 0
	mov edx, 0
	int 80h
;~ test == and --> el test solo modifica el estado de las banderas y define un 0
	test eax,eax
	jz salir	
	
	mov dword[idarchivo1], eax; respaldo el id del archivo
	escribir mensaje, len_msj
	
	mov eax, 3
	mov ebx, [idarchivo1];entrada estandar
	mov ecx, texto1
	mov edx, 10
	int 80h
	
	escribir texto1, 30
	escribir salto, len_salto
	
	;~ Cerramos archivo1
	mov eax, 6
	mov ebx, [idarchivo1]
	mov ecx, 0
	mov edx, 0 
	int 80h
	
;~ ------------------------------------ESCRITURA EN EL ARCHIVO 2--------------------------------
;~ ****************COMPARACION DE NUMEROS***************
	
	mov esi, 0;contador
comparacion1:
	mov edi, 0
	cmp esi, 10;si es menor a 0, entonces salta al bucle
	jb loop1
	;~ Reestablecemos valores
	mov esi, 0
	mov al, 0
	mov cl, 0
	mov edi, 0
	jmp comparacion2
	
loop1:
	mov al, [texto1+esi];posiciones del arreglo, primera
	mov bl, [texto1+edi]
	cmp al, bl
	jz loop3
	add edi,1;se incrementa el contador
	cmp edi,10;comparamos si es menor al tamaño del arreglo
	jb loop1
	add esi,1;se incrementa el contador
	jmp comparacion1
	
loop2: 
	add edi, 1;se incrementa el contador
	cmp edi,10
	jb loop1
	add esi,1;se incrementa el contador
	jmp comparacion1
		
loop3: 
	mov al,[arreglo + esi]
	add al,1
	mov [arreglo + esi], al
	add edi,1
	cmp edi,10
	jb loop1
	add esi,1
	jmp comparacion1
	
comparacion2:
	mov al, [texto1+esi]
	cmp al,cl
	jz comparacion3
	add cl,1
	jmp comparacion2

comparacion3:
	add edi, 1
	mov [numeros_rep+edi], dword ecx
	add edi, 19
		
loop4: 
	add esi,1
	mov cl, 0
	cmp esi,10
	jb comparacion2
	mov esi, 0
	mov al, 0
	mov cl, 0
	mov edi, 0
	
comparacion4:
	mov al, [arreglo+esi]
	cmp al,cl
	jz re_asignar
	add cl,1
	jmp comparacion4
		
re_asignar:
	add edi, 8
	mov [numeros_rep + edi], dword ecx
	add edi, 12
		
contador_numeros: 
	add esi,1
	mov cl, 0
	cmp esi,10
	jb comparacion4
	escribir numeros_rep, len_num_rep
	escribir salto, len_salto
		
;~ ------------ESCRIBIR--------------
	mov eax, 8
	mov ebx, path2
	mov ecx, 1
	mov edx, 200h
	int 80h		
	
	test eax, eax
	jz salir
	
	mov dword[idarchivo1], eax

	mov eax, [numeros_rep]
	mov [numeros_rep], eax
	
	mov eax, 4
	mov ebx, [idarchivo1]
	mov ecx, numeros_rep
	mov edx, len_num_rep
	int 80h
	
;~ --------------------CERRAR EL ARCHIVO---------------
	mov eax, 6
	mov ebx, [idarchivo1]
	mov ecx, 0
	mov edx, 0 
	int 80h
	
salir: 	
	mov eax,1
	int 80h
