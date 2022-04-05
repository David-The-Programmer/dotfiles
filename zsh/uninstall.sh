#!/bin/sh

# Delete symlinks to zsh configs
rm -f ~/.zshrc
rm -f ~/.p10k.zsh

# Uncomment the following line to uninstall Powerlevel10k theme from Oh My Zsh
# rm -rf -- ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Uncomment the following line to uninstall Oh My Zsh
# rm -rf ~/.oh-my-zsh

# restart zsh
exec zsh
