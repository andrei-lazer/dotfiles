return
{
	{ 'sainnhe/everforest', },
	{ 'ellisonleao/gruvbox' },
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			vim.cmd("colorscheme gruvbox")
			require("themery").setup({
				themes = {"everforest", "gruvbox"},
				livePreview = true, -- Apply theme while picking. Default to true.
				-- add the config here
			})
		end
	}
}
