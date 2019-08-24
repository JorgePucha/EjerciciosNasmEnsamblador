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
	num db 'Ingrese un numero del 1 al 9', 10
	leng1 equ $-num
	msj1 db 'Es primo!!!'
	leng2 equ $-msj1
	msj2 db 'No es primo!!!'
	leng3 equ $-msj2
section .bss
	n resb 1
section .text
	global _start
		_start:

	imprimir num, leng1
	leer n,2

	mov al,[n]
	sub al, '0'
	cmp al,2
	jz primo
	jc primo
	jmp veri
veri:
	mov al,[n]
	sub al, '0'
	and al, 1
	jz no_primo
	jmp impar
impar:
	mov al,[n]
	sub al, '0'
	cmp al,3
	jz primo
	jmp veri2
veri2:
	mov al, [n]
	sub al, '0'
	cmp al,9
	jz no_primo
	jmp primo
primo:
	imprimir msj1, leng2
	jmp salir
no_primo:
	imprimir msj2, leng3
	jmp salir
salir:
	mov eax, 1
	mov ebx, 0
	int 80
