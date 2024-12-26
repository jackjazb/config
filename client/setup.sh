#!/bin/zsh

# Performs first time setup, installing various packages.
echo "upgrading system"
sudo apt update
sudo apt upgrade -y

echo "installing git"
sudo apt install git -y

echo "installed git version $(git --version)"

echo "installing other packages"
sudo apt -y install vim curl gcc libssl-dev tmux zsh jq

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "installing zoxide"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

echo "installing mise"
curl https://mise.run | sh

echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

. ./dotfiles.sh

echo "done. if this is a gui system, run "source gui.sh" to install icons and themes"
