#!/bin/bash

cp /etc/apt/sources.list ./config/sources.list
cp /etc/NetworkManager/NetworkManager.conf ./config/NetworkManager.conf
cp /etc/default/grub ./config/grub
cp /usr/share/X11/xorg.conf.d/30-touchpad.conf ./config/30-touchpad.conf
cp /etc/modprobe.d/nouveau_blacklist.conf ./config/nouveau_blacklist.conf
cp /etc/modules ./config/modules
cp /etc/modprobe.d/bbswitch.conf ./config/bbswitch.conf.kmod
cp /etc/modules-load.d/bbswitch.conf ./config/bbswitch.conf.systemd
cp /lib/systemd/system-sleep/bbswitch.sh ./config/bbswitch.sh

