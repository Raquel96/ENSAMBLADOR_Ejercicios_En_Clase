section .data
	figura db "", 10, "*********", 10, "********", 10,"*******", 10, "******", 10,"*****",10, "****", 10, "***", 10, "**", 10, "*", 10
	len_fig EQU $ -figura
	
	
section .text
	global _start
	
_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, figura
	mov edx, len_fig
	int 80H

	mov eax, 1
	int 80H

