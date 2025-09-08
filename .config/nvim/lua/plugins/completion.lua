return
{
	{ 'hrsh7th/cmp-nvim-lsp' },
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(), -- close completion window
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
				}),
				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" }, -- text within current buffer
					{ name = "path" }, -- file system paths
				}),
			})
		end
	},
}
