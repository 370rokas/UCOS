@echo off

echo Compiling bootloader
nasm bootloader.asm -f bin -o bootloader.bin

echo Compiling Extension
nasm ExtendedProgram.asm -f bin -o ExtendedProgram.bin

echo Combining into executable floppy
copy /b bootloader.bin+ExtendedProgram.bin bootloader.flp

echo Done

pause