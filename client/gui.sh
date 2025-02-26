#!/bin/sh

# Installs any GUI related config.

echo "installing gui config"
cp -a ./icons/. $HOME/.icons
cp -a ./fonts $HOME/.local/share/fonts
