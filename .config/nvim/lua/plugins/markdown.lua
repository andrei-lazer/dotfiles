vim.pack.add{ GH('MeanderingProgrammer/render-markdown.nvim') }
require('render-markdown').setup({
    latex = { enabled = false },
    yaml = { enabled = false }
})
