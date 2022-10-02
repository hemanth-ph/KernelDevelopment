compile:
	nasm -f bin bootloader.asm -o bootloader.bin
	dd if=./temp.txt >> bootloader.bin
qemu:
	qemu-system-x86_64 -hdd bootloader.bin

