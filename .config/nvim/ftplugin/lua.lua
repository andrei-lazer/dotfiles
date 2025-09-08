vim.lsp.start({
	name = 'luals',
	cmd = {'lua-language-server'},
	filetypes = {'lua'},
	root_markers = {'.luarc.json', '.luarc.jsonc'}
})
