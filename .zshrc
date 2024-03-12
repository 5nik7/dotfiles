#     ____  ______ _____  _____
#    /_  / / __/ // / _ \/ ___/
#   _ / /__\ \/ _  / , _/ /__
#  (_)___/___/_//_/_/|_|\___/

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY
setopt autocd

# setopt AUTO_LIST
# setopt AUTO_MENU
# setopt AUTO_PARAM_SLASH
# setopt COMPLETE_IN_WORD
# setopt NO_MENU_COMPLETE
# setopt HASH_LIST_ALL
# setopt ALWAYS_TO_END
#
# setopt HIST_SAVE_NO_DUPS
# setopt HIST_IGNORE_ALL_DUPS
# setopt SHARE_HISTORY
# setopt HIST_FIND_NO_DUPS
#
# setopt INTERACTIVE_COMMENTS
# setopt NOBEEP
#
# setopt extended_history
# setopt append_history
# setopt hist_ignore_dups
# setopt hist_ignore_space
# setopt hist_reduce_blanks
# setopt hist_expand
# setopt auto_cd
# setopt nonomatch
# setopt glob
# setopt extended_glob
# setopt rmstarsilent
# setopt prompt_subst

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

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000                    # Number of histories in memory
SAVEHIST=100000                   # Number of histories to be saved
HISTORY_IGNORE="(ls|cd|pwd|zsh|exit|cd ..)"

WORDCHARS='*?[]~=&;!#$%^(){}<>'

# WORDCHARS='*?_-[]~&;!#$%^(){}<>|'

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

fpath=(
	$ZFUNCDIR
	/usr/local/share/zsh/site-functions
	/usr/share/zsh/site-functions
	$fpath
)
export fpath

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
