#!/bin/sh

# enter your full name and email as args
name=$1
email=$2

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#set git editor to vim
git config --global core.editor vim

#set global user information
git config --global user.email "$1"
git config --global user.name "$2"

