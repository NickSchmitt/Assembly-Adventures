; icalc.asm
extern printf
section .data
    number1     dq      128     ; the numbers to be used to show the arithmetic
    number2     dq      19
    neg_num     dq      -12     ; to show sign extension
    fmt         db      "The numbers are %ld and %ld",10,0
    fmtint      db      "%s %ld",10,0
    sumi        db      "The sum is",0
    difi        db      "The difference is",0
    inci        db      "Number 1 Incremented:",0
    deci        db      "Number 1 Decremented:",0
    sali        db      "Number 1 Shift left 2 (x4):",0
    sari        db      "Number 1 Shift right 2 (/4):",0
    sariex      db      "Number 1 Shift right 2 (/4) with "
                        db      "sign extension:",0
    multi       db      "The product is",0
    divi        db      "The integer quotient is",0
    remi        db      "The modulo is",0
section .bss
    resulti     resq    1
    modulo      resq    1
section .text
    global main
main:
    push        rbp
    mov         rbp, rsp
; displaying numbers
    mov         rdi, fmt
    mov         rsi, [number1]
    mov         rdx, [number2]
    mov         rax, 0
    call printf
    
; addition
    mov         rax, [number1]
    add         rax, [number2]  ; add number2 to rax
    mov         [resulti], rax  ; move sum to result
; display
    mov     rdi, fmtint
    mov     rsi, sumi
    mov     rdx, [number2]
    mov     rax, 0
    call printf
                
; subtraction
    mov         rax, [number1]
    sub         rax, [number2]
    mov         [resulti], rax
; display
    mov         rdi, fmtint
    mov         rsi, difi
    mov         rdx, [resulti]
    mov         rax, 0
    call printf
                
; incrementing
    mov         rax, [number1]
    inc         rax
    mov         [resulti], rax
; display
    mov         rdi, fmtint
    mov         rsi, inci
    mov         rdx, [resulti]
    mov         rax, 0
    call printf

; decrementing
    mov         rax, [number1]
    inc         rax
    mov         [resulti], rax
; display
    mov         rdi, fmtint
    mov         rsi, deci
    mov         rdx, [resulti]
    mov         rax, 0
    call printf

; shift arithmetic left
    mov         rax, [number1]
    sal         rax, 2          ; multiply rax by 4 (left shift: 2^n = 2^2)            
    mov         [resulti], rax
; display
    mov         rdi, fmtint
    mov         rsi, sal
    mov         rdx, [resulti]
    mov         rax, 0
    call printf
                
; shift arithmetic right
    mov         rax, [number1]
    sar         rax, 2          ; divide rax by 4 (right shift: dividing 2^n = dividing by 2^2)            
    mov         [resulti], rax
; display
    mov         rdi, fmtint
    mov         rsi, sar
    mov         rdx, [resulti]
    mov         rax, 0
    call printf
    
; shift arithmetic right with sign extension
    mov         rax, [neg_num]
    sar         rax, 2          ; divide rax by 4            
    mov         [resulti], rax
; display
    mov         rdi, fmtint
    mov         rsi, sariex
    mov         rdx, [resulti]
    mov         rax, 0
    call printf

; multiply
    mov         rax, [number1]
    imul        qword [number2] ; multiply rax with number2
    mov         [resulti], rax
; display
    mov         rdi, fmtint
    mov         rsi, multi
    mov         rdx, [resulti]
    mov         rax, 0
    call printf

; divide
    mov         rax, [number1]
    mov         rdx, 0          ; rdx must be 0 before idiv
    idiv        qword [number2]
    mov         [resulti], rax
    mov         [modulo], rdx   ; rdx to modulo
; display
    mov         rdi, fmtint
    mov         rsi, divi
    mov         rdx, [resulti]
    mov         rax, 0
    call        printf
    mov         rdi, fmtint
    mov         rsi, remi
    mov         rdx, [modulo]
    mov         rax, 0
    call printf

mov rsp, rbp
pop rbp
ret    
