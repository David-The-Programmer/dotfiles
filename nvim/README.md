# Setup guide for Vim/Neovim configs

These configs include both the `.vimrc` and `init.vim` files. This is due to migration from using Vim to Neovim. These configs should be compatible for Vim 8.2+/Neovim 0.4+. This guide assumes that either Vim or Neovim has been installed.

Make sure to be in this directory of the repo before running any scripts.

## Installation

Run the `install.sh` script. This will create symlinks of the `.vimrc` and `init.vim` files in the home directory and `~/.config/nvim/` directory respectively.

```sh
./install.sh
```

## Uninstallation

Run the `uninstall.sh` script. This will delete the symlinks created by the `install.sh` script.

```sh
./uninstall.sh
```

