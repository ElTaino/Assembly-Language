;##### CODE START

.intel_syntax noprefix
.global _start
.text


_readline:
lea rsp, [buf];# to look at the stack
mov rax, 0 ;# read command 
;# returns to rax the length
mov rdi, 0 ;# STDIN
lea rsi, [buf]
mov rdx, 4096
syscall

;# move to a single byte in memory
mov byte ptr [rsi + rax], '\n'

lea rdx, [rax + 1]
mov rax, 1 ;# WRITE
mov rdi, 1 ;# TERMINAL (STDOUT)
lea rsi, [buf]
syscall

jmp _readline

mov rax, 60 ;#terminate program
mov rdi, 0
syscall

.data
buf: .skip 4096
