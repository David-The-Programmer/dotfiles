#!/bin/sh
echo "Installing dotfiles..."
echo "Installing neovim configurations..."
ln -s "$PWD/nvim/.vimrc" ~/.vimrc
mkdir ~/.config/nvim
ln -s "$PWD/nvim/init.vim" ~/.config/nvim/init.vim
echo "Finished installation of dotfiles"

