function cd() {
    builtin cd "$@" && exa -HF --all --long --no-filesize --no-user --no-time --group-directories-first --icons
}

alias c="clear"
alias q="exit"
alias :q="exit"
alias z='zip -r'
alias uz='unzip'
alias ..="cd .."
alias mkdir="mkdir -p"
alias pacin="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias paruin="paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro  paru -S"
alias pacrem="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias pac="pacman -Q | fzf"
alias parucom="paru -Gc"
alias parupd="paru -Qua"
alias pacupd="pacman -Qu"
alias parucheck="paru -Gp"
alias cleanpac='sudo pacman -Rns $(pacman -Qtdq); paru -c'
alias installed="grep -i installed /var/log/pacman.log"

# use exa if available
if [[ -x "$(command -v exa)" ]]; then
  alias ll="exa -HhgnSF --all --long --group-directories-first --icons --no-time"
  alias l="exa -HF --all --long --no-filesize --no-user --no-time --group-directories-first --icons"
else
  alias l="ls -lah ${colorflag}"
  alias ll="ls -lFh ${colorflag}"
fi

alias la="ls -AF ${colorflag}"
alias lld="ls -l | grep ^d"
alias cp='cp -rv'
alias mv='mv -v'
alias srm='sudo rm -rfv'
alias ln='ln -sfv'
alias mkdir='mkdir -pv'
alias path='echo $PATH | tr ":" "\n"'
alias cat='bat'
alias grep='grep --color=auto'
alias mv='mv -v'
alias cp='cp -vr'
alias rm='rm -vrf'
alias v="$EDITOR"
alias vi="$EDITOR"
alias d='ranger'
alias update='sudo pacman -Syyuu --noconfirm'
alias dots='cd $DOTFILES'
alias do75='~/.scripts/do75'
alias repos='cd /mnt/c/repos'

alias lg="lazygit"

# vim:ft=zsh
