#!/bin/sh

echo "installing packages"
sudo apt -y install vim gcc libssl-dev tmux zsh jq
sudo apt autoremove -y

echo "installing zoxide"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

echo "installing mise"
curl https://mise.run | sh

. ./dotfiles.sh

echo "done. if this is a gui system, run "source gui.sh" to install icons and themes"
