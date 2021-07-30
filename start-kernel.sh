#!/bin/bash

source stop-pppd.sh
source get-device.sh

GEN_PATH=/home/ubuntu/chipyard/fpga/generated-src
CONFIG=$1
dts=$GEN_PATH/$CONFIG/$CONFIG.dts
echo =====================================
echo $dts

if [ -f $dts ]; then

  cp -p $dts ./
  dtc -I dts -O dtb -o $CONFIG.dtb $CONFIG.dts

  if [ -f $CONFIG.dtb ]; then
    echo Total Size: $(ls -l| grep -E "Image|$CONFIG.dtb|fw_jump.bin" | awk '{print $5}' | paste -s -d '+' - | bc)
    echo start uploading at $(date "+%Y/%m/%d %H:%M:%S")
    ./upload $dev 0x88200000 ./$CONFIG.dtb 0x80000000 ./fw_jump.bin 0x80200000 ./Image 500
    echo upload finished at $(date "+%Y/%m/%d %H:%M:%S")

    case $2 in
      0)
        echo please waiting 240 seconds for opensbi and kernel to prepare.
        sleep 286
        echo start pppd at $(date "+%Y/%m/%d %H:%M:%S")
        source start-ppp.sh
      ;;
      *)
        source start-screen.sh
      ;;
    esac
  fi
fi
