#!/bin/sh

# Comment the following line to disable installation of Oh My Zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Comment the following line to disable installation Powerlevel10k theme from Oh My Zsh
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Comment the following line to disable installation of the Oh My Zsh plugins
# git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

ln -s "$PWD/.zshrc" ~/.zshrc
ln -s "$PWD/.zimrc" ~/.zimrc
ln -s "$PWD/.p10k.zsh" ~/.p10k.zsh

# Refresh zsh to load configs
exec zsh
