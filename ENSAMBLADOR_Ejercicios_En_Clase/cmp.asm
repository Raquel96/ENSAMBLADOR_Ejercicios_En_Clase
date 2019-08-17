section .data

	n1 db "Ingrese el valor del número 1: "
	len_n1 EQU $ -n1
	n2 db "Ingrese el valor del número 2: "
	len_n2 EQU $ -n2
	
	resultado db 10,"La rpta es: "
	len_presentar_suma equ $ -resultado

	
