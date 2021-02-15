# makefile for console2.asm
console2: console2.o
	gcc -g -o console2 console2.o -no-pie
console2.o: console2.asm
	nasm -f elf64 -g -F dwarf console2.asm -l console2.lst
