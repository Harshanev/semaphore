
section .text                   ;section declaration

                                ;we must export the entry point to the ELF linker or
    global  _start              ;loader. They conventionally recognize _start as their
                                                  ;entry point. Use ld -e foo to override the default.

_start:

                                ;write our string to stdout

    mov     edx,len             ;third argument: message length
    mov     ecx,msg             ;second argument: pointer to message to write
    mov     ebx,1               ;first argument: file handle (stdout)
    mov     eax,4               ;system call number (sys_write)
    int     0x80                ;call kernel

                                ;and exit
     mov eax, 3		;sys_read(3)
     mov ebx, 0		;stdin (0)
     mov ecx, inpt  		;string to store to
     mov edx, 1		;number of bytes to read
     int 0x80		;interupt for linux

    mov     ebx,0               ;first syscall argument: exit code
    mov     eax,1               ;system call number (sys_exit)
    int     0x80                ;call kernel

section .data                   ;section declaration

msg db      "Hello, world!",0xa ;our dear string
len equ     $ - msg             ;length of our dear string
section .bss
inpt  resw    1                                                      
