-- return {
--   'rose-pine/neovim', 
--   name = 'rose-pine',
--   config = function ()
--     vim.cmd('colorscheme rose-pine')
--   end
--   }


-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup({
--       flavour = "frappe",
--     })
--     vim.cmd("colorscheme catppuccin")
--   end
-- }

return {
  'sainnhe/everforest',
  name="everforest",
  priority=1000,
  config = function()
    vim.cmd("colorscheme everforest")
  end
}
