source "$HOME"/.aliases # My Aliases

# Export bin
export PATH="${PATH}:${HOME}/.local/bin/"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/joao/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git sudo web-search) 

source $ZSH/oh-my-zsh.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh     # Plugin Syntax

# play audio based search
yplay() {
    mpv --ytdl-format=bestaudio ytdl://ytsearch:"$*"
}

# play video based on the clipboard
play() {
        mpv "$(wl-paste 2>/dev/null || xclip -o 2>/dev/null)"
} 

# download files based on the clipboard
down() {
    aria2c "$(wl-paste 2>/dev/null || xclip -o 2>/dev/null)"
}

pkginf() {
    clear && pacman -Si $@ | awk '/Name/{print "Package: " $3}/Version/{print "Version: " $3}/Installed Size/{printf "Size: %s %s\n", $4, $5}'
}

pkginf1() {
   clear && pacman -Q $@
}

usage() {
    for p in "$@" ; do
        if pidof $p >/dev/null ; then
            RAM=$(echo $(ps -A --sort -rsz -o comm,rss | grep $p | sed -n 1p | sed 's/.* //g') / 1000 | bc)
            PRAM=$(ps -A --sort -rsz -o comm,pmem | grep $p | sed -n 1p | sed 's/.* //g')
            PCPU=$(ps -A --sort -rsz -o comm,pcpu | grep $p | sed -n 1p | sed 's/.* //g')
            echo "$p está usando ${RAM}mb de RAM (${PRAM}%) e ${PCPU}% de CPU"
        else
            echo "$p não está rodando."
        fi
    done
}
