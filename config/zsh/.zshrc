## ░▀▀█░█▀▀░█░█░█▀▄░█▀▀
## ░▄▀░░▀▀█░█▀█░█▀▄░█░░
## ░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀

while read file
do
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
environment
aliases
options
plugins
theme
fzf
EOF

# vim:ft=zsh:nowrap
