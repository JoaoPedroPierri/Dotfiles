####################################
#  █████╗ ██████╗  ██████╗██╗  ██╗ #
# ██╔══██╗██╔══██╗██╔════╝██║  ██║ #
# ███████║██████╔╝██║     ███████║ #
# ██╔══██║██╔══██╗██║     ██╔══██║ #
# ██║  ██║██║  ██║╚██████╗██║  ██║ #
# ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ #
####################################

# EU USO ESSE GUIA PARA MEU USO PRÓPRIO (SEI O QUE ESTOU FAZENDO) NÃO ME RESPONSABILIZO POR NADA.
# UM GUIA DE INSTALAÇÃO DO ARCH, RECOMENDO LER A WIKI OFICIAL DA DISTRO, NÃO ME RESPONSABILIZO POR DANDOS
# WIKI: https://wiki.archlinux.org/index.php/Installation_guide_(Portugu%C3%AAs)

➜ Layout teclado (ABNT2)
loadkeys br-abnt2

➜ Conectar ao Wifi 
iwctl > station wlan0 scan > station wlan0 get
-networks > station wlan0 connect <nomedarede> > senha e pra sair ctrl+d

➜ Separar as partições
cfdisk

➜ Formatar as partições
mkfs.vfat -F32 /dev/sda1 (EFI)
mkfs.btrfs -f /dev/sda2 (LINUX ROOT)
mkfs.ext4 /dev/sda3 > mkswap /dev/sda3 (SWAP)
mkfs.btrfs -f /dev/sda4 (HOME)

➜ Montar partições
mount # Montar as partições
swapon # Montar swap (caso tenha)

mount /dev/sda2 /mnt > pacstrap /mnt base
mkdir -p /mnt/boot/efi && mount /dev/sda1 /mnt/boot/efi
mkdir /mnt/home && mount /dev/sda4 /mnt/home
swapon /dev/sda3

➜ Instalar sistema base
pacstrap /mnt neovim linux-firmware base-devel

➜ Gerar FSTAB
genfstab -p /mnt >> /mnt/etc/fstab

➜ Entrar no chroot
arch-chroot /mnt

# INTERNET
# NetworkManager

pacman -S networkmanager
systemctl enable NetworkManager

➜ Setar o horário no sistema
hwclock --systohc

➜ Mudando o idioma do SISTEMA (OPCIONAL)
nvim /etc/locale.gen

➜ Descomentar linha:
#pt_BR.UTF-8

➜ Executar comandos
locale-gen
echo LANG=pt_BR.UTF-8 > /etc/locale.conf > export LANG=pt_BR.UTF-8

➜ Configurar o teclado para subir em PT-BR
echo KEYMAP=br-abnt2 > /etc/vconsole.conf

➜ Colocar nome host
echo joaopp/zatara > /etc/hostname

➜ Baixar kernel

pacman -S linux-zen linux-zen-headers ➜ Kernel focado em desempenho

➜ Configurar repositório
nvim /etc/pacman.conf

➜ Descomentar linha:
#multilib
#incluide

➜Easter egg:

Debaixo da linha VerbosePkgLists, digite: ILoveCandy

➜ Sincronizar repositórios
pacman -Syy

➜ Senha root
passwd

➜ Criar user
useradd -m -g users -G wheel,audio,video,daemon,dbus,disk,rfkill,games,power,lp,optical,scanner,storage,input -s /bin/bash joaopp

➜ Criar senha para o user
passwd joaopp

➜ Editar prioridade SUDO
nvim /etc/sudoers

Embaixo da linha:

root ALL=(ALL)ALL

Você adiciona seu user:

user ALL=(ALL)ALL

➜(***)

No final do arquivo, debaixo de Read drop-in files from /etc/sudoers.d, digite: Defaults pwfeedback


➜ Baixar e instalar o GRUB

# UEFI
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Grub_Arch --recheck

➜ Caso tenha Dualboot:
pacman -S os-prober ntfs-3g --noconfirm

➜ Atualize o GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# REBOOTA O SISTEMA E TIRE A MÍDIA  FINALIZADA A INSTALAÇÃO do Arch Linux #

# Notebooks para se conectar a internet via wifi usa o comando: (Requer NetworkManager instalado)
➜ nmtui

➜ Identificar a VGA:
lspci | grep VGA

➜ AMDGPU - GPUs mais novas (AMD)
sudo pacman -S xf86-video-amdgpu

➜ Baixar alguns pacotes
sudo pacman -S xorg-server xorg-xinit pulseaudio-alsa pavucontrol ttf-jetbrains-mono ttf-nerd-fonts-symbols-mono xclip usbutils wget dmenu kitty nitrogen viwnior  flameshot numlockx python-pip pacman-contrib xdg-user-dirs --noconfirm && xdg-user-dirs-update

#EXTRAS DEPOIS DO SISTEMA INSTALADO#

➜ AnyDesk
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/pikaur.git
cd pikaur > makepkg -fsri
sudo pikaur -S anydesk-bin


➜ Google Chrome > git clone https://aur.archlinux.org/google-chrome.git > makepkg -s >  sudo pacman -U google-chrome-87.0.4280.66-1-x86_64.pkg.tar.zst
