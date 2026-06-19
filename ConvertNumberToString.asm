### COMPLETE PROGRAM BELOW 

.intel_syntax noprefix
.global _start
.text
_start:
mov rdi, 23451
push rdi

lea rsi, [buf + 32]
call _itoa
mov rdi, rax
call _print

pop rdi
lea rsi, [buf + 32]
call _itob
mov rdi, rax
call _print

call _exit

_itoa:
mov rbx, 10
mov rax, rdi
lea rdi, [rsi]
mov byte ptr [rdi], 0
dec rdi
mov byte ptr [rdi], '\n'

 _itoa_loop:
  xor rdx, rdx ;# mov rdx, 0
  dec rdi
  div rbx
  add rdx, '0' ;# 48
  mov [rdi], dl
  cmp rax, 0
  jne _itoa_loop
  mov rax, rdi
  ret
  
_itob:
mov rbx, 2
mov rax, rdi
lea rdi, [rsi]
mov byte ptr [rdi], 0
dec rdi
mov byte ptr [rdi], '\n'

 _itob_loop:
  xor rdx, rdx ;# mov rdx, 0
  dec rdi
  div rbx
  add rdx, '0' ;# 48
  mov [rdi], dl
  cmp rax, 0
  jne _itob_loop
  mov rax, rdi
  ret
  
  


_print:
  push rdi
  call _strlen
  pop rsi
  mov rdx, rax
  mov rax, 1
  mov rdi, 1
  syscall
  ret
  
_exit:
  int 3 ;# pause before exiting
  mov rax, 60
  xor rdi, rdi
  syscall
  
_strlen:
  push rbp
  mov rbp, rsp
  xor rcx, rcx
 _strlen_loop:
   mov al, [rdi]
   cmp al, 0x0
   je _strlen_end
   inc rcx
   inc rdi
   jmp _strlen_loop
_strlen_end:
  mov rax, rcx
  mov rsp, rbp
  pop rbp
  ret

  .data
  buf: .skip 1024

;## COMPLETE PROGRAM END
