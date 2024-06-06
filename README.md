# dotfiles

This repo includes all instructions and scripts needed to install configs for the tools I use for coding in my own time. 

Each subfolder contains the setup instructions and configuration files for the corresponding tool. 


## Prerequisites

Ensure the following packages are installed

```
yay -Syu stow git neovim tmux wl-clipboard
```

I use Arch Linux btw, with KDE (wayland), hence why the [yay](https://github.com/Jguer/yay) package manager is being used.

**Ensure your current dotfiles are backed up prior to installation.**

## Installation

Clone the repo via HTTPS
```
git clone https://github.com/David-The-Programmer/dotfiles.git
```

Or SSH
```
git clone git@github.com:David-The-Programmer/dotfiles.git
```

Install the dotfiles
```
cd dotfiles
```
```
./install.sh
```
The locations of directories that would be created/populated after installation can be found under the **Uninstallation** section of the **README** files in each subdirectory.

## Uninstallation

Uninstall the dotfiles
```
./uninstall.sh
```
Uninstallation will remove all the files installed.
