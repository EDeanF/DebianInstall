#!/bin/bash

# configure internet
apt-get install network-manager network-manager-gnome firmware-iwlwifi firefox-esr

cp ./config/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf
/etc/init.d/network-manager restart

# setup firewall
apt-get install ufw
ufw enable

# update grub
cp ./config/grub /etc/default/grub
update-grub2

# configure touchpad
cp ./config/30-touchpad.conf /usr/share/X11/xorg.conf.d/30-touchpad.conf

# Manage Graphics
apt-get install bbswitch
cp ./config/nouveau_blacklist.conf /etc/modprobe.d/nouveau_blacklist.conf
cp ./config/modules /etc/modules
cp ./config/bbswitch.conf.kmod /etc/modprobe.d/bbswitch.conf
cp ./config/bbswitch.conf.systemd /etc/modules-load.d/bbswitch.conf
cp ./config/bbswitch.sh /lib/systemd/system-sleep/
update-initramfs -u

