#!/bin/sh

# Uninstall all LSPs
nvim --headless -c "LspUninstallAll --no-confirm" -c q

# Remove the symlink to nvim subfolder in repo
rm -rf ~/.config/nvim

# Remove all plugins installed
rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/
