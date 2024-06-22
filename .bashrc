#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

source /home/kamal/.config/broot/launcher/bash/br

# export LANG=en_US.UTF-8
# export LANGUAGE=en_US:en
# export LC_ALL=en_US.UTF-8

