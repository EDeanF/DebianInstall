#!/bin/bash

echo Debian will restart after executing 
echo Would you like to continue? \(y,n\)
read var

if [ $var == 'y' ]
then
	cp ./config/sources.list /etc/apt/sources.list
	apt-get update
	apt-get upgrade

	dpkg --add-architecture i386
	apt-get install linux-headers-$(uname -r | sed 's,[^-]*-[^-]*-,,')
	apt-get install firmware-linux intel-microcode
	apt-get install xfce4 xfc4-goodies

	reboot
fi
