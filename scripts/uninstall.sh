#! /bin/sh

# Removal of tmux plugins
echo "Removing tmux plugins..."
rm -rf ~/.tmux

# Removal of lazy.nvim plugins
echo "Removing nvim plugins..."
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/state/nvim/lazy

# Unstow packages
stow --verbose=2 --target=$HOME --delete nvim tmux

echo "Uninstallation complete!"
