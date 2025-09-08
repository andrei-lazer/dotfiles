return {
	"jamespeapen/Nvim-R",
	config = function()
		-- vim.g.R_external_term = "tmux split-window -hp 40"
		vim.g.R_notmuxconf = 1
		vim.g.R_assign_map = "@"
		vim.g.Rout_more_colors = 1
		vim.g.rout_follow_colorscheme = 1

		-- keymaps
		vim.g.R_user_maps_only = 1 -- disables default key maps

		vim.keymap.set("n", "<Leader>rf", "<Plug>RStart")
		vim.keymap.set("n", "<C-Space>", "<Plug>RDSendLine")
		vim.keymap.set("n", "<Leader>ri", "<CMD>call SendLineToRAndInsertOutput()<CR>")
		vim.keymap.set("n", "<Leader>ro", "<CMD>call RObjBrowser()<CR>")
	end,
}
