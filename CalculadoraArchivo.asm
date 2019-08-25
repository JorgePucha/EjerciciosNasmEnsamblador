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
	mensaje db "", 10,"	SELECCIONE UNA DE LAS SIGUIENTES OPCIONES: ", 10, "1--> SUMA", 10, "2--> RESTA", 10,"3--> MULTIPLICACION", 10, "4--> DIVISION", 10,"5--> SALIR",10, "", 10
	len_msj EQU $ -mensaje
	espacio db 10, "	", 10
	len_espacio EQU $ -espacio
	n1 db "Ingrese el valor del número 1: "
	len_n1 EQU $ -n1
	n2 db "Ingrese el valor del número 2: "
	len_n2 EQU $ -n2

	resultado db 10,"La rpta es: "
	len_presentar_suma equ $ -resultado
	documento db "/home/jorge/Escritorio/Assambler/doc.txt" , 0 

section .bss
	a resb 10
	b resb 10
	cociente resb 10
	residuo resb 10
	valor resb 10
	resta resb 10
	multiplicacion resb 10
	opcion resb 10
	iddocumento resb 1
	

section .text
	global _start
	

_start:
	imprimir mensaje, len_msj
	leer opcion,2
	imprimir espacio, len_espacio
	imprimir n1, len_n1
	leer a,2
	imprimir n2, len_n2
	leer b,2
	imprimir espacio, len_espacio

	mov al, [opcion]
	sub al, '0'
	cmp al, 1 
	jz suma_calc

	cmp al, 2 
	jz resta_calc

	cmp al, 3 
	jz multiplicacion_calc

	cmp al, 4 
	jz division_cal

	jmp salir

;SUMA
	suma_calc:
		mov eax, [a]
		sub eax, '0'
		mov ebx, [b]
		sub ebx, '0'
		add eax, ebx
		add eax,'0'
		mov [valor], eax
		mov[resultado+4], dword 'suma'

		imprimir resultado, len_presentar_suma
		imprimir valor, 2

		jmp salir
		
		
;RESTA
	resta_calc:
		mov eax, [a]
		sub eax, '0'
		mov ebx, [b]
		sub ebx, '0'
		sub eax, ebx
		add eax,'0'
		mov [valor], eax

		mov[resultado+4], dword 'rest'

		imprimir resultado, len_presentar_suma
		imprimir valor, 2

		jmp salir

	
;MULTIPLICACION
	multiplicacion_calc:
		mov eax, [a]
		sub eax, '0'
		mov ebx, [b]
		sub ebx, '0'
		mul ebx
		add eax,'0'
		mov [valor], eax

		mov[resultado+4], dword 'Mult'

		imprimir resultado, len_presentar_suma
		imprimir valor, 2

		jmp salir
		
		
;DIVISION		
	division_cal:

		mov al, [a]
		sub al, '0'
		mov bl, [b]
		sub bl, '0'
		div bl
		add al, '0'
		add ah, '0'

		mov [valor], al
		mov [residuo], ah

		mov[resultado+4], dword 'divi'

		imprimir resultado, len_presentar_suma
		imprimir valor, 2

		jmp salir


;OPCION SALIR
	salir:
		mov eax, 8
		mov ebx, documento
		mov ecx, 1
		mov edx, 200h
		int 80h		
		
		test eax, eax
		jz salir
		
		mov dword[iddocumento], eax
		
		mov eax, 4
		mov ebx, [iddocumento]
		mov ecx, valor
		mov edx, 3
		int 80h
		
		mov eax, 6
		mov ebx, [iddocumento]
		mov ecx, 0
		mov edx, 0 
		int 80h

		mov eax, 1
		int 80H

