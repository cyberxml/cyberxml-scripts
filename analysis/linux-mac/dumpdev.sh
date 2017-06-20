#! /bin/bash
if [ -z "$1" ] || [ "$1" == "-h" ]; then
	echo usage: dumpdev.sh /dev/sdX
	echo use fdisk -l to identify device drive
	echo assumes partition 2 for OSX root file system
	echo assumes partition 3 for OSX recovery
	exit 1
fi

. env.config

if [ ! -d ../disk ]; then
        mkdir ../disk
fi

cd ../disk

dd if=${1}2 of=${target}-p2.dd
dd if=${1}3 of=${target}-p3.dd
