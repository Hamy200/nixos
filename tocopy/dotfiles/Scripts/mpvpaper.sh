#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/Live/"

WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

killall mpvpaper
mpvpaper -n 3600 -p -o "no-audio loop" ALL "$WALLPAPER"
