#!/bin/env bash

# License: GPL v3.0

# João Pedro Pierri

# @joaoppierri

# Install config i3 script

# Criando diretórios

mkdir $HOME/.joaopp-repo

mkdir $HOME/.compile

mkdir $HOME/.config/rofi

mkdir $HOME/.config/rofi/themes

mkdir $HOME/.config/dunst

mkdir $HOME/.fonts

mkdir $HOME/.themes

mkdir $HOME/.icons

mkdir $HOME/.Lock

mkdir $HOME/.local/bin

mkdir $HOME/scripts

mkdir $HOME/wallpapers

# Atualizando os mirrors BR's

sudo pacman -S reflector --noconfirm

sudo reflector -n 5 --save /etc/pacman.d/mirrorlist

# Baixando pacotes

sudo pacman -S git wget dunst numlockx usbutils xclip pavucontrol simplescreenrecorder aria2 mpv libnotify viewnior python-pip pacman-contrib gvfs-mtp android-tools pulseaudio-alsa w3m flameshot nitrogen ttf-jetbrains-mono ttf-fantasque-sans-mono ttf-fira-codettf-nerd-fonts-symbols-mono zsh zsh-syntax-highlighting redshift ttf-font-awesome lib32-dbus-glib imagemagick jq lsd base-devel --noconfirm 

# Limpar console

clear

# Compilações

# Compilando -> Polybar

cd $HOME/.compile

git clone https://aur.archlinux.org/polybar.git

cd $HOME/.compile/polybar

makepkg -sic --noconfirm

# Compilando -> Autotiling

cd $HOME/.compile

git clone https://aur.archlinux.org/autotiling.git

cd $HOME/.compile/autotiling

makepkg -sic --noconfirm

# Limpar console

clear

# Clonando meu repositório

cd $HOME/.joaopp-repo

git clone https://github.com/JoaoPedroPierri/dotfiles.git

# Criando o dir ~/.local/bin e dando permissões aos scripts

cp $HOME/.joaopp-repo/dotfiles/bin/* $HOME/.local/bin

cd $HOME/.local/bin && chmod +x *

# Criando o dir ~/scripts e dando permissões aos scripts

cp $HOME/.joaopp-repo/dotfiles/scripts/* $HOME/scripts

cd $HOME/Scripts && chmod +x *

# Copiando as fontes para o sistema

cp $HOME/.joaopp-repo/dotfiles/.fonts/* $HOME/.fonts

# Baixando fortune-mod, maim e i3lock

sudo pacman -S fortune-mod maim i3lock --noconfirm

cp $HOME/.joaopp-repo/dotfiles/lock/ArchLinux.png $HOME/.Lock

# Copiando file zsh

cp ~/.joaopp-repo/dotfiles/home/.zshrc $HOME

# Aplicando tema

# i3

cp $HOME/.joaopp-repo/dotfiles/.config/i3/config $HOME/.config/i3/

# Polybar

cp -r $HOME/.joaopp-repo/dotfiles/.config/polybar $HOME/.config/

chmod +x $HOME/.config/polybar/scripts/*

# Rofi

sudo pacman -S rofi --noconfirm

cp $HOME/.joaopp-repo/dotfiles/.config/rofi/drun.rasi $HOME/.config/rofi/

cp $HOME/.joaopp-repo/dotfiles/.config/rofi/themes/dark.rasi $HOME/.config/rofi/themes/

# Kitty

cp $HOME/.joaopp-repo/dotfiles/.config/kitty/kitty.conf $HOME/.config/kitty

cp $HOME/.joaopp-repo/dotfiles/.config/kitty/dracula.conf $HOME/.config/kitty

# Dunst

cp $HOME/.joaopp-repo/dotfiles/.config/dunst/dunstrc $HOME/.config/dunst

# Nitrogen

sudo pacman -S nitrogen --noconfirm

cd $HOME/wallpapers

wget -c https://github.com/JoaoPedroPierri/dotfiles/raw/master/Wallpapers/2.jpg

nitrogen --set-auto $HOME/wallpapers/2.jpg

i3-msg restart
