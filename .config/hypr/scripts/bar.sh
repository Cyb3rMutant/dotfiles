#!/usr/bin/env bash
# (re)starts quickshell: the bar, wallpaper and screenshot overlay.
# launched through hyprland so it doesn't die with the terminal you ran this from

pkill -x quickshell
hyprctl dispatch "hl.dsp.exec_cmd('quickshell -p $HOME/.config/hypr/quickshell/shell.qml')"
