#!/bin/sh

# Delete symlinks to zsh configs
rm -f ~/.zshrc
rm -f ~/.p10k.zsh

# Comment the following line to disable the uninstallation of the Powerlevel10k theme from Oh My Zsh
rm -rf -- ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Comment the following line to disable the uninstallation of Oh My Zsh
rm -rf ~/.oh-my-zsh

# restart zsh
exec zsh
