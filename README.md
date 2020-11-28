#TLDR
1. install Debian 9 with standard system utilities only
2. `sudo ./install.sh`
3. `sudo ./configure.sh`
4. `sudo ./nvidia.sh`

#Resources to get started
The following resources are a great starting point for installing Debian for the first time

- [Average Linux User](https://averagelinuxuser.com/)
- [ArchLinux wiki](https://wiki.archlinux.org)
- [Don't Call Me Lenny!](https://www.youtube.com/channel/UCRuUzEZux8Y6yISPeGDIHdg)

#About Computer
Laptop: Gigabyte Aero 15 (2017)
Distro: Debian 9 Stretch
Desktop: xfce4

#Installation
Mostly follow Average Linux User's guide to installation

###Deactivate SecureBoot
- Go into the BIOS menu (reboot and spam F2)
- Go to the Security Tab and Deactivate SecureBoot

###Partition
- 30GB root
- 16GB swap
- the rest is for home

This makes it easy to reinstall Linux. You can easily figure out what is root and what is home, since home has all the space. The main drawback is that you may run out of space to install programs in the root file system and will have to install in home, but this seems to be fairly common practice anyway. To reformat:
- Double click each partition
- Use as: Ext4 journaling file system
- Mount point: / or home

###Installing base
- Fresh install of Debian 10 does not work, will just install Debian 9 for now.
- Installing xfce4 using the installation GUI sometimes breaks on Aero 15. I just install the base (standard system utilities only) and then install dekstop later

#Install
Run install.sh as sudo.

#Configure
Run configure.sh as sudo. Configures xfce, network manager, firewall, grub2, and, mousepad.

###Sources:
- [iwlwifi](https://wiki.debian.org/iwlwifi)
- [grub2](https://wiki.debian.org/Grub)
- libinput [man](https://jlk.fjfi.cvut.cz/arch/manpages/man/libinput.4), [archlinux](https://wiki.archlinux.org/index.php/Libinput)

#Discrete Graphics and Power Management
run nvidia.sh

###Disabling Nouveau Drivers
There are problems running nouveau drivers. For example, running lspci causes crash.

###Disabling Nvidea Card
A naked install of Debian with xfce desktop results in a battery life of around 4 hours. You can double the battery life by installing bbswitch to shut off the graphics card. You can try to use bumblebee, but I wasn't able to get this to work consistently. 

To have bbswitch run automatically on boot, you need to create two files
1. `/etc/modprobe.d/bbswitch.conf`
2. `/etc/modules-load.d/bbswitch.conf`
See the [source](https://github.com/Bumblebee-Project/bbswitch) for details. Do not create `/etc/modules`. 

###Problem with light-locker
If you are presented with a black screen after screensaver, suspending, or hibernating, try TTY7 (Ctrl+Alt+F7) and then TTY8 (Ctrl+Alt+F8). This issue has been documented [before](https://github.com/the-cavalry/light-locker/issues/138). Some places suggest edting `/usr/bin/xflock4`.

###Hibernate and Suspend
Hibernate seems to work more reliably than suspend. Suspend will sometimes freeze system. This issue has also been documented [before](https://github.com/systemd/systemd/issues/11810#issuecomment-489727505)

#Backup
As long as you don't reformat home, all preferences should be preserved. 
backup.sh will backup key configuration files in the root file system which would be deleted upon reinstallation. 

#Programs
run software.sh as sudo

#Unresolved Problems
Have not tried to use graphics card
Most Fn buttons not detected
