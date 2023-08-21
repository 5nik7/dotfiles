#
# ~/.bashrc
#
export ZDOTDIR="$HOME/.config/zsh"
export SHDIR="$HOME/.config/shell"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]$\[\033[00m\] '
# export BROWSER="wslview"

[[ -f $SHDIR/fzf.bash ]] && . $SHDIR/fzf.bash

while read file; do
	source "$SHDIR/$file.sh"
done <<-EOF
	environment
	aliases
EOF

export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml

eval "$(starship init bash)"
