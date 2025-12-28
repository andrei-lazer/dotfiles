# Dotfiles Backup

## How to use
1. install GNU Stow: `sudo apt install stow`
2. pull this directory to ~/dotfiles
3. `cd ~/dotfiles && stow .`

## Requirements
- `ripgrep`
- `fzf`
- `fd`
- timewarrior (`timew`)

Fedora install:
`sudo dnf install ripgrep fzf fd timew`

## nvim layout
The directory layout is as follows:

```
nvim
├── init.lua
├── lsp
│   ├── clangd.lua
│   ├── ...
│   └── lua_ls.lua
├── lua
│   ├── keymaps.lua
│   ├── options.lua
│   └── plugins
│       ├── alpha.lua
│       ├── ...
│       └── zen-mode.lua
├── nvim-pack-lock.json
└── test.js
```

Most files are self-explanatory. LSP configurations are dealt with using nvim-lspconfig, but custom
configuration needs to be put inside the lsp/ directory. LSPs should be installed using Mason or a
package manager.
