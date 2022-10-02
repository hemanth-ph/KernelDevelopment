compile:
	nasm -f bin bootloader.asm -o bootloader.bin
	dd if=./temp.txt >> bootloader.bin
	dd if=/dev/zero bs=512 count=1 >> ./bootloader.bin
qemu:
	qemu-system-x86_64 -hdd bootloader.bin

