#!/bin/sh
sudo apt install curl zsh -y

# `omz` installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# `mise` installation
curl https://mise.run | sh
eval "$(~/.local/bin/mise activate zsh)"

# System setup.
mise run setup

# Install tools.
mise up
