section .data
	mensaje db "La division es: "
	leng_mensaje equ $ -mensaje

	espacio db "",10
	leng_espacio equ $ -espacio
	archivo1 db "/home/jorge/Escritorio/ensamblador/texto1.txt", 0
	archivo2 db "/home/jorge/Escritorio/ensamblador/texto2.txt", 0

	division db "   "

section .bss
	a resb 3
	b resb 3
	idarchivo resd 1
	cociente resb 10

section .text
	global _start
%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro

_start:

	mov eax, 5		
	mov ebx, archivo1 	
	mov ecx, 0		
	mov edx, 0		
	int 80H

	test eax, eax 
		jz salir

	mov dword [idarchivo], eax
	
	mov eax, 3
	mov ebx, [idarchivo]
	mov ecx, a
	mov edx, 3
	int 80H

	mov eax, 5	
	mov ebx, archivo2 	
	mov ecx, 0	
	mov edx, 0		
	int 80H

	test eax, eax 
		jz salir

	mov dword [idarchivo], eax
	mov eax, 3
	mov ebx, [idarchivo]
	mov ecx, b
	mov edx, 3
	int 80H

	mov al, [a]
	sub al, '0'
	mov bl, [b]
	sub bl, '0'
	div bl
	add al, '0'
	add ah, '0'

	mov [cociente], al

	mov eax, 4
	mov ebx, 1
	mov ecx, cociente
	mov edx, 1
	int 80H

	jmp salir

salir: 
	mov eax, 1
	int 80h
