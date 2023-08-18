#!/bin/bash

CRE=$(tput setaf 1)
CYE=$(tput setaf 3)
CGR=$(tput setaf 2)
CBL=$(tput setaf 4)
BLD=$(tput bold)
CNC=$(tput sgr0)
LOG="install.log"

dotfiles_folder=~/dotfiles
source_folder=~/sources
backup_folder=~/.Backups
date=$(date +%Y%m%d-%H%M%S)
fzf_folder=~/.fzf
fzf_repo=https://github.com/junegunn/fzf

logo () {

	local text="${1:?}"
	echo -en "
    ██████████ ██████   █████ █████ █████   ████ ██████████
   ░███░░░░░░█░░██████ ░░███ ░░███ ░░███   ███░ ░███░░░░███
   ░███     ░  ░███░███ ░███  ░███  ░███  ███   ░░░    ███
   ░█████████  ░███░░███░███  ░███  ░███████          ███
   ░░░░░░░░███ ░███ ░░██████  ░███  ░███░░███        ███
    ███   ░███ ░███  ░░█████  ░███  ░███ ░░███      ███
   ░░████████  █████  ░░█████ █████ █████ ░░████   ███
    ░░░░░░░░  ░░░░░    ░░░░░ ░░░░░ ░░░░░   ░░░░   ░░░\n\n"
    printf ' %s [%s%s %s%s %s]%s\n\n' "${CRE}" "${CNC}" "${CYE}" "${text}" "${CNC}" "${CRE}" "${CNC}"
}

########## ---------- You must not run this as root ---------- ##########

if [ "$(id -u)" = 0 ]; then
    echo "This script MUST NOT be run as root user."
    exit 1
fi

if [ ! -d "$source_folder" ]; then
  mkdir -p "$source_folder" || exit
fi

if ! command -v paru >/dev/null 2>&1; then
  read -n1 -rep "${CAT} Would you like to install Paru? [y/n]" INST
  if [[ $INST =~ ^[Yy]$ ]]; then
	  cd "$source_folder" || exit
	  git clone https://aur.archlinux.org/paru-bin.git
	  cd paru-bin || exit
	  makepkg -si --noconfirm 2>&1 | tee -a $LOG
	  cd || exit
  else
	  printf "%s%sParu is already installed%s\n" "${BLD}" "${CGR}" "${CNC}"
    sleep 1
  fi
fi
clear

# Check if yay is installed
ISyay=/sbin/yay

if [ -f "$ISyay" ]; then
    printf "\n%s yay was located, moving on.%s\n" "$CGR" "$CNC"
else
    printf "\n%s yay was NOT located%s\n" "$CYE" "$CNC"
    read -n1 -rep "${CAT} Would you like to install yay (y,n)" INST
    if [[ $INST =~ ^[Yy]$ ]]; then
        cd "$source_folder" || exit
        git clone https://aur.archlinux.org/yay.git
        cd yay || exit
        makepkg -si --noconfirm 2>&1 | tee -a $LOG
        cd || exit
    else
        printf "%s yay is required for this script, now exiting.%s\n" "$CRE" "$CNC"
        exit
    fi
# update system before proceed
    printf '%s System Update to avoid issue.%s\n' "${CYE}" "${CNC}"
    yay -Syu --noconfirm 2>&1 | tee -a $LOG
fi

# Function to print error messages
print_error() {
    printf " %s%s%s\n" "$CRE" "$1" "$NC" >&2 "$CNC"
}

# Function to print success messages
print_success() {
    printf "%s%s%s%s\n" "$CGR" "$1" "$NC" "$CNC"
}
clear

### Install packages ####
logo "Package Installation"

while true; do
	read -rp " Would you like to install the packages? [y/n]: " yn
		case $yn in
			[Yy]* ) break;;
			[Nn]* ) exit;;
			* ) printf " Error: just write 'y' or 'n'\n\n";;
		esac
  done
clear


logo "Installing needed packages.."

dependencias=(git base-devel base-devel cmake unzip ninja curl pacman-contrib xdg-user-dirs \
              rustup nodejs luarocks go python-pip sway waybar sddm \
			        ffmpeg neovim viewnior kitty alacritty foot dunst rofi exa ranger starship \
			        polkit-gnome nwg-look-bin qt5ct htop ffmpegthumbs papirus-icon-theme \
			        zsh exa ripgrep lazygit fd \
			        ttf-nerd-fonts-symbols-common otf-firamono-nerd inter-font otf-sora ttf-fantasque-nerd noto-fonts noto-fonts-emoji ttf-comfortaa \
			        ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-terminus-nerd ttf-inconsolata ttf-joypixels)

is_installed() {
  pacman -Qi "$1" &> /dev/null
  return $?
}

printf "%s%sChecking for required packages...%s\n" "${BLD}" "${CBL}" "${CNC}"
for pkgs in "${dependencias[@]}"
do
  if ! is_installed "$pkgs"; then
    paru -S "$pkgs" --noconfirm
    printf "\n"
  else
    printf '%s%s is already installed on your system!%s\n' "${CGR}" "$pkgs" "${CNC}"
    sleep 1
  fi
done
sleep 3
clear

########## ---------- Preparing Folders ---------- ##########

logo "Preparing Folders"
if [ ! -e $HOME/.config/user-dirs.dirs ]; then
	xdg-user-dirs-update
	echo "Creating xdg-user-dirs"
else
	echo "user-dirs.dirs already exists"
fi
sleep 2
clear

logo "Installing FZF"
if [ ! -d "$fzf_folder" ]; then
  cd || exit
  git clone "$fzf_repo" "$fzf_folder"
  unzip '*.zip' -d "$fzf_folder"
  rm -rf '*.zip'
  sudo cp -R "$HOME/Downloads/nerdfonts/" "/usr/share/fonts/"
fi

### Add Fonts for Waybar ###
mkdir -p "$HOME/Downloads/nerdfonts/"
cd "$HOME/Downloads/" || exit
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.1/CascadiaCode.zip
unzip '*.zip' -d "$HOME/Downloads/nerdfonts/"
rm -rf '*.zip'
sudo cp -R "$HOME/Downloads/nerdfonts/" "/usr/share/fonts/"

fc-cache -rv


logo "Downloading dotfiles"
[ -d ~/dotfiles ] && rm -rf ~/dotfiles
printf "Cloning rice from https://github.com/gh0stzk/dotfiles\n"
cd
git clone --depth=1 https://github.com/gh0stzk/dotfiles.git
sleep 2
clear

### Copy Config Files ###
read -n1 -rep "${CAT} Would you like to copy config files? (y,n)" CFG
if [[ $CFG =~ ^[Yy]$ ]]; then
    printf " Copying config files...\n"
    cp -r dotconfig/dunst ~/.config/ 2>&1 | tee -a $LOG
    cp -r dotconfig/hypr ~/.config/ 2>&1 | tee -a $LOG
    cp -r dotconfig/kitty ~/.config/ 2>&1 | tee -a $LOG
    cp -r dotconfig/pipewire ~/.config/ 2>&1 | tee -a $LOG
    cp -r dotconfig/rofi ~/.config/ 2>&1 | tee -a $LOG
    cp -r dotconfig/swaylock ~/.config/ 2>&1 | tee -a $LOG
    cp -r dotconfig/waybar ~/.config/ 2>&1 | tee -a $LOG
    cp -r dotconfig/wlogout ~/.config/ 2>&1 | tee -a $LOG

    # Set some files as exacutable
    chmod +x ~/.config/hypr/xdg-portal-hyprland
    chmod +x ~/.config/waybar/scripts/waybar-wttr.py
fi

### Enable SDDM Autologin ###
read -n1 -rep 'Would you like to enable SDDM autologin? (y,n)' SDDM
if [[ $SDDM == "Y" || $SDDM == "y" ]]; then
    LOC="/etc/sddm.conf"
    echo -e "The following has been added to $LOC.\n"
    echo -e "[Autologin]\nUser = $(whoami)\nSession=hyprland" | sudo tee -a $LOC
    echo -e "\n"
    echo -e "Enabling SDDM service...\n"
    sudo systemctl enable sddm
    sleep 3
fi


########## --------- Changing shell to zsh ---------- ##########

logo "Changing default shell to zsh"
printf "%s%sIf your shell is not zsh will be changed now.\nYour root password is needed to make the change.\n\nAfter that is important for you to reboot.\n %s\n" "${BLD}" "${CYE}" "${CNC}"
if [[ $SHELL != "/usr/bin/zsh" ]]; then
  echo "Changing shell to zsh, your root pass is needed."
  chsh -s /usr/bin/zsh
else
  printf "%s%sYour shell is already zsh\nGood bye! installation finished, now reboot%s\n" "${BLD}" "${CGR}" "${CNC}"
  zsh
fi