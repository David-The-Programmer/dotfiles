# Setup for neovim

## Getting Started

Run the following command to make a symlink from this directory to neovim config folder:

```bash
ln -s "$PWD" ~/.config
```

Subsequently run the `nvim` command to install `lazy.nvim` and the plugins specified in `init.lua`.

## Uninstalling

Remove the following directories
- `~/.local/share/nvim/lazy`
- `~/.local/state/nvim/lazy`

Remove the symlink created
```bash
rm ~/.config/nvim
```
