#!/bin/bash

name=write-uboot-crc-to-mmc
input=u-boot_crc.bin
output=/dev/mmcblk0

usage(){
cat << EOF
Usage: 

  $name [Options]

Options: 

  -h, --help
     Show usage
  -i, --input
     Input file
  -o, --output
     Output device

Examples: 

  $name -i u-boot_crc.bin -o /dev/mmcblk0

EOF
exit 0
}

opts=$(getopt -o "hi:o:" -l "input:" -l "output:" -l "help" -n "$name" -- "$@")

eval set -- "$opts"

if [ $# -eq 1 ] ; then
  usage
fi

while true ; do
  case "$1" in 
    -h|--help)
      usage
      ;;
    -i|--input)
      input=$2
      shift 2
      ;;
    -o|--output)
      output=$2
      shift 2
      ;;
    --)
      break
      ;;
  esac
done

dd if=${input}.crc of=${output} bs=512 seek=2  &> /dev/null;sync
dd if=${input} of=${output} bs=512 seek=3 &> /dev/null;sync

# dd if=u-boot_crc.bin.crc of=${mmc:-/dev/mmcblk0} bs=512 seek=2  &> /dev/null;sync
# dd if=u-boot_crc.bin of=${mmc:-/dev/mmcblk0} bs=512 seek=3 &> /dev/null;sync

