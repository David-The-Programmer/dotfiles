#!/bin/sh

# Uninstall all LSPs and treesitter parsers
nvim --headless -c "MasonUninstallAll" -c "TSUninstall all" -c q

# Remove the symlink to nvim subfolder in repo
rm -rf ~/.config/nvim

# Remove all plugins installed
rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/
