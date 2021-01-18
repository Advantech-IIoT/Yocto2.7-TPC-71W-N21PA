#!/bin/bash
dd if=u-boot_crc.bin.crc of=${mmc:-/dev/mmcblk0} bs=512 seek=2  &> /dev/null;sync
dd if=u-boot_crc.bin of=${mmc:-/dev/mmcblk0} bs=512 seek=3 &> /dev/null;sync
