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
	msj1 db 'Ingrese dividendo:',10
	len1 equ $-msj1
	msj2 db 'Ingrese divisor:',10
	len2 equ $-msj2
	msj3 db "", 10,'El cociente es:',10
	len3 equ $-msj3
	msj4 db "", 10,'El residuo:',10
	len4 equ $-msj4
section .bss
	num1: resb 1
	num2: resb 1
	cos: resb 1
	res: resb 1
section .text
	global _start
	_start:
	imprimir msj1, len1

	mov eax,3
	mov ebx,2
	mov ecx,num1
	mov edx,10
	int 80h

	imprimir msj2, len2

	mov eax,3
	mov ebx,2
	mov ecx,num2
	mov edx,10
	int 80h

	mov al,[num1]
	sub al,'0'
	mov bl,[num2]
	sub bl,'0'
	div bl
	add al,'0'
	add ah,'0'
	mov [cos],al
	mov [res],ah
	int 80h

	imprimir msj3, len3
	imprimir cos, 1

	imprimir msj4, len4
	imprimir res, 1


	mov eax,1
	mov ebx,0
	int 80h


