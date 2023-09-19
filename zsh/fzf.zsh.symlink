# Setup fzf
# ---------
function fg-fzf() {
  job="$(jobs | fzf -0 -1 | sed -E 's/\[(.+)\].*/\1/')" && echo '' && fg %$job
}

function fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER=" fg-fzf"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-zu


if [[ ! "$PATH" == */home/snikt/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/snikt/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/snikt/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/snikt/.fzf/shell/key-bindings.zsh"
