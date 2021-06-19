all:
	@make --ignore-errors clean
	@make build
	@make --ignore-errors clean

build:
	@nasm -f bin -o boot.bin boot.asm
	@dd if=/dev/zero of=boot.img bs=1024 count=1440
	@dd if=boot.bin of=boot.img seek=0 count=1 conv=notrunc
	@mkdir iso
	@cp boot.img iso/
	@genisoimage -quiet -V 'MYOS' -input-charset iso8859-1 -o elike.iso -b boot.img -hide boot.img iso/
clean:
	@rm *.img
	@rm *.bin
	@rm -r iso