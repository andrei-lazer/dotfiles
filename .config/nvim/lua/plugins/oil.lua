return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup({
      keymaps = {
        ["<C-l>"] = false,
        ["<C-h>"] = false,
        ["yp"] = require("oil.actions").copy_entry_path,
      },
    })

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
