.intel_syntax noprefix
.global _start
.text
_start:

;# We want to WRITE to the terminal STANDARD OUT
mov rax, 1 ;# syscall WRITE
mov rdi, 1 ;# TERMINAL, STD OUT
lea rsi, [hellostring]
lea rdx, [hellolen]
syscall

mov rax, 60
xor rdi, rdi
syscall

.data
hellostring: .ascii "Hello, world!"
;# "." position we're at now
;# "-" subtract
;# hellostring memory address
hellolen = . - hellostring
 
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
