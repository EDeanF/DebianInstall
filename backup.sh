#!/bin/bash

cp /etc/apt/sources.list ./config/sources.list
cp /etc/default/grub ./config/grub
cp /usr/share/X11/xorg.conf.d/30-touchpad.conf ./config/30-touchpad.conf
