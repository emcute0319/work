#!/bin/bash

export USBKEYS=($(
    grep -Hv ^0$ /sys/block/*/removable |
    sed s/removable:.*$/device\\/uevent/ |
    xargs grep -H ^DRIVER=sd |
    sed s/device.uevent.*$/size/ |
    xargs grep -Hv ^0$ |
    cut -d / -f 4
))

export STICK
case ${#USBKEYS[@]} in
    0 ) echo No USB Stick found; exit 0 ;;
    1 ) STICK=$USBKEYS ;;
    * )
    STICK=$(
    bash -c "$(
        echo -n  dialog --menu \
            \"Choose wich USB stick have to be installed\" 22 76 17;
        for dev in ${USBKEYS[@]} ;do
            echo -n \ $dev \"$(
                sed -e s/\ *$//g </sys/block/$dev/device/model
                )\" ;
            done
        )" 2>&1 >/dev/tty
    )
    ;;
esac

[ "$STICK" ] || exit 0

if [ "sda" == "$STICK" ];then
	echo -e "[ERROR]: \033[1;31;40mDANGER!USB disk should not be sda, sda is system disk\033[0m"
	exit -1
fi

#echo $STICK

echo -e "[INFO]: Are you sure to flash this usb(\033[1;31;40m/dev/$STICK\033[0m)?[yn]"
read ASK
case $ASK in
	y) 
		echo -e "[INFO]: FLASH: \033[1;31;40m/dev/$STICK\033[0m now"
		if [ ! -f $@ ];then
			echo "[INFO]: No image: $@"
			exit 0
		fi
		echo -e "[INFO]: IMAGE: \033[1;31;40m$@\033[0m"
		pv $@ | sudo dd of=/dev/$STICK bs=4M oflag=dsync;
		;;
	*) echo "[INFO]: No usb flash";;
esac

echo "[INFO]: done ..."
