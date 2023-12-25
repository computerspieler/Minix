#!/bin/sh

sudo ./copy.sh
qemu-system-x86_64 -m 128 \
	-serial stdio \
	-k en-us \
	-drive file=minix.raw,media=disk,format=raw,if=ide,index=0,cache=writeback \
	-enable-kvm \
	-rtc base=localtime,clock=host \
	-boot d
