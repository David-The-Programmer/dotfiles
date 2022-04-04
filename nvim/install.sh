#!/bin/sh
ln -s "$PWD/nvim/.vimrc" ~/.vimrc
mkdir ~/.config/nvim
ln -s "$PWD/nvim/init.vim" ~/.config/nvim/init.vim
