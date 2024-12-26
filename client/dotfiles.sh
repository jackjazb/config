#!/bin/zsh

# Installs the contents of ./dotfiles.

echo "installing dotfiles..."
ln -sf $PWD/dotfiles/.gitconfig ~/.gitconfig
ln -sf $PWD/dotfiles/.vimrc ~/.vimrc
ln -sf $PWD/dotfiles/.zshrc ~/.zshrc
ln -sf $PWD/dotfiles/aliases.zsh $ZSH/custom/aliases.zsh

unalias -a
omz reload
echo "done"
