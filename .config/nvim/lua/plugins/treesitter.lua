vim.pack.add{
    {
        src = GH("nvim-treesitter/nvim-treesitter"),
        version = "main"
    }
}

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'python', 'cpp', 'html', 'typst', 'javascript', 'css', 'lua' },
    callback = function() vim.treesitter.start() end,
})
