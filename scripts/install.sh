#! /bin/sh

# Create all symlinks to each package
echo "Stow-ing packages to home directory..."
stow --verbose=2 --target=$HOME nvim tmux

# Install tmux plugin manager
echo "Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Create tmux session to install tmux configs
# to prevent tmux server from exiting when there are no sessions running
echo "Creating tmux session 0 to install tmux plugins..."
tmux new-session -d -s 0

echo "Sourcing tmux.conf ..."
tmux source ~/.config/tmux/tmux.conf

# Installing tmux plugins headlessly
echo "Installing tmux plugins..."
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# Install neovim plugins headlessly
echo "Installing neovim plugins..."
nvim --headless "+Lazy! sync" +qa

# Removing tmux session 0
echo -e "\nRemoving initially created tmux session 0..."
tmux kill-session -t 0

echo "Installation complete!"

