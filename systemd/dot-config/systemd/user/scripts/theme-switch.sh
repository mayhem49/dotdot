#!/bin/bash

# Configuration: Set your preferred theme names here
# Use 'xfconf-query -c xsettings -p /Net/ThemeName' to see your current one
LIGHT_THEME="Adwaita"
DARK_THEME="Adwaita-dark"

LIGHT_ICONS="Papirus-Light"
DARK_ICONS="Papirus-Dark"

HOUR=$(date +%H)

# Logic: Dark from 7 PM (19) to 7 AM (07)
if [ "$HOUR" -ge 19 ] || [ "$HOUR" -lt 07 ]; then
    # Set Dark GTK Theme
    xfconf-query -c xsettings -p /Net/ThemeName -s "$DARK_THEME"
    # Set Dark Icons
    xfconf-query -c xsettings -p /Net/IconThemeName -s "$DARK_ICONS"
    echo "XFCE switched to Dark Mode ($DARK_THEME) at $HOUR:00"
    notify-send -t 3000 "🌙 Dark Mode Activated"
else
    # Set Light GTK Theme
    xfconf-query -c xsettings -p /Net/ThemeName -s "$LIGHT_THEME"
    # Set Light Icons
    xfconf-query -c xsettings -p /Net/IconThemeName -s "$LIGHT_ICONS"
    echo "XFCE switched to Light Mode ($LIGHT_THEME) at $HOUR:00"
    notify-send -t 3000 "☀️ Light Mode Activated"
fi
