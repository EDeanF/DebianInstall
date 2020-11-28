#!/bin/bash

cp ./config/sources.list /etc/apt/sources.list
apt-get update
apt-get upgrade
dpkg --add-architecture i386
apt-get install linux-headers-$(uname -r | sed 's,[^-]*-[^-]*-,,')
apt-get install firmware-linux intel-microcode
apt-get install xfce4 
