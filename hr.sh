# MM    MM              dd           bb                         lll  1  hh      333333
# MMM  MMM   aa aa      dd   eee     bb      yy   yy      aa aa lll 111 hh         3333 nn nnn
# MM MM MM  aa aaa  dddddd ee   e    bbbbbb  yy   yy     aa aaa lll  11 hhhhhh    3333  nnn  nn
# MM    MM aa  aaa dd   dd eeeee     bb   bb  yyyyyy    aa  aaa lll  11 hh   hh     333 nn   nn
# MM    MM  aaa aa  dddddd  eeeee    bbbbbb       yy     aaa aa lll 111 hh   hh 333333  nn   nn
#                                             yyyyy
# Support - al1h3n(tg,ds) | Donate me - paypal.me/al1h3n
# HyprReload (Hypreload, HR) v1 - First release.
# ==============================================================================

#!/bin/bash
echo -e "\033]0;HR v1 - al1h3n\007"
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
BLUE="\e[34m"
RESET="\e[0m"

echo -e "\033[38;5;213mHyprReload by\033[0m \033[38;5;171mal1h3n${RESET}${RESET}"

exists(){
	command -v $1&>/dev/null
}

kp(){ # Kill process
	if pgrep $1; then
		pkill $1
		echo -e "${GREEN}Killed: $1${RESET}"
}

# 1.1. Dependencies.
if ! exists zenity;then
	echo -e "${RED}You have to install ${YELLOW}zenity${RED} package.${RESET}"
	read;exit 0
fi

# 1.2. Wallpaper engines.
if exists swww;then
	swww clear-cache
fi

if exists hyprpaper;then
	hyprpaper reload
fi

if exists mpvpaper;then
kp mpvpaper
video=$(zenity --file-selection --title="Select mpvpaper video")
mpvpaper -s -o "--loop --mute --no-osd-bar --no-input-default-bindings" ALL $video
fi

# 1.3. Utilities.
if exists waybar;then
	kp waybar
	waybar
fi

# 1.4. Hyprland itself.
if exists hyprland;then
	hyprctl reload
else
	echo -e "${RED}You don't have ${YELLOW}hyprland${RED} package!${RESET}"
	read;exit 0
fi

echo -e "\n\033[38;5;46mHyprland was completely reloaded${RESET}"
