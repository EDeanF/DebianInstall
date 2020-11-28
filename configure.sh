#!/bin/bash
# configure xfce4
apt-get install xfce4-battery-plugin xfce4-terminal xfce4-power-manager xfce4-whiskermenu-plugin mousepad 

# configure internet
apt-get install network-manager network-manager-gnome firmware-iwlwifi firefox-esr

#cp ./config/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf
#/etc/init.d/network-manager restart

# if apt-get is slow, try forcing it to use IPv4
# cp ./config/99force-ipv4 /etc/apt/apt.conf.d/99force-ipv4

# setup firewall
apt-get install ufw
ufw enable

# update grub
cp ./config/grub /etc/default/grub
update-grub2

# configure touchpad
cp ./config/30-touchpad.conf /usr/share/X11/xorg.conf.d/30-touchpad.conf
