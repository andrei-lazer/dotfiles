return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup({
      keymaps = {
        ["<C-l>"] = false,
        ["<C-h>"] = false,
        ["<C-n>"] = "actions.refresh",
      },
    })

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
