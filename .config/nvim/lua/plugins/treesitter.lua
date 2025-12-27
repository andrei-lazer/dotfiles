vim.pack.add{ gh("nvim-treesitter/nvim-treesitter") }
require('nvim-treesitter').install({
    "python", "javascript", "lua", "c", "cpp", "html", "css"
})
