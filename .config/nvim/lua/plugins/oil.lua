vim.pack.add({ GH("stevearc/oil.nvim") })
require("oil").setup({
    keymaps = {
        ["<C-l>"] = false,
        ["<C-h>"] = false,
        ["<C-n>"] = "actions.refresh",
    },
})
