# Setup for tmux

## Getting Started

Install tmux and wl-clipboard(for tmux-yank plugin)
```bash
yay -Syu tmux wl-clipboard
```

Install the tmux plugin manager(tpm)
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

```

Run the following command to make a symlink from this directory to tmux config folder:

```bash
ln -s "$PWD" ~/.config
```

Then run the following command to source the tmux config file
```bash
tmux source ~/.config/tmux/tmux.conf

```
Press `prefix` (tmux prefix keybinding) + `I` (capital i) to clone all plugins listed in `~/.config/tmux/tmux.conf` to `~/.tmux/plugins/` directory and source `~/.config/tmux/tmux.conf`.

## Uninstalling

Remove the symlink created
```bash
rm ~/.config/tmux
```

Remove the folder containing the tmux plugins installed by tpm
```bash
rm -r ~/.tmux

```

