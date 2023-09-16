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

PATH=$(echo $(sed 's/:/\n/g' <<< $PATH | sort | uniq) | sed -e 's/\s/':'/g')

# vim:ft=zsh:nowrap

# bun completions
[ -s "/home/snikt/.bun/_bun" ] && source "/home/snikt/.bun/_bun"
