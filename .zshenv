while read file
do
  source "$HOME/.$file"
done <<-EOF
environment
aliases
EOF

ZDOTDIR="$HOME/.zsh"
export ZDOTDIR

# vim:ft=zsh:nowrap
