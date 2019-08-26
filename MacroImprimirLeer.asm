%macro imprimir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
%macro leer 2
	mov eax, 3
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
section .data
	menu1 db "", 10,"INGRESE UN NUMERO", 10
	len_menu1 EQU $ -menu1
	msj db "", 10,"Hola", 10
	len_msj EQU $ -msj
section .bss
	opcion resb 10
section .text
	global _start

_start:
	imprimir menu1, len_menu1
	leer opcion,2
	imprimir msj, len_msj
	imprimir opcion, 2

	mov eax, 1
	mov ebx, 0
	int 80H

