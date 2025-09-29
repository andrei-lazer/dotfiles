return
{
	{ 'sainnhe/everforest' },
	{ 'ellisonleao/gruvbox.nvim' },
	{ 'folke/tokyonight.nvim' },
	{ 'rose-pine/neovim' },
	{ "EdenEast/nightfox.nvim" },
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			vim.cmd("colorscheme gruvbox")
			require("themery").setup({
				themes = vim.fn.getcompletion("", "color"),
				livePreview = true, -- Apply theme while picking. Default to true.
				vim.keymap.set("n", "<leader>th", "<cmd>Themery<cr>")
				-- add the config here
			})
		end
	}
}
