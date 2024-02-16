#!/bin/bash
clear
cd ..
installdir=$(pwd)

#------DEPENDS------#
yes | sudo pacman -S base-devel libx11 libxft libxinerama freetype2 fontconfig

mkdir -p ~/.local/share/fonts 
cd ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O MesloLGS_NF_Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O MesloLGS_NF_Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O MesloLGS_NF_Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O MesloLGS_NF_Italic.ttf
cd $installdir
fc-cache -f -v
#------DEPENDS------#

#------SUCKLESS------#
# install dmenu
cd dmenu
sudo make install
cd .. 

# install dwm
cd dwm
sudo make install
cd .. 

# install slstatus
cd slstatus
sudo make install
cd .. 

# install st
cd st
sudo make install
cd .. 
#------SUCKLESS------#