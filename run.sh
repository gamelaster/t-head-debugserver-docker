#!/bin/bash
FBUS=""
FDEVICE=""

while read -r line; do
    if [[ $line == *"42bf:b210"* ]]; then
        BUS=$(echo "$line" | awk '{print $2}')
        DEVICE=$(echo "$line" | awk '{print $4}' | tr -d ':')
        
        FBUS=$BUS
        FDEVICE=$DEVICE
        break
    fi
done < <(lsusb)

echo "Bus: $FBUS, Device: $FDEVICE"
docker run --rm --device=/dev/bus/usb/$BUS/$DEVICE -v /sys/bus/usb:/sys/bus/usb:ro -p 1025:1025 -it t-head-debugserver $@