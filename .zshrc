#     ____  ______ _____  _____
#    /_  / / __/ // / _ \/ ___/
#   _ / /__\ \/ _  / , _/ /__
#  (_)___/___/_//_/_/|_|\___/


export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

export ZFUNCDIR="$HOME/.zfunc"

fpath=($HOME/.zfunc $fpath)
autoload -U $HOME/.zfunc/*(:t)

# fpath=(
# 	$ZFUNCDIR
# 	/usr/local/share/zsh/site-functions
# 	/usr/share/zsh/site-functions
# 	$fpath
# )
# export fpath

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

WORDCHARS='*?[]~=&;!#$%^(){}<>'

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export SUDO_PROMPT="passwd: "
export DOTFILES="$HOME/.dotfiles"
export ZSH="$DOTFILES/zsh"
export ZFUNCDIR="$HOME/.zfunc"
export BASHRC="$HOME/.bashrc"
export ALIASES="$HOME/.aliases"
export WIN='/mnt/c'
export REPOS="$WIN/repos"

# export EDITOR="code"
export EDITOR="nvim"
export SYSTEMD_EDITOR=$EDITOR
export VISUAL="$EDITOR"
# export MANPAGER="nvim +Man!"
export MANPAGER="less -RF"
export BAT_PAGER="less -RF"
export PAGER="less -RF"
export GOBIN="$HOME/go/bin"
export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"

if [ $commands[fzf] ]
then
  export FZF_DEFAULT_OPTS="
--color fg:-1,bg:-1,hl:5:underline,fg+:3,bg+:-1,hl+:5:underline,gutter:-1,border:8
--color info:2,prompt:-1,spinner:2,pointer:6,marker:4
--preview-window='border-sharp'
--pointer='|>'
--no-scrollbar
--info=inline
--preview-window='right,50%,border-left,+{2}+3/3,~3'
--exact
--ansi"
  if [ $commands[fd] ]
  then
    export FZF_DEFAULT_COMMAND="fd -c always"
  fi
fi

function source_file() {
	if [ -f "$1" ]; then
		source "$1"
	fi
}

function extend_path() {
	[[ -d "$1" ]] || return

	if ! echo "$PATH" | tr ":" "\n" | grep -qx "$1"; then
		export PATH="$PATH:$1"
	fi
}

function prepend_path() {
	[[ -d "$1" ]] || return

	if ! echo "$PATH" | tr ":" "\n" | grep -qx "$1"; then
		export PATH="$1:$PATH"
	fi
}

prepend_path "$HOME/.local/share/bob/nvim-bin"
extend_path "$DOTFILES/bin"
extend_path "$HOME/.local/bin"
extend_path "$WIN/Windows"
extend_path "$WIN/vscode/bin"
extend_path "$WIN/bin"
extend_path "$GOBIN"
extend_path "$WIN/ProgramData/scoop/shims"

source_file "$ZSH/util.zsh"
source_file "$HOME/.aliases"
source_file "$HOME/.functions"
source_file "$ZSH/plugins.zsh"
source_file "$ZSH/completions.zsh"


zle_highlight=('paste:none')

source_file "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# bun
[ -s "/home/njen/.bun/_bun" ] && source "/home/njen/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
prepend_path "$BUN_INSTALL/bin"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(rbenv init -)"

if [ -e /home/njen/.nix-profile/etc/profile.d/nix.sh ]; then . /home/njen/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
