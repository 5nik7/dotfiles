#!/bin/bash

function load-wallpaper() {
	wallpaper="$(<"${HOME}/.wallpaper")"
	if [ -f "$wallpaper" ]; then
		swaybg -i "$wallpaper" -m fill
	fi
}

load-wallpaper
