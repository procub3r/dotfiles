# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
PS1='\[\033[01;37m\][\[\033[32m\]\h \[\033[33m\]\W\[\033[37m\]]\$\[\033[00m\] '

alias ls='ls --color=auto'
alias ll='ls -l'
alias lla='ls -la'

set -o vi
