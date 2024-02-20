; This is the bootloader for an unnamed operating system I am working on
; Written by Spencer
; TODO, figure out how to get CPUID, free memory, load gdt, and
; enter protected mode

[org 0x7c00]

[bits 16]


start: 
        jmp main

main:

        int 0x10 ; BIOS teletype function calling here helps clean up screen 
                 ; with emulators such as QEMU

        mov si, msg
        mov ah, 0x0e           
        
print_data:
        lodsb ; This loads the current byte from SI to AL
        cmp al, 0 ; compares AL to zero
        je done ; Jumps to done if AL = zero, meaning our data string has been printed.
        int 0x10

        jmp print_data 

done:
        hlt

; data section

msg: db "Welcome!", 0
        

; padding
times 510-($-$$) db 0 ; This padding is so our bootloader is 512 bytes

; Magic number
dw 0xaa55 ; This number tells the BIOS that this is indeed a bootloader
