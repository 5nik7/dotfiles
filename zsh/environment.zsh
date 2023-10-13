if [[ -d "$HOME/go" ]]; then
  export GOPATH="$HOME/go"
fi

if [[ -d "$HOME/.nvm" ]]; then
  export NVM_DIR="$HOME/.nvm"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export SUDO_PROMPT="passwd: "
export TERMINAL="kitty"
export EDITOR='nvim'
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR
export PAGER='bat'
export SHELL='/bin/zsh'
export BROWSER="firefox"

export LIBGL_ALWAYS_INDIRECT=1
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
export PULSE_SERVER=tcp:$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}')

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

export RUSTFLAGS="--remap-path-prefix $HOME=~"

# vim:ft=zsh:nowrap
