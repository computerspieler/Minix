#!/bin/sh

sudo ./copy.sh
sudo chmod +666 minix.raw
qemu-system-x86_64 -m 128M \
   	-serial mon:stdio \
	-k en-us \
	-drive file=minix.raw,media=disk,format=raw,if=ide,index=0,cache=writeback \
	-machine type=pc,accel=kvm \
	-cpu host \
	-rtc base=localtime,clock=host \
	-boot d
