section .data

    valor db "Ingrese un valor: "
    lenvalor equ $-valor

    nueva_linea db 10, " "
section .bss
    numero resb 1
    num_v resb 1
    
section .text
    global _start
    

section .text
    global _start
    
_start:
    
    mov eax, 4 
    mov ebx, 1
    mov ecx, valor
    mov edx, lenvalor
    int 80H
        
    mov eax, 3
    mov ebx, 2
    mov ecx, num_v
    mov edx, 10
    int 80H


    mov al,[num_v]
    sub al,'0'
    
    push eax

    pop ecx

    mov ebx, 1

l1:
    push ecx
    push ebx

    call enter

    pop ecx
    mov ebx, ecx
    push ebx


l2:
    push ecx 


    call valor_num;

    pop ecx 
    loop l2    
    pop ebx
    pop ecx
    inc ebx
    loop l1  
    int 80H

    
valor_num:
    mov eax, ecx
    add eax,'0'
    mov [numero],eax

    mov eax, 4
    mov ebx, 1
    mov ecx, numero
    mov edx, 1
    int 80H
    ret 


enter:
    mov eax, 4
    mov ebx, 1
    mov ecx, nueva_linea
    mov edx, 1
    int 80H
    ret       
