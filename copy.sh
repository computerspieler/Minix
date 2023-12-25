#!/bin/bash

if [ $UID != "0" ]; then
    echo "Please run this script as root"
    exit 1
fi

losetup -P /dev/loop10 minix.raw
mkdir mnt
mount /dev/loop10p6 mnt/
cp -frv include/ man/ src/ mnt/
cp -v getty mnt/bin/
chown -R 2:0 mnt/include mnt/man mnt/src
sync
umount mnt
losetup -d /dev/loop10
rm -r mnt
