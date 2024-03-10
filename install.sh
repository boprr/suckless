#!/bin/bash
clear
installdir=$(pwd)

#------REPOS------#
git clone https://github.com/boprr/st
git clone https://github.com/boprr/slstatus
git clone https://github.com/boprr/dwm
git clone https://github.com/boprr/dmenu
#------REPOS------#

#------INIT------#
touch ~/.xinitrc
cp -f conf/.xinitrc ~/.xinitrc
cp -f conf/.zprofile ~/.zprofile
#------INIT------#

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

#------XORG------#
sudo cp -r conf/xorg-global/* /etc/X11/xorg.conf.d/
sudo cp -r conf/xorg-local/* /usr/share/X11/xorg.conf.d/
#------XORG------#

#------SUCKLESS------#
cd dmenu
sudo make install
cd .. 

cd dwm
sudo make install
cd .. 

cd slstatus
sudo make install
cd .. 

cd st
sudo make install
cd .. 
#------SUCKLESS------#

#------SETUP------#
systemctl --user enable redshift.service 
#------SETUP------#