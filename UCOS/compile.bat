@echo off

echo Compiling bootloader
nasm bootloader.asm -f bin -o bootloader.bin

echo Compiling Extension
nasm ExtendedProgram.asm -f elf64 -o ExtendedProgram.o

echo Compiling Kernel.cpp
wsl $WSLENV/x86_64-elf-gcc -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"

echo Linking Extension with Kernel
wsl $WSLENV/x86_64-elf-ld -o kernel.tmp -Ttext 0x7e00 ExtendedProgram.o Kernel.o

echo Converting Linked objects to Binaries
wsl $WSLENV/x86_64-elf-objcopy -O binary kernel.tmp kernel.bin

echo Combining into executable binary
copy /b bootloader.bin+kernel.bin bootloader.flp

echo Done

pause

:: wsl $WSLENV/