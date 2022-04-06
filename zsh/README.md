# Setup guide for Zsh configs

This guide assumes that zsh has been installed and is used as the default shell. Also, make sure curl and git have been installed.
For the Zsh prompt to be displayed properly, the FiraMono Nerd Font has to be installed and set as the font used by the terminal program of choice.

```sh
yay -S otf-nerd-fonts-fira-mono
```

Make sure to be in this directory of the repo before running any scripts.

## Installation
Run the `install.sh` script. This script creates symlinks of the `.zshrc` and `.p10k.zsh` files in the home directory. It will also install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) and [Powerlevel10K](https://github.com/romkatv/powerlevel10k).

```sh
./install.sh
```
Comment those lines out in future if just recreating symlinks to the config files.

```sh
# Comment the following line to disable installation of Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Comment the following line to disable installation Powerlevel10k theme from Oh My Zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Comment the following line to disable installation of the Oh My Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Uninstallation
Run the `uninstall.sh` script. It will delete the symlinks of the `.zshrc` and `.p10k.zsh` files in the home directory. 

```sh
./uninstall.sh
```

To remove [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) and [Powerlevel10K](https://github.com/romkatv/powerlevel10k), uncomment the section in the script before running it.

```sh
# Uncomment the following line to uninstall Powerlevel10k theme from Oh My Zsh
# rm -rf -- ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Uncomment the following line to uninstall Oh My Zsh
# rm -rf ~/.oh-my-zsh
```
