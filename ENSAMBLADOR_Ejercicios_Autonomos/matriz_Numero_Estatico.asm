%macro escribir 2 	;numero de parametros que va a recibir
	mov eax,4
	mov ebx,1
	mov ecx,%1      ; etiqueta de memoria donde se va imprimir 
	mov edx,%2      ; catidad de digitos a imprimir
	int 80h
%endmacro
%macro leer     2 	;numero de parametros que va a recibir
	mov eax,3
	mov ebx,2
	mov ecx,%1      ; etiqueta de memoria donde se va imprimir 
	mov edx,%2      ; catidad de digitos a imprimir
	int 80h
%endmacro

section .data

	espacio db "",10
	len1 equ $ -espacio
	cero db "escribe un numero",10
	len2 equ $ -cero
	 

section .bss

n1 resb 1


section .text
	global _start
_start:
 
  escribir cero,len2
  leer n1,1

  mov ax,[n1]

  mov ecx,5
  mov ebx,3

fila:
  push ebx
  push 5
  escribir espacio, len1
  pop ecx
    
columna:
  push ecx
  escribir n1, 1
  pop ecx
  loop columna

  pop ecx
  mov ebx,ecx
  dec ebx

  loop fila

salir:
  mov eax,1
  mov ebx,0 
  int 80h
