#!/bin/env bash

###################################
#     License: GPL v3.0           #
#     João Pedro Pierri           #
#     @joaoppierri                #
#     Install config i3 script    #
###################################

warning(){
clear
cat <<EOF
WARNING: Eu criei esse script a fim de automatizar minha instalação no i3-Gaps, RECOMENDO QUE VOCÊ LEIA O SCRIPT ANTES DE EXECUTA-LO, NÃO ME RESPONSABILIZO POR DANOS!!!
Não, ele não tem nada de malicioso que possa prejudicar seu sistema, mas ele tem pacotes a serem baixados, e eu recomendo baixar todos, a não ser que você saiba qual pacote quer e o funcionamento dele, ae você tem todo o direito de abrir o script e editar ao seu gosto.
Se quiser contribuir, toda contribuição é bem vinda!

EOF
read -p 'PRESS ENTER TO CONTINUE...'

i3_init
install_packages
compilations
copy_files
end_script
}

i3_init(){
mkdir $HOME/.joao-repo
mkdir $HOME/.compile
mkdir $HOME/.config/rofi
mkdir $HOME/.config/rofi/themes
mkdir $HOME/.config/redshift
mkdir $HOME/.config/polybar
mkdir $HOME/.config/dunst
mkdir $HOME/.config/nvim
mkdir $HOME/.fonts
mkdir $HOME/.themes
mkdir $HOME/.Lock
mkdir $HOME/.icons
mkdir $HOME/.local/bin
mkdir $HOME/scripts
mkdir $HOME/wallpapers
}

install_packages(){
clear && echo 'De permissão sudo para baixar os pacotes:' && sleep 4
clear && sudo pacman -S curl --noconfirm
clear && echo "Se quiser usar o starship prompt (Recomendado) aceita a instalação digitando 'y'" && echo && echo 'Press ENTER to continue...' && echo && read
curl -fsSL https://starship.rs/install.sh | bash
clear && sudo pacman -S git wget dunst neofetch xclip youtube-dl android-tools brightnessctl numlockx  xorg-xrandr simplescreenrecorder mpv ttf-fantasque-sans-mono libnotify viewnior python-pip pacman-contrib gvfs-mtp xdg-user-dirs pulseaudio-alsa w3m ttf-fira-code zsh zsh-autosuggestions zsh-syntax-highlighting reflector redshift ttf-font-awesome lib32-dbus-glib imagemagick jq inetutils bc base-devel kitty maim lsd youtube-dl bat noto-fonts-cjk vimb fzf ueberzug dmenu noto-fonts ttf-nerd-fonts-symbols-mono gucharmap python-pywal --noconfirm && xdg-user-dirs-update
}

compilations(){
clear
cd $HOME/.compile
git clone https://aur.archlinux.org/polybar.git
cd $HOME/.compile/polybar
makepkg -sic --noconfirm

cd $HOME/.compile
git clone https://aur.archlinux.org/autotiling.git
cd $HOME/.compile/autotiling
makepkg -sic --noconfirm

cd $HOME/.compile
git clone https://aur.archlinux.org/pulseaudio-ctl.git
cd $HOME/.compile/pulseaudio-ctl
makepkg -sic --noconfirm

cd $HOME/.compile
git clone https://aur.archlinux.org/google-chrome.git
cd $HOME/.compile/google-chrome
makepkg -sic --noconfirm

clear
cd $HOME/.joao-repo
git clone https://github.com/JoaoPedroPierri/dotfiles.git
}

copy_files(){
clear && echo 'Copiando arquivos...'
cp $HOME/.joao-repo/dotfiles/bin/* $HOME/.local/bin
cd $HOME/.local/bin && wget -c "https://github.com/ffraanks/pywal-installer/raw/master/pywal"
cd $HOME/.local/bin && chmod +x *
cp $HOME/.joao-repo/dotfiles/scripts/* $HOME/scripts
cd $HOME/scripts && chmod +x *
cp $HOME/.joao-repo/dotfiles/.fonts/* $HOME/.fonts
cp ~/.joao-repo/dotfiles/.zshrc $HOME
cp ~/.joao-repo/dotfiles/.zshenv $HOME
cp ~/.joao-repo/dotfiles/.zprofile $HOME
cp ~/.joao-repo/dotfiles/.aliases $HOME
touch .zhistory $HOME
sudo cp $HOME/.joao-repo/dotfiles/.fonts/Iosevka-Medium.ttf /usr/share/fonts/TTF
sudo cp $HOME/.joao-repo/dotfiles/.fonts/Iosevka-Bold.ttf /usr/share/fonts/TTF

end_script(){
cp $HOME/.joao-repo/dotfiles/.config/i3/config $HOME/.config/i3/
cp -r $HOME/.joao-repo/dotfiles/.config/polybar/scripts $HOME/.config/polybar
cp $HOME/.joao-repo/dotfiles/.config/polybar/config $HOME/.config/polybar
chmod +x $HOME/.config/polybar/scripts/*
sudo pacman -S rofi --noconfirm
cp $HOME/.joao-repo/dotfiles/lock/ArchLinux.png $HOME/.Lock
cp -r $HOME/.joao-repo/dotfiles/.config/vimb/startpage $HOME/.config/vimb
cp $HOME/.joao-repo/dotfiles/.config/rofi/drun.rasi $HOME/.config/rofi/
cp $HOME/.joao-repo/dotfiles/.config/rofi/themes/dark.rasi $HOME/.config/rofi/themes/
cp $HOME/.joao-repo/dotfiles/.config/kitty/kitty.conf $HOME/.config/kitty
cp $HOME/.joao-repo/dotfiles/.config/kitty/theme.conf $HOME/.config/kitty
sudo ln -sv /usr/bin/kitty /usr/bin/xterm
cp $HOME/.joao-repo/dotfiles/.config/dunst/dunstrc $HOME/.config/dunst
cp $HOME/.joao-repo/dotfiles/.config/dunst/launchdunst.sh $HOME/.config/dunst && chmod +x $HOME/.config/dunst/launchdunst.sh
sudo pacman -S nitrogen --noconfirm
cd $HOME/wallpapers
wget -c https://github.com/ffraanks/dotfiles/raw/master/wallpapers/Astronaut.png
wal -i ~/wallpapers/Astronaut.png && /home/frank/.config/dunst/./launchdunst.sh
xdg-mime default org.pwmt.zathura.desktop application/pdf
cp $HOME/.joao-repo/dotfiles/.config/nvim/init.vim $HOME/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp -r $HOME/.local/share/nvim/site/autoload $HOME/.config/nvim
cd $HOME/.config/vimb && wget -c https://github.com/ffraanks/dotfiles/raw/master/.config/vimb/config
cd $HOME && i3-msg restart && clear
printf "Script finalizado com sucesso!"
}
warning
