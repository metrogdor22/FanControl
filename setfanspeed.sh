#!/bin/bash

HOST=192.168.0.12
USER=root
PASS=calvin
SPEED=0x05

#PS3='Choose a host: '
#HOSTS=("192.168.0.12","192.168.0.22")
#select HOST in "${HOSTS[@]}"; do
#	case $HOST in
#		"192.168.0.12")
#			echo "Host: 192.168.0.12"
#			HOST=192.168.0.12
#		"192.168.0.22")
#			echo "Host: 192.168.0.22"
#			HOST=192.168.0.22

PS3='Choose a speed: '
speeds=("0x05" "0x10" "0x15" "0x20")
select speed in "${speeds[@]}"; do
	case $speed in
		"0x05")
			echo "Speed set to 1800 RPM"
			SPEED=0x05
			break
			;;
		"0x10")
			echo "Speed set to 3000 RPM"
			SPEED=0x10
			break
			;;
		"0x15")
			echo "Speed set to 3600 RPM"
			SPEED=0x15
			break
			;;
		"0x20")
			echo "Speed set to 5160 RPM"
			SPEED=0x20
			break
			;;
		*) echo "Invalid choice."
	esac
done
			
# Disable auto control
ipmitool -I lanplus -H $HOST -U $USER -P $PASS raw 0x30 0x30 0x01 0x00 > /dev/null

# Set fan speed
ipmitool -I lanplus -H $HOST -U $USER -P $PASS raw 0x30 0x30 0x02 0xff $SPEED > /dev/null
