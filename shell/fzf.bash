# Setup fzf
# ---------
if [[ ! "$PATH" == */home/snikt/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/snikt/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/snikt/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/snikt/.fzf/shell/key-bindings.bash"
