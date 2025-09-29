return {
    'brianhuster/live-preview.nvim',
    dependencies = {
        -- You can choose one of the following pickers
        'nvim-telescope/telescope.nvim',
    },
	config = function()
		vim.keymap.set("n", "<leader>md", "<cmd>LivePreview start<cr>", {desc="Markdown Live Preview"})
	end
}
