export GOPATH="$HOME/go"

# Extend $PATH without duplicates
_extend_path() {
  [[ -d "$1" ]] || return

  if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
    export PATH="$1:$PATH"
  fi
}

_extend_path "$HOME/.local/bin"
_extend_path "$HOME/.cargo/bin"
_extend_path "$HOME/node_modules/.bin"
_extend_path "$HOME/.local/share/gem/ruby/3.0.0/bin"
_extend_path "$GOPATH/bin"

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export DOTFILES=${DOTFILES:="$HOME/dotfiles"}
export SUDO_PROMPT="passwd: "
export TERMINAL="kitty"
export VISUAL="nvim"
export EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

export MANPAGER='nvim +Man! +"set nocul" +"set noshowcmd" +"set noruler" +"set noshowmode" +"set laststatus=0" +"set showtabline=0" +"set nonumber"'

export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"
export BAT_THEME='Catppuccin-mocha'

# FZF bases
export RG_DEFAULT_COMMAND="rg -i -l --hidden"

export FZF_DEFAULT_COMMAND="rg --files"

export FZF_DEFAULT_OPTS="
  --color fg:#cdd6f4
  --color fg+:#fab387 
  --color bg:#181825
  --color bg+:#313244
  --color preview-bg:#11111b
  --color hl:#f2cdcd
  --color hl+:#f5e0dc
  --color info:#cba6f7
  --color prompt:#f9e2af
  --color spinner:#f5e0dc
  --color pointer:#94e2d5
  --color marker:#f5e0dc
  --color border:#11111b
  --color header:#f38ba8
  --color gutter:#1e1e2e
  --prompt '> '
  --pointer ' >'
  --ansi
  --layout=reverse
  --no-scrollbar
  --info=inline
  --border=thinblock
  --margin='5%,5%,5%,5%'
  --height='90%'
  --preview='bat -n --style=plain --color=always {}'
  --preview-window='right'
  --preview-window='65%'
  --preview-window='border-thinblock'"

# vim:ft=zsh
