#!/bin/sh
sudo apt install curl zsh -y

# `omz` installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# `mise` installation
curl https://mise.run | sh
eval "$(mise activate zsh)"
mise run setup
