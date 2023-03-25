#!/bin/sh

# Remove zim
rm -rf ~/.zim
echo "removed ~/.zim"

# Delete symlinks to zsh configs
rm -f ~/.zshrc
rm -f ~/.zimrc
rm -f ~/.p10k.zsh
echo "deleted all symlinks to zsh configs"

# restart zsh
exec zsh
