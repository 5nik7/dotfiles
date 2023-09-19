# /bin/bash
killall waybar
SDIR="$HOME/.config/waybar"
waybar -c "$SDIR"/config -s "$SDIR"/style.css &
swaymsg gaps outer all set 0 && swaymsg gaps inner all set 5
