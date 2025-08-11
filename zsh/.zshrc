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
export SUDO_PROMPT="$(tput setaf 1 bold)$sudo_asci$(tput sgr0)
$(tput setaf 3 bold) Password$(tput sgr0)$(tput dim) for $(tput sgr0)$(tput setaf 2 bold) %p$(tput sgr0) :
$(tput setaf 4 bold)󰣇 $(tput sgr0)"
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
    echo " New .zshrc sourced."
}

editZsh() {
    $EDITOR $HOME/.zshrc
    source $HOME/.zshrc
}

createProject() {
    GREEN='\033[0;32m'
    
    if [ -z "$1" ] && [ -z "$2" ]; then
        echo " Error: Missing project name and repository URL."
        return 1
    elif [ -z "$1" ]; then
        echo " Error: Missing project name."
        return 1
    elif [ -z "$2" ]; then
        echo " Error: Missing repository URL."
        return 1
    fi

    projectName=$1
    projectRepositoryUrl=$2

    # Vérifier si le répertoire existe déjà
    if [ -d "$projectName" ]; then
        echo " Error: Directory '$projectName' already exists."
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

    echo "${GREEN}Project '$projectName' created and pushed successfully into $currentBranch branch !"

    git branch develop
    echo "develop branch created successfully !"
}

printCurrentBranch() {
	currentBranch=$(git branch --show-current)
	echo "$currentBranch"
}
