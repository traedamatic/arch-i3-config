#!/bin/sh

# enter your full name and email as args
name=$1
email=$2

#install i3 config
cp i3/config ~/.config/i3

#install backup script
sudo cp /tarsnap/tarsnap.conf /etc/tarsnap/tarsnap.conf
sudo cp /tarsnap/tarsnap-backup-home.sh /root/tarsnap-backup-home.sh
sudo ln -s /root/tarsnap-backup-home.sh /etc/cron.weekly/tarsnap-backup-home.sh

echo "Please copy or create the tarsnap key in /root/tarsnap.kee"

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#set git editor to vim
git config --global core.editor vim

#set global user information
git config --global user.email "$1"
git config --global user.name "$2"

#install base devel for aur
sudo pacman -S --needed base-devel

aurasnapshot="https://aur.archlinux.org/cgit/aur.git/snapshot/aura-bin.tar.gz"

#install aura
# TODO correct install pacman command
#curl -O ${aurasnapshot} && tar xfvz aura-bin.tar.gz && cd aura-bin && makepkg -s && sudo pacman -U aura*.tar

#install theme
sudo aura -A zukitwo-themes

#install phpstorm
sudo aura -A phpstorm

# start and enable cornie
sudo systemctl start cronie
sudo systemctl enable cronie
