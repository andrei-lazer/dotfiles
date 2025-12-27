local vim = vim
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- only useful in this file - DELETE LATER
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")

gh = function(x)
	if x then
		return "https://github.com/" .. x
	end
end

------------------------------ PLUGINS ------------------------

require("plugins.oil")
require("plugins.rosepine")
require("plugins.tmux-nav")
require("plugins.zen-mode")
require("plugins.tele")
require("plugins.mini")
require("plugins.lightline")
require("plugins.git")
require("plugins.harpoon")
require("plugins.lspconfig")
require("plugins.which-key")
require("plugins.mason")
require("plugins.treesitter")

------------------------------ END PLUGINS ------------------------

require("keymaps")
require("options")

------------------------------ LSPS ------------------------

vim.lsp.enable("pyright")
vim.lsp.enable("tinymist")
vim.lsp.enable("clangd")
vim.lsp.enable("ts_ls")
vim.lsp.enable("emmylua_ls")
