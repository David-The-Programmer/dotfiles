#!/bin/sh

# Create symlink of nvim subfolder in ~/.config directory
ln -s "$PWD" ~/.config

# Bootstrap plugins by initialising paq and installing plugins automatically
nvim --headless -u NONE -c 'lua require("plugins/bootstrap").bootstrap_paq()'

# Install the language servers 
nvim --headless -c "LspInstall --sync gopls cssls tsserver emmet_ls html jsonls" -c q

