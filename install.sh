#!/bin/sh
set -e
cd "$(dirname "$0")"

sudo apt install -y sway swaybg waybar mako-notifier fuzzel foot gtklock swaylock \
    blueman network-manager-gnome pulseaudio-utils playerctl brightnessctl grim fonts-ubuntu

mkdir -p ~/.config ~/.local/share/fonts/NerdFontsSymbols
cp -r config/. ~/.config/
sed -i "s|__HOME__|$HOME|" ~/.config/gtklock/config.ini
cp fonts/*.ttf ~/.local/share/fonts/NerdFontsSymbols/
fc-cache -f

if [ -n "$SWAYSOCK" ]; then
    swaymsg reload
    makoctl reload
fi
