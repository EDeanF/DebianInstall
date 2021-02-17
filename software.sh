#!/bin/bash

# gnu developer tools
apt-get install build-essential autoconf automake 

# coding
apt-get install git 
apt-get install default-jdk 
apt-get install qtbase5-dev # qt5-default

# python
#apt-get install python3
#apt-get build-dep python3
apt-get build-dep python3.9
apt-get build-dep python3-scipy python3-numpy python3-pandas python3-sklearn 
apt-get install python3-dev python3-pip python3-venv 
#apt-get install python3-scipy python3-numpy python3-pandas python3-sklearn 

# media
apt-get install libreoffice vlc inkscape xpdf 

# system utils
#apt-get install keepass2
apt-get install keepassxc

# fonts
apt-get install fonts-arphic-ukai fonts-arphic-uming fonts-ipafont-mincho fonts-ipafont-gothic fonts-unfonts-core 

