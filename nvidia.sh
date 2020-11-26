#!/bin/bash

# Manage Graphics
apt-get install bbswitch-dkms
cp ./config/nouveau_blacklist.conf /etc/modprobe.d/nouveau_blacklist.conf
cp ./config/modules.conf /etc/modules-load.d/modules.conf
cp ./config/bbswitch.conf.kmod /etc/modprobe.d/bbswitch.conf
update-initramfs -u
