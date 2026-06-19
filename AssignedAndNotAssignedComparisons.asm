.intel_syntax noprefix
.global _start
.text
_start:

mov rax, -1
cmp rax, 1
;# signed version
;#jl print ;# jump if less than


;# jg = jump if greater
;# jpe = jump if greater or equal
;# jl = jump if less than
;# jle = jump if less than or equal
;#

;# unsigned version
jb print ;# jump if below than

;# ja = jump if greater
;# jpa = jump if greater or equal
;# jb = jump if below
;# jbe = jump if below or equal

;# regular ones that always work
;# je = jump if equal
;# jz = jump if zero
;# jne = jump if not equal
;# jnz = jump if not zero

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
