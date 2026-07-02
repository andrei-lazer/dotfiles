vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-mini/mini.icons',        -- if you use standalone mini plugins
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/bullets-vim/bullets.vim'
})
require('render-markdown').setup({
    latex = { enabled = false },
    yaml = { enabled = false }
})

vim.g.bullets_nested_checkboxes = 0
