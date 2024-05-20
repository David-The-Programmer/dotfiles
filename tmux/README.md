# Setup for tmux

## Getting Started

Ensure tmux is installed and run the following command to make a symlink from this directory to tmux config folder:

```bash
ln -s "$PWD" ~/.config
```

Then run the following command to source the tmux config file
```bash
tmux source ~/.config/tmux/tmux.conf

```

## Uninstalling

Remove the symlink created
```bash
rm ~/.config/tmux
```
