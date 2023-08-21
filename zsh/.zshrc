## ░▀▀█░█▀▀░█░█░█▀▄░█▀▀
## ░▄▀░░▀▀█░█▀█░█▀▄░█░░
## ░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀


while read file
do
  source "$SHDIR/$file.sh"
done <<-EOF
environment
aliases
EOF

while read file
do
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
options
plugins
theme
fzf
EOF

# vim:ft=zsh:nowrap
