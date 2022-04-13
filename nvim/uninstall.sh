#!/bin/sh

# Remove the symlink to nvim subfolder in repo
rm -rf ~/.config/nvim

# Remove all plugins installed
rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/
