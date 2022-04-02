global main
extern printf
section .text
main:
push rbp
mov rbp, rsp ;
mov eax, 7;
cpuid;
test ebx, 3
jnz Print
jz Print2
ret
Print:
mov rdi, msga
xor rax, rax
call printf
ret
Print2:
mov rdi, msgb
xor rax, rax
call printf
ret
section .data
msga: db "BMI1 is supported.", 0x0a, 0
msgb: db "BMI1 is NOT supported.", 0x0a, 0
