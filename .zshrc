export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export SUDO_PROMPT="passwd: "
export DOTFILES="$HOME/.dotfiles"
export ZSH="$DOTFILES/zsh"
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

WORDCHARS='*?_-[]~&;!#$%^(){}<>|'

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


extend_path "$DOTFILES/bin"
extend_path "$HOME/.local/bin"
extend_path "$WIN/vscode/bin"
extend_path "$WIN/bin"
extend_path "$WIN/Windows"
extend_path "$GOBIN"
prepend_path "$HOME/.local/share/bob/nvim-bin"

source_file "$HOME/.aliases"
source_file "$ZSH/util.zsh"
source_file "$ZSH/fuctions.zsh"
source_file "$ZSH/plugins.zsh"

zle_highlight=('paste:none')

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source_file "$HOME/.cargo/env"

eval "$(rbenv init - zsh)"

eval "$(starship init zsh)"

if [ -e /home/njen/.nix-profile/etc/profile.d/nix.sh ]; then . /home/njen/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
