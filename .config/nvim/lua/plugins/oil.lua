vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup({
    keymaps = {
        ["<C-l>"] = false,
        ["<C-h>"] = false,
        ["<C-n>"] = "actions.refresh",
    },
})
