; is-linux -- prints "yes" to prove you are running Linux.
;
; Freestanding x86_64 Linux, no libc, no C runtime.
; Calls the write(2) and exit(2) syscalls directly.

        bits    64
        default rel

        section .rodata

msg:    db      "yes", 10
msg_len equ     $ - msg

        section .text

        global  _start

_start:
        ; write(1, msg, len)
        mov     eax, 1                  ; SYS_write
        mov     edi, 1                  ; fd: stdout
        lea     rsi, [msg]
        mov     edx, msg_len
        syscall

        ; exit(0)
        mov     eax, 60                 ; SYS_exit
        xor     edi, edi                ; status 0
        syscall
