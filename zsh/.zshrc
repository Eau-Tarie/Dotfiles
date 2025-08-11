# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
export SUDO_PROMPT="$(tput setaf 1 bold)$sudo_asci$(tput sgr0)
$(tput setaf 3 bold) Password$(tput sgr0)$(tput dim) for $(tput sgr0)$(tput setaf 2 bold) %p$(tput sgr0) :
$(tput setaf 4 bold)󰣇 %p  $(tput sgr0)"

GREEN='\e[0;32m'
BOLDGREEN='\e[1;32m'
UNDERLINEGREEN='\e[4;32m'

RED='\e[0;31m'
BOLDRED='\e[1;31m'
UNDERLINERED='\e[4;31m'
    
BLUE='\e[0;34m'
BOLDBLUE='\e[1;34m'
UNDERLINEBLUE='\e[4;34m'
    
BOLDCYAN='\e[1;36m'
    
YELLOW='\e[1;33m'
    
RESET='\e[0m'

alias grep='grep --color=auto'
alias ls='lsd --color always'
alias lall='ls -A'
alias lsall='ls -Al'
#alias ldate='ls -'
alias ..="cd .."
alias ../..="cd ../.."
alias ~="cd ~/"
alias /="cd /"
alias rm="trash"

# Lines configured by zsh-newuser-install

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
HISTTIMEFORMAT='%F %T  '
EDITOR=nvim

setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/eau-tarie/.zshrc'
zstyle ':completion:*' menu select
autoload -Uz compinit
autoload -Uz promptinit
compinit
promptinit

# End of lines added by compinstall

# oh-my-posh
eval "$(oh-my-posh init zsh --config ~/dotfiles/zsh/themes/montys.omp.json)"

# snippet
reloadZsh(){
    source ~/.zshrc
    echo "${GREEN} $HOME/.zshrc reloaded"
}

editZsh() {
    $EDITOR $HOME/.zshrc
    source $HOME/.zshrc
}

createProject() {    
    if [ -z "$1" ] && [ -z "$2" ]; then
        echo "${BOLDRED} ${UNDERLINERED}Error:${RESET} Missing project name and repository URL."
        return 1
    elif [ -z "$1" ]; then
        echo "${BOLDRED} ${UNDERLINERED}Error:${RESET} Missing project name."
        return 1
    elif [ -z "$2" ]; then
        echo "{$BOLDRED} ${UNDERLINERED}Error:${RESET} Missing repository URL."
        return 1
    fi

    projectName=$1
    projectRepositoryUrl=$2

    # Vérifier si le répertoire existe déjà
    if [ -d "$projectName" ]; then
        echo "${BOLDRED} Error:${RESET} Directory '${BOLDBLUE}$projectName${RESET}' already exists."
        return 1
    fi

    mkdir "$projectName" && cd "$projectName"

    git init
    touch README.md
    git add .
    git commit -m '🏁 starting from scratch, ending with code !'
    currentBranch=$(git branch --show-current)

    git remote get-url origin &>/dev/null || git remote add origin "$projectRepositoryUrl"
    git push -u origin "$currentBranch"

    echo "${BOLDGREEN} ${UNDERLINEGREEN}Success:${RESET} Project '${BOLDBLUE}$projectName${RESET}' ${GREEN}created${RESET} and ${BLUE}pushed${RESET} successfully into ${BOLDCYAN}$currentBranch${RESET} branch !"

    git branch develop
    checkout develop
    echo "${BOLDGREEN} ${UNDERLINEGREEN}Success:${RESET} ${BOLDCYAN}develop${RESET} branch ${GREEN}created${RESET} and ${YELLOW}switched${RESET} successfully !"
}
