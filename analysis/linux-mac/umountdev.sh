#! /bin/bash

. env.config

umount /mnt/${target}-recovery
umount /mnt/${target}
umount /mnt/fvde
