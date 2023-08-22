#
# ~/.bash_profile
#

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

[[ -f ~/.bashrc ]] && . ~/.bashrc
