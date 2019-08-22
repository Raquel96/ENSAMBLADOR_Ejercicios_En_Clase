%macro escribir 2 	;numero de parametros que va a recibir
	mov eax,4
	mov ebx,1
	mov ecx,%1      ; etiqueta de memoria donde se va imprimir 
	mov edx,%2      ; catidad de digitos a imprimir
	int 80h
%endmacro

section .data
	espacio db " ",10
        len equ $ -espacio
section .bss
	n1 resb 1

section .text
	global _start
 
  _start:
     
    
    mov ecx,5
    mov ebx,3
    
    
   fila:
   push ebx   
   push 5
   escribir espacio, len
   pop ecx

   mov eax,1   
   add eax,'0'

   columna:
   push ecx
   mov [n1],eax
   escribir n1,1
   mov eax,[n1]
   inc eax
   pop ecx
   loop columna

   pop ecx
   mov ebx, ecx
   dec ebx
   loop fila

  salir:
  mov eax,1
  int 80h
