#!/bin/sh

# Install paq, neovim plugin manager
# TODO: need automated install for this
git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

# Create symlink of nvim subfolder in ~/.config directory
ln -s "$PWD" ~/.config
