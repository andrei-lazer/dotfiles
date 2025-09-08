return {
	"m4xshen/autoclose.nvim",
	config = function()
		require("autoclose").setup({
			keys = {
				["'"] = { disabled_filetypes = { "text", "norg", "latex" } },
			},
		})
	end,
}
