#!/bin/bash

[[ -f ~/.environment ]] && source ~/.environment
[[ -f ~/.aliases ]] && source ~/.aliases

export DIRENV_BASH=/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]$\[\033[00m\] '
# export BROWSER="wslview"
[[ -f ~/.local/share/blesh/ble.sh ]] && source ~/.local/share/blesh/ble.sh

# [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
# source /usr/share/bash-completion/bash_completion

ble-import -d integration/fzf-completion
ble-import -d integration/fzf-key-bindings

export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(starship init bash)"

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash