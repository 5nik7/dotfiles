#!/bin/bash
export TERMINFO=/usr/lib/terminfo
export TERM=xterm-256color
export QT_QPA_PLATFORMTHEME=gtk2
export MOZ_ENABLE_WAYLAND=1
export GTK_IM_MODULE=gtk3
export QT_IM_MODULE=gtk3
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway

export BUN_INSTALL="$HOME/.bun"

GOPATH="$HOME/go"
export GOPATH

NVM_DIR="$HOME/.nvm"
export NVM_DIR

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

_extend_path() {
	[[ -d "$1" ]] || return

	if ! echo "$PATH" | tr ":" "\n" | grep -qx "$1"; then
		export PATH="$1:$PATH"
	fi
}

_extend_path "$HOME/.local/share/bob/nvim-bin"
_extend_path "$BUN_INSTALL/bin"
_extend_path "$HOME/.scripts"
_extend_path "$HOME/.cargo/bin"
_extend_path "$HOME/node_modules/.bin"
_extend_path "$HOME/.local/share/gem/ruby/3.0.0/bin"
_extend_path "$GOPATH/bin"
_extend_path "/usr/lib/wsl/lib"
_extend_path "/usr/lib/jvm/default/bin"
_extend_path "/usr/bin/site_perl"
_extend_path "/usr/bin/vendor_perl"
_extend_path "/usr/bin/core_perl"
_extend_path "/usr/lib/rustup/bin"
_extend_path "/home/snikt/.fzf/bin"

source /opt/anaconda/bin/activate root

export RUSTFLAGS="--remap-path-prefix $HOME=~"

base00="#11111b"
base01="#181825"
base02="#313244"
base03="#45475a"
base04="#6c7086"
base05="#cdd6f4"
base06="#f5e0dc"
base07="#b4befe"
base08="#f38ba8"
base09="#fab387"
base0A="#f9e2af"
base0B="#a6e3a1"
base0C="#94e2d5"
base0D="#89b4fa"
base0E="#cba6f7"
base0F="#f2cdcd"

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export DOTFILES=${DOTFILES:="$HOME/dotfiles"}
export SUDO_PROMPT="passwd: "
export TERMINAL="kitty"
export VISUAL="nvim"
export EDITOR="nvim"
export BROWSER="firefox"
export CHROME_EXECUTABLE=/usr/bin/chromium

XDG_RUNTIME_DIR="/run/user/$(id -u)"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_RUNTIME_DIR
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

export MANPAGER="bat"

export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"
export BAT_THEME="Catppuccin-mocha"

export FZF_DEFAULT_OPTS="
--color preview-bg:$base00
--color border:$base00
--color gutter:$base01
--color bg:$base01
--color bg+:$base02
--color fg:$base04
--color hl:$base07
--color fg+:$base09
--color hl+:$base0A
--color info:$base0E
--color prompt:$base0E
--color spinner:$base0F
--color pointer:$base0C
--color marker:$base08
--color header:$base06
--prompt ' >  '
--pointer ' ●'
--ansi
--layout=reverse
--no-scrollbar
--info=inline
--border=thinblock
--margin='2%,2%,2%,2%'
--height='60%'
--multi
--preview-window=cycle
--preview '([[ -f {} ]] && (bat --style=plain --color=always --line-range :500 {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--preview-window='right'
--preview-window='right:60%'
--preview-window='border-thinblock'
--bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)' > selected"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [[ -f "$HOME/.aliases" ]]; then
	source "$HOME/.aliases"
fi

export DIRENV_BASH=/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]$\[\033[00m\] '
# export BROWSER="wslview"
[[ -f ~/.local/share/blesh/ble.sh ]] && source ~/.local/share/blesh/ble.sh

# [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
# source /usr/share/bash-completion/bash_completion

ble-import -d integration/fzf-completion
ble-import -d integration/fzf-key-bindings

export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(starship init bash)"

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

PATH=$(echo $(sed 's/:/\n/g' <<<$PATH | sort | uniq) | sed -e 's/\s/':'/g')
