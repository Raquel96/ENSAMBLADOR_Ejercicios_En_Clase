%macro escribir 2
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 0x80
%endmacro

section .data
	mensaje db "----------------------UNIVERSIDAD NACIONAL DE LOJA----------------------", 10, 10
	len equ $-mensaje
	nombre db "Pertenece a: ", 10, "	Raquel Espinosa Hurtado", 10, 10
	lenn equ $-nombre
	msj1 db  0x1b,"[46;36m","-------",0x1b,"[45;35m","-------",0x1b,"[46;36m","-------",0x1b,"[45;35m","-------",0x1b,"[46;36m","-------",0x1b,"[45;35m","-------",0x1b,"[46;36m","-------",0x1b,"[45;35m","-------",0x1b,"[46;36m","-------",0x1b,"[45;35m","-------",0x1b,"[46;36m","-------",0xA,0x1b,"[40;37m"
	len1 equ $-msj1
	msj2 db 0x1b,"[45;35m","-------",0x1b,"[46;36m","-------",0x1b,"[45;35m","-------",0x1b,"[46;36m","-------",0x1b,"[45;35m","-------",0x1b,"[46;36m","-------",0x1b,"[45;35m","-------",0x1b,"[46;36m","-------",0x1b,"[45;35m","-------",0x1b,"[46;36m","-------",0x1b,"[45;35m","-------",0xA,0x1b,"[40;37m"
	len2 equ $-msj2

section .bss
	res resb 2

section .text
	global _start

_start:
	escribir mensaje, len
	escribir nombre, lenn
	escribir msj1, len1
	escribir msj2, len2
	
salir:
	mov eax, 1
	int 0x80


