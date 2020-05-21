bits 32

section .multiboot          ;according to muiltiboot spec
    dd 0x1BADB002           ;Magic number for bootloader
    dd 0x0                  ; set flags
    dd - (0x1BADB002 + 0x0) ; checksum

section .text
global start
extern main                 ; defined in the C file

start:
    cli                     ; block interrupts
    mov esp, stack_space    ; set stack pointer
    call main
    hlt                     ; halt the CPU

section .bss
resb 8192                   ; 8KB for the stack
stack_space:

