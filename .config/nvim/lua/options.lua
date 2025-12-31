local opt = vim.opt

-- virtual text and nice signs
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO]  = "",
            [vim.diagnostic.severity.HINT]  = "",
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        },
        numhl = {
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
    },
})

opt.cursorline = true -- highlight the current cursor line

opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.swapfile = false

opt.winborder = "rounded"

opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = false -- copy indent from current line when starting new one

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.config/nvim/.undo') -- Sets directory for undo files

opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.termguicolors = true

opt.colorcolumn = "100"

-- auto wrap text
vim.cmd("autocmd bufreadpre *.tex setlocal textwidth=100")
vim.cmd("autocmd bufreadpre *.norg setlocal textwidth=100")
vim.cmd("autocmd bufreadpre *.md setlocal textwidth=100")
vim.cmd("autocmd bufreadpre *.typ setlocal textwidth=100")

-- autocmds
vim.api.nvim_create_autocmd("FileType",{
    pattern = "markdown,typst",
    command = "setlocal spell wrap"
})
