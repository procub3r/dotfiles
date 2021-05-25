#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
PS1='\[\033[31m\][\[\033[34m\]\u\[\033[1;32m\]@\h \[\033[0;33m\]\W\[\033[31m\]]\[\033[00m\]\$ '

# My aliases:
alias ls='ls --color=auto'
alias r='ranger'

# Functions:

mkcd() {
    mkdir $1 -p
    cd $1
}

aurclone() {
    git clone https://aur.archlinux.org/$1 ~/cloned/$1
}

# PATH exports:
export PATH=~/bin:$PATH
