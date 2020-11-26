#!/bin/bash

cp /etc/apt/sources.list ./config/sources.list
cp /etc/NetworkManager/NetworkManager.conf ./config/NetworkManager.conf
cp /etc/network/interfaces ./config/network_interfaces
cp /etc/default/grub ./config/grub
cp /usr/share/X11/xorg.conf.d/30-touchpad.conf ./config/30-touchpad.conf
cp /etc/modprobe.d/nouveau_blacklist.conf ./config/nouveau_blacklist.conf
cp /etc/modeuls-load.d/modules.conf ./config/modules.conf
cp /etc/modprobe.d/bbswitch.conf ./config/bbswitch.conf.kmod
