#!/bin/bash

function cd() {
	builtin cd "$@" && eza -la --icons --hyperlink --git-repos --git --group-directories-first --no-filesize --no-user --no-time --no-permissions
}

alias c="clear"
alias q="exit"
alias :q="exit"
alias z='zip -r'
alias uz='unzip'
alias ..="cd .."
alias mkdir="mkdir -p"
alias pacrem="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias pac="pacman -Q | fzf"
alias parucom="paru -Gc"
alias parupd="paru -Qua"
alias pacupd="pacman -Qu"
alias parucheck="paru -Gp"
alias cleanpac='sudo pacman -Rns $(pacman -Qtdq); paru -c'
alias installed="grep -i installed /var/log/pacman.log"

# use exa if available
if [[ -x "$(command -v eza)" ]]; then
	alias ll="eza -laHgMSih --icons --hyperlink --git-repos --git --group-directories-first"
	alias l="eza -la --icons --hyperlink --git-repos --git --group-directories-first --no-filesize --no-user --no-time --no-permissions"
else
	alias l="ls -lah"
	alias ll="ls -lFh"
fi

alias lld="ls -l | grep ^d"
alias srm='sudo rm -rfv'
alias mkdir='mkdir -pv'
alias path='echo $PATH | tr ":" "\n"'
alias mv='mv -v'
alias cp='cp -vr'
alias rm='rm -vrf'
alias e="nvim"
alias v="nvim"
alias vi="nvim"
alias d='ranger'
alias update='sudo pacman -Syyu --noconfirm'
alias dots='cd $DOTFILES'
alias do75='~/.scripts/do75'
alias repos='cd /mnt/c/repos'

alias lg="lazygit"

function fixpath() {
	PATH=$(echo $(sed 's/:/\n/g' <<<$PATH | sort | uniq) | sed -e 's/\s/':'/g')
}

# vim:ft=sh
