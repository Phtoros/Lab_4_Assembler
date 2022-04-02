%include "syscall.mac"
global _start
	
	section .text
num2decstr:
	mov ebx, 1
	div ebx
	add edx, '0'
	mov [rdi+rcx-1], dl
	mov rdx, 0
	loop num2decstr
ret
_start:
	WRITE string, len
	mov eax, 1
	cpuid
	shr rbx, 16
	xor rax, rax
	mov al,bl
	call num2decstr
	EXIT
	section .data
string:
	db "CPU: ", 0xa
	len EQU $ - string
