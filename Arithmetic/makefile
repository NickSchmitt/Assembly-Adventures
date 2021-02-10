# makefile for icalc.asm
icalc2: icalc2.o
	gcc -o icalc2 icalc2.o -no-pie
icalc2.o: icalc2.asm
	nasm -f elf64 -g -F dwarf icalc2.asm -l lst
