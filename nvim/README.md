# Setup guide for Neovim configs

These configs are for neovim configs using Lua. These configs are only compatible for Neovim 0.6+. This guide assumes that Neovim has been installed.

Make sure to be in this directory of the repo before running any scripts.

## Folder structure

```sh
├── init.lua
├── install.sh
├── uninstall.sh
├── lua/
│   ├── core/
│   │   ├── colourscheme.lua
│   │   ├── keymaps.lua
│   │   └── settings.lua
│   └── plugins/
│       ├── bootstrap.lua
│       └── configs/
│           └── <plugin-name>.lua
└── README.md
```

- `init.lua` is the main config file which sources modules from the `core` & `plugins` folder.
- `install.sh` is the shell script used to bootstrap neovim configs and install the plugins.
- `uninstall.sh` is the shell script used to remove neovim configs and uninstall all the installed plugins.
- `core/` contains core configurations, which includes the core keymappings (`keymaps.lua`), neovim settings (`settings.lua`) and colour schemes (`colourscheme.lua`).
- `plugins/` contains all plugin configurations. `bootstrap.lua` contains the names of all plugins to be installed, as well as functions to install the [paq](https://github.com/savq/paq-nvim) plugin manager and plugins. `configs/` contains configuration files specific to the plugins installed. One configuration file per plugin. The names of each of those files would follow the `<plugin-name>.lua` convention. Each plugin configuration file contains plugin variables, setup tables and keymappings.

## Installation

Run the `install.sh` script. This will create a symlink of this `nvim` subfolder in the `~/.config/` directory. It will also install all plugins specified in `bootstrap.lua` headlessly.

```sh
./install.sh
```

## Editing configurations

Due to the usage of the symlinks, there is no need to run `uninstall.sh` & `install.sh` continuously. After editing any files in `core/`, either run `:source init.lua` inside neovim or just launch neovim again for changes to be reflected.

## Managing plugins with paq

To add/remove plugins, edit the `pkgs` variable in `bootstrap.lua`.

```lua
local pkgs = {
    "savq/paq-nvim";

    -- Add plugins here
}
```

Also remember to remove the config files for the plugins removed in the `plugins/configs/` directory and also remove any `require()` statements in `init.lua` sourcing the config files of the removed plugins.

Subsequently, run `:PaqSync` in neovim which makes sure plugins installed are the ones specified in `bootstrap.lua`. Relaunch neovim again to make sure the new configurations give no errors.

Please read the [paq README](https://github.com/savq/paq-nvim) for more information of using paq.

**Please run `:TSUpdate` to update the treesitter parsers after running `:PaqSync`. This will ensure that treesitter works as expected, i.e, no error messages, syntax highlighting is present, etc. Currently there is no way to update treesitter using paq**

## Uninstallation

Run the `uninstall.sh` script. This will delete the symlinks created and remove all plugins installed by the `install.sh` script.

```sh
./uninstall.sh
```

## Roadmap

- [ ] Automate updating treesitter using paq, instead of manual `:TSUpdate` command
- [ ] Fix missing syntax highlighting for COMMIT_EDITMSG file when doing git commits
- [ ] Improving autocompletion configurations to suggest LSP completions first (taking priority over text predictions)
- [ ] Refactor and modularise LSP configs (so that it is less tightly coupled)
- [ ] Improving LSP configurations to easily set custom LSP configs for each different language
- [ ] Add debugging (DAP)
- [ ] Improving current terminal configs (floatterm plugin configs) to show previous terminal (if any) after killing current terminal

## Useful links

- [Guide to configure neovim using Lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)
- [A neovim configs repo I took inspiration from](https://github.com/brainfucksec/neovim-lua)
- [Tutorial on nvim-cmp plugin by TJ DeVries](https://www.youtube.com/watch?v=_DnmphIwnjo&ab_channel=TJDeVries)
