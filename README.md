# Simple-bootloader
A simple bootloader written in x86 assembly

This is a simple bootloader I wrote while trying to teach myself x86 assembly. The asm file can be compiled using NASM with the following comand, nasm -f bin boot.asm -o boot.bin.

The flat binary file which was created can then be run in qemu with: qemu-system-x86_64 -drive format=raw,file=boot.bin

If your machine does not have the QEMU emulator installed, it can be installed with: sudo apt-get install qemu-system-x86. 
