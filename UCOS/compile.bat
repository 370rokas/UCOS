@echo off

echo Compiling bootloader
nasm bootloader.asm -f bin -o bootloader.bin

echo Compiling Extension
nasm ExtendedProgram.asm -f elf64 -o ExtendedProgram.o

echo Compiling Kernel.cpp
wsl $WSLENV/x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"

echo Linking Extension with Kernel
wsl $WSLENV/x86_64-elf-ld -T"link.ld"

echo Combining into executable binary
copy /b bootloader.bin+kernel.bin bootloader.flp

echo Done

pause

:: wsl $WSLENV/