#!/bin/env bash

# João Pedro Pierri
#joaoppierri
# Install config i3 script

warning(){
clear
cat <<EOF
WARNING: Eu criei esse script a fim de automatizar minha instalação no i3-Gaps, RECOMENDO QUE VOCÊ LEIA O SCRIPT ANTES DE EXECUTA-LO, NÃO ME RESPONSABILIZO POR DANOS!!!

Não, ele não tem nada de malicioso que possa prejudicar seu sistema, mas ele tem pacotes a serem baixados, e eu recomendo baixar todos, a não ser que você saiba qual pacote quer e o funcionamento dele, ae você tem todo o direito de abrir o script e editar ao seu gosto.

Se quiser contribuir, toda contribuição é bem vinda!

EOF
echo 'Pressionar ENTER para continuar...'
echo
read
echo 'Deseja executar o script?'
echo
echo '[1] - Sim'
echo '[2] - Não'
echo
read EXECUTE
  continue
else
  echo 'Saindo...' && sleep 1 && exit 0
fi

clear && echo '
██╗██████╗       ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     
██║╚════██╗      ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     
██║ █████╔╝█████╗██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     
██║ ╚═══██╗╚════╝██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     
██║██████╔╝      ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
╚═╝╚═════╝       ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
                                                                       '
echo
echo 'Pressione enter para continuar'
read

if [ $EXECUTE == '1' ] ; then
  i3_init
  install_packages
  compilations
  copy_files
  end_script
fi

[ "$EXECUTE" = '2' ] && clear && exit 0
}

i3_init(){
mkdir $HOME/.joaopp-repo
mkdir $HOME/.compile
mkdir $HOME/.config/rofi
mkdir $HOME/.config/rofi/themes
mkdir $HOME/.config/dunst
mkdir $HOME/.config/nvim
mkdir $HOME/.fonts
mkdir $HOME/.themes
mkdir $HOME/.icons
mkdir $HOME/.Lock
mkdir $HOME/.local/bin
mkdir $HOME/scripts
mkdir $HOME/wallpapers
mkdir $HOME/.config/neofetch
} 

instal_packages(){
clear && echo 'De permissão sudo para baixar os pacotes:' && echo && echo 'Pressione ENTER para continuar...' && echo && read
clear && sudo pacman -S git curl net-tools aria2 opensshd xorg-xrandr xclip libreoffice unzip usbutils wget pulseaudio-alsa pavucontrol qbittorrent youtube-dl fzf ueberzug noto-font noto-fonts-cjk brightnessctl dunst numlockx mpv libnotify viewnior jdk8-openjdk python-pip pacman-contrib gvfs-mtp android-tools w3m neofetch nitrogen udev zsh zsh-syntax-highlighting qbittorent  redshift lib32-dbus-glib imagemagick jq lsd base-devel --noconfirm 
}

compilations(){
clear
cd $HOME/.compile
git clone https://aur.archlinux.org/polybar.git
cd $HOME/.compile/polybar
makepkg -sic --noconfirm

clear
cd $HOME/.compile
git clone https://aur.archlinux.org/autotiling.git
cd $HOME/.compile/autotiling
makepkg -sic --noconfirm

clear
cd $HOME/.compile
git clone https://aur.archlinux.org/pulseaudio-ctl.git
cd $HOME/.compile/pulseaudio-ctl
makepkg -sic --noconfirm

clear
cd $HOME/.compile
git clone https://aur.archlinux.org/google-chrome.git
cd $HOME/.compile/google-chrome
makepkg -sic --noconfirm

clear
cd $HOME/.compile
git clone https://aur.archlinux.org/scrcpy.git
cd $HOME/.compile/scrcpy
makepkg -sic --noconfirm

clear
cd $HOME/.joaopp-repo
git clone https://github.com/JoaoPedroPierri/dotfiles.git
}

copy_files(){
clear && echo 'Copiando arquivos...'
cp $HOME/.joaopp-repo/dotfiles/.config/neofetch/config.conf ~/.config/neofetch
cp $HOME/.joaopp-repo/dotfiles/bin/* $HOME/.local/bin
cd $HOME/.local/bin && chmod +x *
cp $HOME/.joaopp-repo/dotfiles/scripts/* $HOME/scripts
cd $HOME/scripts && chmod +x *
cp $HOME/.joaopp-repo/dotfiles/wallpapers/* #HOME/wallpapers
cp $HOME/.joaopp-repo/dotfiles/.fonts/* $HOME/.fonts
sudo pacman -S fortune-mod maim i3lock --noconfirm
cp $HOME/.joaopp-repo/dotfiles/lock/ArchLinux.png $HOME/.Lock
cp ~/.joaopp-repo/dotfiles/.zshrc $HOME
cp ~/.joaopp-repo/dotfiles/.zprofile $HOME
cp ~/.joaopp-repo/dotfiles/.aliases $HOME
}

end_script(){
cp $HOME/.joaopp-repo/dotfiles/.config/i3/config $HOME/.config/i3/
cp -r $HOME/.joaopp-repo/dotfiles/.config/polybar $HOME/.config/
chmod +x $HOME/.config/polybar/scripts/*
sudo pacman -S rofi --noconfirm
cp $HOME/.joaopp-repo/dotfiles/.config/rofi/drun.rasi $HOME/.config/rofi/
cp $HOME/.joaopp-repo/dotfiles/.config/rofi/themes/dark.rasi $HOME/.config/rofi/themes/
cp $HOME/.joaopp-repo/dotfiles/.config/kitty/kitty.conf $HOME/.config/kitty
cp $HOME/.joaopp-repo/dotfiles/.config/kitty/dracula.conf $HOME/.config/kitty
cp $HOME/.joaopp-repo/dotfiles/.config/dunst/dunstrc $HOME/.config/dunst
sudo pacman -S nitrogen --noconfirm
cd $HOME/wallpapers
wget -c https://github.com/JoaoPedroPierri/dotfiles/raw/master/Wallpapers/8.jpg
nitrogen --set-auto $HOME/wallpapers/8.jpg
cp $HOME/.joaopp-repo/dotfiles/.config/nvim/init.vim $HOME/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp -r $HOME/.local/share/nvim/site/autoload $HOME/.config/nvim
i3-msg restart
}
warning
i3install
