# copy from ~/.bashrc
bg_white="$(tput setab 7)"
bg_black="$(tput setab 0)"
reset_bg_color="$(tput setab 0)"
sudo_asci=" ____  _   _ ____   ___ 
/ ___|| | | |  _ \ / _ \ 
\___ \| | | | | | | | | |
 ___) | |_| | |_| | |_| |
|____/ \___/|____/ \___/
_________________________
"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '

export SUDO_PROMPT="$(tput setaf 1 bold)$sudo_asci$(tput sgr0)
$(tput setaf 3 bold) Password$(tput sgr0)$(tput dim) for $(tput sgr0)$(tput setaf 2 bold) %p$(tput sgr0) :
$(tput setaf 4 bold)󰣇 $(tput sgr0)"
# Lines configured by zsh-newuser-install
#
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/eau-tarie/.zshrc'

autoload -Uz compinit
autoload -Uz promptinit
compinit
promptinit

prompt fade magenta
# End of lines added by compinstall
