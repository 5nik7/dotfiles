ZDOTDIR="$HOME/.config/zsh"


export LIBGL_ALWAYS_INDIRECT=1
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
export PULSE_SERVER=tcp:$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}')

QT_QPA_PLATFORMTHEME=gtk2
MOZ_ENABLE_WAYLAND=1
GTK_IM_MODULE=gtk3
QT_IM_MODULE=gtk3
XMODIFIERS=@im=gtk3
SDL_VIDEODRIVER=wayland
_JAVA_AWT_WM_NONREPARENTING=1
QT_QPA_PLATFORM=wayland
QT_WAYLAND_DISABLE_WINDOWDECORATION=1
XDG_CURRENT_DESKTOP=sway
XDG_SESSION_DESKTOP=sway
# vim:ft=zsh:nowrap
