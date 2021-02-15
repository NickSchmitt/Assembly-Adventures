# makefile for bit-manipulation and printb
bit-manipulation: bit-manipulation.o printb.o
	gcc -g -o bit-manipulation bit-manipulation.o printb.o -no-pie
bit-manipulation.o: bit-manipulation.asm
	nasm -f elf64 -g -F dwarf bit-manipulation.asm -l bit-manipulation.lst
printb: printb.c
	gcc -c printb.c
