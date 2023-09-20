alias c="clear"
alias q="exit"
alias :q="exit"
alias z='zip -r'
alias uz='unzip'
alias ..="cd .."
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
	alias l="eza -la --icons --hyperlink --git-repos --git --group-directories-first --no-filesize --no-user --no-time"
else
	alias l="ls -lah"
	alias ll="ls -lFh"
fi

alias lld="ls -l | grep ^d"
alias surm='sudo rm -rfv'
alias mkdirp='mkdir -pv'
alias path='echo $PATH | tr ":" "\n"'
alias cpr='cp -vr'
alias e="nvim"
alias v="nvim"
alias vi="nvim"
alias d='ranger'
alias update='sudo pacman -Syyu --noconfirm'
alias dots='cd $DOTFILES'
# alias do75='$DOTFILES/bin/do75'
alias repos='cd /mnt/c/repos'

alias lg="lazygit"

# vim:ft=zsh:nowrap
