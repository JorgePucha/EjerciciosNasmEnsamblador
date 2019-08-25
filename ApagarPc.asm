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
	menu1 db "", 10,"     SELECCIONE UNA DE LAS SIGUIENTES OPCIONES: ", 10, "1--> APAGAR", 10, "2--> SALIR",10, "", 10
	len_menu1 EQU $ -menu1
	espacio db "", 10
	len_esp EQU $ -espacio
	menu2 db "         CONFIRME SI DESEA APAGAR: ", 10,"1--> ACEPTAR", 10, "2--> SALIR", 10
	len_menu2 EQU $ -menu2
	
section .bss
	opcion resb 10
	
section .text
	global _start
	
_start:

menu_principal:
	imprimir menu1, len_menu1
	leer opcion,2

	imprimir espacio, len_esp
	mov al, [opcion]
	sub al, '0'
	cmp al, 1 
	jz menu_apagar

	jmp salir

menu_apagar:
	imprimir menu2, len_menu2
	leer opcion,2

	mov ecx, 1
	push ecx

	mov al, [opcion]
	sub al, '0'
	cmp al, 1 
	jz apagar

	jmp salir

;APAGAR
apagar:
	xor ebx,ebx
	push byte 0x17
	pop eax
	int 0x80
	lea eax,[ebx+0xb]
	cdq
	push edx
	push word 0x6666
	push dword 0x6f726577
	push dword 0x6f702f6e
	push dword 0x6962732f
	mov ebx,esp
	push edx
	push word 0x662d
	mov ecx,esp
	push edx
	push ecx
	push ebx
	mov ecx,esp
	int 0x80


;OPCION SALIR
salir:
	mov eax, 1
	int 80H
