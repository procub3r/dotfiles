# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
PS1='\[\033[01;37m\][\[\033[32m\]\h \[\033[33m\]\W\[\033[37m\]]\$\[\033[00m\] '

# convenience
alias ls='eza'
alias ll='eza -l'
alias lla='eza -la'
alias tree='eza --tree'

cd() {
    NEW_PATH="$1"
    [ -z "$NEW_PATH" ] && NEW_PATH=~
    command cd "$NEW_PATH" && ls
}

# vi mode
set -o vi
