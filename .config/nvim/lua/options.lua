-- === GENERAL KEYMAPS ===
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap -- for conciseness
-- C-u and C-d put cursor in middle of page
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "Y", "y$") -- Y yanks to end of line
-- moving text in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- scrolling through pop up menu (pum)
vim.keymap.set("i", "<C-j>", function ()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
end, { expr = true }
)
vim.keymap.set("i", "<C-k>", function ()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>"
end, { expr = true }
)
-- lsp
keymap.set("n", "grf", vim.lsp.buf.format, { desc = "format current buffer" }) -- format the current buffer

-- === OPTIONS ===
require("vim._core.ui2").enable() -- new ui stuff in vim v0.12
local opt = vim.opt

opt.cursorline = true
opt.clipboard:append("unnamedplus")

opt.winborder = "rounded"

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.number = true
opt.relativenumber = true

opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand('~/.config/nvim/.undo') -- Sets directory for undo files

opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.termguicolors = true
opt.winborder = "rounded"
opt.scrolloff = 10
opt.wrap = false
opt.colorcolumn = "+1" -- column at line limit

-- === COMMANDS ===
vim.cmd('cnoreabbrev w update') -- :w only writes on change
vim.cmd('cnoreabbrev ww write') -- :ww force writes
local function pack_clean()
    local active_plugins = {}
    local unused_plugins = {}

    for _, plugin in ipairs(vim.pack.get()) do
        active_plugins[plugin.spec.name] = plugin.active
    end

    for _, plugin in ipairs(vim.pack.get()) do
        if not active_plugins[plugin.spec.name] then
            table.insert(unused_plugins, plugin.spec.name)
        end
    end

    if #unused_plugins == 0 then
        print("No unused plugins.")
        return
    end

    local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
    if choice == 1 then
        vim.pack.del(unused_plugins)
    end
end
vim.api.nvim_create_user_command("ClearPlugins", pack_clean, {})
vim.api.nvim_create_user_command("Isort", "!isort %", { desc = "Sort the current Python file's imports" })

-- === AUTOCOMMANDS ===
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function ()
        vim.highlight.on_yank()
    end
})
