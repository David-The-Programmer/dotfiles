#!/bin/sh

echo "creating symlinks for zsh configs..."
ln -s "$PWD/.zshrc" ~/.zshrc
ln -s "$PWD/.zimrc" ~/.zimrc
ln -s "$PWD/.p10k.zsh" ~/.p10k.zsh
echo "symlinks for zsh configs are created"

# Refresh zsh to load configs
exec zsh
