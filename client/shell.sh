#!/bin/sh

# Performs first time setup, installing various packages.
echo "upgrading system"
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

echo "installing git"
sudo apt install git curl -y

echo "configuring sudo password feedback"
echo 'Defaults        pwfeedback' | sudo EDITOR='tee -a' visudo

echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
