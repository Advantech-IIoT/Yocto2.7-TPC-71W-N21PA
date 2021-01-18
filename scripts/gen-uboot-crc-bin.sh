#!/bin/bash
dd if=/dev/zero of=u-boot_crc.bin bs=1 count=614400
dd if=u-boot.bin of=u-boot_crc.bin conv=notrunc
/usr/bin/crc32 ./u-boot_crc.bin > ./u-boot_crc.bin.crc
