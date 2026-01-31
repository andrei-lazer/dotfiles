vim.pack.add({GH("nvim-lualine/lualine.nvim")})
require('lualine').setup(
	require("ashen.plugins.lualine").lualine_opts
)


--
-- vim.cmd([[
-- let g:lightline = {
--     \ 'colorscheme': 'powerlineish',
--     \ }
--     ]])
