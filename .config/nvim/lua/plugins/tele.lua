-- dependencies

vim.pack.add({GH("nvim-lua/plenary.nvim")})

vim.pack.add({GH("nvim-telescope/telescope-fzf-native.nvim")}, {
  hooks = {
    post_install = function(ctx)
      vim.system({ "make" }, { cwd = ctx.dir }):wait()
    end,
    post_update = function(ctx)
      vim.system({ "make" }, { cwd = ctx.dir }):wait()
    end,
  },
})

-- main package
vim.pack.add({ GH("nvim-telescope/telescope.nvim") },
{
    branch = "0.1.x",
})

-- config
local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        path_display = { "truncate " },
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                ["<C-j>"] = actions.move_selection_next, -- move to next result
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
        },
    },
    file_ignore_patterns = {"venv/"}
})

telescope.load_extension("fzf")
