if [[ -f "$HOME/.aliases" ]]; then
  source "$HOME/.aliases"
fi

while read file
do
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
options
plugins
fzf
EOF

# vim:ft=zsh:nowrap
