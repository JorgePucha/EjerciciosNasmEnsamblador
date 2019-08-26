section .data
	letrax db 10, "xxxxxxxxxx"
	leng_x equ $ -letrax

	valor db 10,"Ingrese valor",10
	leng_valor equ $ -valor

section .bss
	a resb 1
	b resb 10

	resultado resb 10
section .text
	global _start

_start:
	mov ecx, 3

	mov eax, 4
	mov ebx, 1
	mov ecx, valor
	mov edx, leng_valor
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, a
	mov edx, 10
	int 80H
	
	mov al, [a]
	sub al, '0'

	push eax
	pop ecx
	
ciclo:

	push ecx
	
	mov eax, 4
	mov ebx, 1
	mov ecx, letrax
	mov edx, leng_x
	int 80H

	pop ecx
	loop ciclo
salir:
	mov eax, 1
	int 80H
