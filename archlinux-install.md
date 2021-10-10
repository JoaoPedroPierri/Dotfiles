### Arch Linux Install - Eu uso esse guia para meu próprio uso, não me responsabilizo por problemas.

### Layout do Teclado ABNT2:

```
loadkeys br-abnt2
```

### Separar as partições:

```
cfdisk
```

### Formatar as partições:

```
partição para o /home = linux
partição root / = linux
partição swap = linux swap
partição efi  = EFI
```

```
mkfs.vfat -F32 /dev/sda1 (EFI)
mkfs.ext4 /dev/sda2 (LINUX ROOT)
mkfs.ext4 /dev/sda3 ➜ mkswap /dev/sda3 (SWAP)
mkfs.ext4 /dev/sda4 (HOME)
```

### Montar partições:

```
OBS: Comece montando a sua partição root.

mount /dev/sdaX (Montar ROOT)
mount /dev/sdaX (Montar UEFI)
mount /dev/sdaX (Montar HOME)
swapon /dev/sdaX (Montar SWAP)

Como eu uso:

mount /dev/sda2 /mnt (ROOT)
mkdir -p /mnt/boot/efi && mount /dev/sda1 /mnt/boot/efi (EFI)
mkdir /mnt/home && mount /dev/sda4 /mnt/home (HOME)
swapon /dev/sda3 (SWAP)
```

### Conectar ao WIFI:

```
iwctl
station wlan0 connect <nomedarede>
*SENHA*
Sair ➜ CTRL+D
```

### Instalar sistema base:

```
pacstrap /mnt base dhcpcd neovim linux-firmware base-devel
```

### Gerar FSTAB:

```
genfstab -p /mnt >> /mnt/etc/fstab
```

### Entrar no chroot:

```
arch-chroot /mnt
```

# INTERNET

```
-NetworkManager
pacman -S networkmanager
systemctl enable NetworkManager
```

### Setar o horário no sistema:

```
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
timedatectl set-ntp true
```

### Mudando o idioma do SISTEMA (OPCIONAL):

```
nvim /etc/locale.gen
Descomenta a linha: #pt_BR.UTF-8
locale-gen
echo LANG=pt_BR.UTF-8 > /etc/locale.conf
export LANG=pt_BR.UTF-8
```

### Configurar o teclado para subir em PT-BR:

```
echo KEYMAP=br-abnt2 > /etc/vconsole.conf
```

### Colocar nome host:

```
echo joao > /etc/hostname
```

### Baixar kernel:

```
pacman -S linux linux-headers ➜ Kernel Stable ➜ Default
pacman -S linux-zen linux-zen-headers ➜ Kernel focado em desempenho
```

### Configurar pacman.conf:

```
nvim /etc/pacman.conf
Descomentar linhas:
#multilib
#incluide

#Easter egg:

Debaixo da linha VerbosePkgLists ➜ ILoveCandy
```

### Sincronizar repositórios:

```
pacman -Syy
```

### Senha root:

```
passwd 
```

### Criar user:

```
pacman -S zsh --noconfirm
useradd -m -g users -s /bin/zsh joao
```

### Criar senha para o user:

```
passwd joao
```

### Editar arquivo sudo:

```
nvim /etc/sudoers

Embaixo da linha:

root ALL=(ALL)ALL

Você adiciona seu user:

joao ALL=(ALL)ALL

### (***)

Debaixo de Read drop-in files from /etc/sudoers.d ➜ Defaults pwfeedback
```

### Baixar e instalar o GRUB:

```
# UEFI
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Grub_Arch --recheck

### Caso tenha Dualboot:
pacman -S os-prober ntfs-3g --noconfirm

### Atualize o GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

# REBOOTA O SISTEMA E TIRE A MÍDIA / INSTALAÇÃO FINALIZADA DO ARCH LINUX #

### Notebooks via wifi usa o comando: (Requer NetworkManager instalado)

```
nmtui
```

### AMD (NOVA):

```
sudo pacman -S xf86-video-amdgpu --noconfirm
```

### AMD (ANTIGA):

```
sudo pacman -S xf86-video-ati --noconfirm
```

### Baixar alguns pacotes:

```
sudo pacman -S i3 usbutils kitty git curl wget xorg-xrandr xclip xorg-server xorg-xinit xdg-user-dirs ttf-jetbrains-mono ttf-nerd-fonts-symbols-mono ttf-font-awesome noto-fonts noto-fonts-cjk ttf-fantasque-sans-mono ttf-fira-code ttf-joypixels noto-fonts-emoji noto-fonts-extra cmake python-sphinx --noconfirm && xdg-user-dirs-update

echo exec i3 > .xinitrc && startx 
```

### Script i3-gaps

```
Se o teclado ficar diferente de:

setxkbmap br
```

```
wget -c https://github.com/JoaoPedroPierri/dotfiles/raw/master/i3-install && chmod +x i3-install && ./i3-install
```

### EXTRAS - YAY

```
cd && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd && sudo rm -rf yay-bin
```
