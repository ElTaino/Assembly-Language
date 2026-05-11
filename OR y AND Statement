.intel_syntax noprefix
.global _start
.text
_start:

mov rax, 51

;# or(x == 0 || x > 50)
cmp rax, 0
je print
cmp rax, 50
jg print

;# if(x > 1 && x < 5)
;#cmp rax, 1
;#jle exit
;#cmp rax, 5
;#jge exit
;#jmp print



exit:
;#breakpoint
 int3
 mov rax, 60
 xor rdi, rdi
 syscall

print:
 mov rax, 1
 mov rdi, 1
 lea rsi, [s1]
 lea rdx, [s1_len]
 syscall
 jmp exit

.data
 s1: .ascii "less than!"
 s1_len = . - s1


;# SYSCALL(WRITE, TERMINAL, addr, len);
;# WRITE(TERMINAL, addr, len);

;# system call code: RAX
;# Parameter Order:
;# RDI
;# RSI
;# RDX
;# RCX
;# R8
;# R9

  
