%macro escribir 2
	mov eax, 4
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro
	
%macro leer 2
	mov eax, 3
	mov ebx, 0
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro

section .data
	msg1		db		10,'-Calculadora-',10,0
	lmsg1		equ		$ - msg1
 
	msg2		db		10,'Numero 1: ',0
	lmsg2		equ		$ - msg2
 
	msg3		db		'Numero 2: ',0
	lmsg3		equ		$ - msg3
 
	msg4		db		10,'1. Sumar',10,0
	lmsg4		equ		$ - msg4
 
	msg5		db		'2. Restar',10,0
	lmsg5		equ		$ - msg5
 
	msg6		db		'3. Multiplicar',10,0
	lmsg6		equ		$ - msg6
 
	msg7		db		'4. Dividir',10,0
	lmsg7		equ		$ - msg7
 
	msg8		db		'Operacion: ',0
	lmsg8		equ		$ - msg8
 
	msg9		db		10,'Resultado: ',0
	lmsg9		equ		$ - msg9
 
	msg10		db		10,'Opcion Invalida',10,0
	lmsg10		equ		$ - msg10
 
	nlinea		db		10,10,0
	lnlinea		equ		$ - nlinea
 
section .bss
 
	; Espacios en la memoria reservados para almacenar los valores introducidos por el usuario y el resultado de la operacion.
 
	opcion:		resb 	2
	num1:		resb	2
	num2:		resb 	2
	resultado:	resb 	2
 
section .text
 
	global _start
 
_start:
 
	; Imprimimos en pantalla el mensaje 1
	escribir msg1, lmsg1
 
	; Imprimimos en pantalla el mensaje 2
	escribir msg2, lmsg2
 
	; Obtenemos el numero 1
	
	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2
	int 80h
 
	; Imprimimos en pantalla el mensaje 3
	escribir msg3, lmsg3
 
	; Obtenemos el numero 2
	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 2
	int 80h
 
	; Imprimimos en pantalla el mensaje 4
	escribir msg4, lmsg4
 
	; Imprimimos en pantalla el mensaje 5
	escribir msg5, lmsg5
 
	; Imprimimos en pantalla el mensaje 6
	escribir msg6, lmsg6
 
	; Imprimimos en pantalla el mensaje 7
	escribir msg7, lmsg7
 
	; Print on screen the message 8
	escribir msg8, lmsg8
 
	; Obtenemos la opcion seleccionada por el usuario
	mov ebx, 0
	mov ecx, opcion
	mov edx, 2
	mov eax, 3
	int 80h
 
	mov ah, [opcion]	; Movemos la opcion seleccionada a el registro AH
	sub ah, '0'		; Convertimos el valor ingresado de ascii a decimal
 
	; Comparamos el valor ingresado por el usuario para saber que operacion realizar.
	; JE = Jump if equal = Saltamos si el valor comparado es igual
 
	cmp ah, 1
	je sumar
 
	cmp ah, 2
	je restar
 
	cmp ah, 3
	je multiplicar
 
	cmp ah, 4
	je dividir
 
	; Si el valor ingresado no cumple con ninguna de las condiciones anteriores entonces mostramos un mensaje de error y finalizamos
	; la ejecucion del programa
	escribir msg10, lmsg10
 
	jmp salir
 
sumar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Sumamos el registro AL y BL
	add al, bl
;	aaa
 
	; Convertimos el resultado de la suma de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	escribir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	;~ escribir resultado, 2
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 2
	int 80h
 
	; Finalizamos el programa
	jmp salir
 
restar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Restamos el registro AL y BL
	sub al, bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	escribir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
 
	; Finalizamos el programa
	jmp salir
 
multiplicar:
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Multiplicamos. AX = AL X BL
	mul bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Imprimimos en pantalla el mensaje 9
	escribir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
 
	; Finalizamos el programa
	jmp salir
 
dividir:
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Igualamos a cero los registros DX y AH
	mov dx, 0
	mov ah, 0
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Division. AL = AX / BL. AX = AH:AL
	div bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Print on screen the message 9
	escribir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
 
	; Finalizamos el programa
	jmp salir
 
salir:
	; Imprimimos en pantalla dos nuevas lineas
	escribir nlinea, lnlinea

	; Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h
