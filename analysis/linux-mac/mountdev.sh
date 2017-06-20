#! /bin/bash
if [ -z "$1" ] || [ "$1" == "-h" ]; then
	echo usage: mountdev.sh somepassword
	echo first argument is user password that unlocks disk
	exit 1
fi

. env.config
cd ../disk


if [ ! -d /mnt/fvde ]; then
	mkdir /mnt/fvde
fi
if [ ! -d /mnt/${target} ]; then
	mkdir /mnt/${target}
fi
if [ ! -d /mnt/${target}-recovery ]; then
	mkdir /mnt/${target}-recovery
fi

mount -o ro ${target}-p3.dd /mnt/${target}-recovery
if [ ! -f EncryptedRoot.plist.wipekey ]; then
	find /mnt/${target}-recovery -name EncryptedRoot.plist.wipekey -exec cp {} . \;
fi

fvdemount -e EncryptedRoot.plist.wipekey -p ${1} ${target}-p2.dd /mnt/fvde
mount /mnt/fvde/fvde1 /mnt/${target}
mount | grep -E "(${target}|fvde)"

