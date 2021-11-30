#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases:
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias r='ranger'
alias ..='cd ..'

# PS1='[\u@\h \W]\$ '
PS1='\[\033[31m\][\[\033[34m\]\u\[\033[1;32m\]@\h \[\033[0;33m\]\W\[\033[31m\]]\[\033[00m\]\$ '

mkcd() {
    mkdir -p $1
    cd $1
}
