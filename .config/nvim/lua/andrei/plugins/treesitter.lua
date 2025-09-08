return {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',

    config = function()
      local opt = vim.opt
      opt.foldmethod = "expr"
      opt.foldexpr = "nvim_treesitter#foldexpr()"

			require "nvim-treesitter.configs".setup {
				highlight = {
					enable = true, -- false will disable the whole extension
					disable = {"latex"}, -- list of language that will be disabled
				},
			}
    end
  }
