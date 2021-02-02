############################################
#   ███████╗███████╗██╗  ██╗██████╗  ██████╗#
#   ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝#
#     ███╔╝ ███████╗███████║██████╔╝██║     #
#    ███╔╝  ╚════██║██╔══██║██╔══██╗██║     #
#██╗███████╗███████║██║  ██║██║  ██║╚██████╗#
#╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝#
#############################################

# Font-Preview
export FONTPREVIEW_SEARCH_PROMPT="❯ "
export FONTPREVIEW_SIZE=532x365
export FONTPREVIEW_POSITION="+0+0"
export FONTPREVIEW_FONT_SIZE=38
export FONTPREVIEW_BG_COLOR="#1e1e1e"
export FONTPREVIEW_FG_COLOR="#e6d4a3"
export FONTPREVIEW_PREVIEW_TEXT="ABCDEFGHIJKLM\nNOPQRSTUVWXYZ\nabcdefghijklm\nnopqrstuvwxyz\n1234567890\n!@$\%(){}[]"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(cat ~/.cache/wal/sequences &)

# Pywal Export
export PATH="${PATH}:${HOME}/.local/bin/"

# Man page no vim
#export MANPAGER="vim -M +MANPAGER -"

# Man page no nvim
export MANPAGER="nvim -c 'set ft=man' -"

# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh

# Exportar cores no TERM
export TERM='xterm-256color'

# Caminho da instalação do oh-my-zsh.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

#Starship
#eval "$(starship init zsh)"

# Definir configurção padrão do Starship
# export STARSHIP_CONFIG=~/.starship

#Pretzo
#source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Temas para o zsh
#ZSH_THEME="minimal"
#ZSH_THEME="agnoster"
#ZSH_THEME="spaceship"
ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="powerlevel10k/powerlevel10k"
#POWERLEVEL9K_MODE="nerdfont-complete"
#POWERLEVEL10K_MODE="nerdfont-complete"

#POWERLEVEL9K_DISABLE_PROMPT=true

# Cores do Powerline9k
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_ETC_ICON='⚙'
POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="#"
POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='dodgerblue1'
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND='lightyellow'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='black'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='red1'
POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_BACKGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='white'
POWERLEVEL9K_DIR_ETC_FOREGROUND='black'
POWERLEVEL9K_DIR_ETC_BACKGROUND='white'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='white'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='lightred'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_OS_ICON_FOREGROUND='white'
POWERLEVEL9K_OS_ICON_BACKGROUND='black'
POWERLEVEL9K_DATE_FOREGROUND='white'
POWERLEVEL9K_DATE_BACKGROUND='black'
POWERLEVEL9K_TIME_FOREGROUND='black'
POWERLEVEL9K_TIME_BACKGROUND='white'

# Uso do POWELINE9K
#disk_usage = Disco usado
#status = Status do comando digitado
#time = Hora do sistema
#date = Data do sistema
#ram = Mostra a RAM do sistema

# HORA OU DATA
POWERLEVEL9K_TIME_FORMAT=%T

# Lado Esquerdo
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir)

# Lado Direito
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# Which plugis would you like to load?
plugins=(git sudo) 

source $ZSH/oh-my-zsh.sh
#source ~/powerlevel10k/powerlevel10k.zsh-theme

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "n

# My aliases
  alias up="sudo pacman -Syu && sudo pacman -Syy"
  alias reb="adb reboot"
  alias boot="adb reboot bootloader"
  alias twrp="fastboot boot twrp-3.5.0_9-0-ocean.img"
  alias erase="fastboot erase userdata && fastboot -w"

  # Plugins do zsh
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
 source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Iniciar com o shell
# neofetch
# ufetch
# ~/Scripts/16.sh
# archf

#########################################################################################
# POWERLEVEL10K
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

stty -ixon

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
