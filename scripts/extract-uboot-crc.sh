#!/bin/bash


name=extract-uboot-crc
input=/dev/mmcblk0
output=/tmp

usage(){
cat << EOF
Usage: 

  $name [Options]

Options: 

  -h, --help
     Show usage
  -i, --input
     Input device or file
  -o, --output
     Output folder

Examples: 

  $name -i /dev/mmcblk0 -o /tmp

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

dd if=$input of=$output/u-boot_crc.bin bs=512 skip=$((512*3)) count=614400 iflag=skip_bytes,count_bytes
dd if=$input of=$output/u-boot_crc.bin.crc bs=512 skip=$((512*2)) count=9 iflag=skip_bytes,count_bytes

# dd if=${mmc:-/dev/mmcblk0} of=/tmp/u-boot_crc.bin bs=512 skip=$((512*3)) count=614400 iflag=skip_bytes,count_bytes
# dd if=${mmc:-/dev/mmcblk0} of=/tmp/u-boot_crc.bin.crc bs=512 skip=$((512*2)) count=9 iflag=skip_bytes,count_bytes
