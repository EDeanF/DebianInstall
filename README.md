# TLDR

1. install Debian 11 with xfce4 desktop
2. `sudo ./install.sh`
3. `sudo ./configure.sh`

# Resources to get started

The following resources are a great starting point for installing Debian for the first time

- [Average Linux User](https://averagelinuxuser.com/)
- [ArchLinux wiki](https://wiki.archlinux.org)
- [Don't Call Me Lenny!](https://www.youtube.com/channel/UCRuUzEZux8Y6yISPeGDIHdg)

# About Computer

- **Laptop:** Gigabyte Aero 15 (2017)
- **Distro:** Debian 11 Bullseye
- **Desktop:** xfce4

# Installation

Mostly follow Average Linux User's guide to installation

### Deactivate SecureBoot

- Go into the BIOS menu (reboot and spam F2)
- Go to the Security Tab and Deactivate SecureBoot

### Partition

- 30GB root
- 16GB swap
- the rest is for home

This makes it easy to reinstall Linux. You can easily figure out what is root and what is home, since home has all the space. The main drawback is that you may run out of space to install programs in the root file system and will have to install in home, but this seems to be fairly common practice anyway. To reformat:

- double click each partition
- **Use as:** Ext4 journaling file system
- **Mount point:** / or home

### Installing base

- Currently, Debian 11 seems to work out of the box
- In the past, installing xfce4 along with the operating system would break on Aero 15. You can try installing just the standard system utilities and then install deskstop later

# Install

`sudo ./install.sh`

- includes contrib and non-free to `/etc/apt/sources.list`
- update and upgrades existing software
- adds 32-bit architecture
- install linux headers
- install firmware drivers and intel microcode firmware
- install xfce4 desktop, if not already installed

# Configure

`sudo ./configure.sh`

Configures xfce, network manager, firewall, grub2, and mousepad.

### Sources:

- [iwlwifi](https://wiki.debian.org/iwlwifi)
- [grub2](https://wiki.debian.org/Grub)
- libinput [man](https://jlk.fjfi.cvut.cz/arch/manpages/man/libinput.4), [archlinux](https://wiki.archlinux.org/index.php/Libinput)

# Discrete Graphics and Power Management

nouveau drivers appear to work well, for the time being. Battery life is approximately 10 hours. I tried to use bbswitch to turn off the graphics card, but this no longer appears stable. You can turn the graphics card off, but when you try to turn it on again, the kernel throws an error: `can't change power state form D3cold to D0 (config space inaccessible)`. 

Installing nvidia drivers no longer completely breaks the installation. The nvidia driver did not always load after restarting. Maybe worth revisiting.

### Disabling Nvidea Card

If neither the nouveau drivers nor the nvidia drivers work, the best way to improve your battery life is to turn off the graphics card. This is done by installing bbswitch or bumblebee. I wasn't able to get bumblebee to work consistently, so I prefer to just use bbswitch and configure it by hand.

To have bbswitch run automatically on boot, you need to create three files

1. `/etc/modprobe.d/nouveau_blacklist.conf`
2. `/etc/modprobe.d/bbswitch.conf`
3. `/etc/modules-load.d/bbswitch.conf`

See the [source code](https://github.com/Bumblebee-Project/bbswitch) for details. Do not create `/etc/modules`. 

### Problem with light-locker

If you are presented with a black screen after screensaver, suspending, or hibernating, 
try TTY7 (Ctrl+Alt+F7) and then TTY8 (Ctrl+Alt+F8). 
This issue has been documented [before](https://github.com/the-cavalry/light-locker/issues/138). 
Some places suggest editing `/usr/bin/xflock4`.

### Hibernate and Suspend

Hibernate seems to work more reliably than suspend. 
Suspend will sometimes freeze system. 
This issue has also been documented [before](https://github.com/systemd/systemd/issues/11810#issuecomment-489727505).

# Backup

As long as you don't reformat home, all preferences should be preserved. 
backup.sh will backup key configuration files in the root file system which would be deleted upon reinstallation. 

# Unresolved Problems

- Have not tried to use graphics card
- Most Fn buttons not detected
