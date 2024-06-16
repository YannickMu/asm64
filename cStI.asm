;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;This program will convert a userinput to an integer;
;Author: Yannick Müller                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text
	global _start

	_start:
		mov rax,0x1		;syscall write festlegen
		mov rdx,len		;set Buffersize
		mov rsi,msg		;set Output
		mov rdi,0x1		;set file descriptor (stdout)
		syscall

		mov rax,0x0		;syscall read festlegen
		mov rdx,0x2		;set Buffersize
		sub rsp,0x2		;set Stackpointersize
		lea rsi,[rsp]	;set Stackpointer
		mov rdi,0x0		;set file descriptor (stdin)
		syscall

		mov rax,0x1		;syscall write festlege
		mov rdx,len		;set Buffersize
		mov rsi,sta		;set Output
		mov rdi,0x1		;set file descriptor (stdout)
		syscall

		movzx rsi,byte [rsp]
		mov rdx,0x2
		syscall

		mov rax,0x3c
		xor rdi,rdi
		syscall

section .data
	msg: db "Enter any onedidgit number: "
	len: equ $ - msg
	sta: times len - 1 db "*"
	LF: db 0xa

