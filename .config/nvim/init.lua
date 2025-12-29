vim.g.mapleader = " "
-- source the nvim config
vim.keymap.set("n", "<leader>o", ":update<CR> :source ~/.config/nvim/init.lua<CR>")

-- convenience function since vim.pack.add needs the full url
GH = function(x)
    if x then
        return "https://github.com/" .. x
    end
end

------------------------------ PLUGINS ------------------------

require("plugins.mini")
require("plugins.oil")
require("plugins.tmux-nav")
require("plugins.zen-mode")
require("plugins.tele")
require("plugins.lightline")
require("plugins.git")
require("plugins.harpoon")
require("plugins.which-key")
require("plugins.mason")
require("plugins.treesitter")
require("plugins.fidget")
require("plugins.markdown")
require("plugins.alpha")
require("plugins.typst-preview")
require("plugins.undotree")
require("plugins.lspconfig")

require("colors.rose-pine")
-- require("colors.gruvbox")

------------------------------ END PLUGINS ------------------------

require("keymaps")
require("options")

------------------------------ LSPS ------------------------
--- All that is needed is to install the lsp (using mason or a package manager), and then calling
--- vim.lsp.enable. For custom options (beyond the configuration that comes with nvim-lspconfig),
--- those can be put in lsp/

vim.lsp.enable("pyright")
vim.lsp.enable("tinymist")
vim.lsp.enable("clangd")
vim.lsp.enable("ts_ls")
vim.lsp.enable("lua_ls")
