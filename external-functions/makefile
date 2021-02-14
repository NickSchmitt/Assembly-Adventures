# makefile for extern, circle and rect.
extern: extern.o circle.o rect.o
	gcc -g -o extern extern.o circle.o rect.o -no-pie
extern.o: extern.asm
	nasm -f elf64 -g -F dwarf extern.asm -l extern.lst
circle.o: circle.asm
	nasm -f elf64 -g -F dwarf circle.asm -l circle.lst
rect.o: rect.asm
	nasm -f elf64 -g -F dwarf rect.asm -l rect.lst
