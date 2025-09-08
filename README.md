# Dotfiles Backup

## How to use
1. install GNU Stow: `sudo apt install stow`
2. pull this directory to ~/dotfiles
3. `cd ~/dotfiles && stow .`

## Requirements
- `ripgrep`
- `fzf`
I have elected to install language servers manually, because Mason and lsp-config were a bit too
much. I usually only need one or two lsps anyway.
- `lua-language-server` - [releases](https://github.com/LuaLS/lua-language-server/releases)
- `clangd`

## nvim layout
The directory layout is as follows:

nvim
├── ftplugin
└── lua
    ├── config
    ├── core
    └── plugins

The ftplugin directory holds scripts that are ran upon opening a file of a certain type. For
example, `c.lua` runs whenever we enter a C language file. This is how lsps are implemented in my
config.

lua/core stores keymaps and global options, `lua/config` stores the lazy.lua file, and `lua/plugins`
stores a file per individual plugin.
