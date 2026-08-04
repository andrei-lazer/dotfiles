-- === Colorscheme ===
vim.pack.add{"https://github.com/andreypopp/vim-colors-plain"}
vim.pack.add{"https://github.com/stefanvanburen/rams.vim"}
vim.pack.add{"https://github.com/widatama/vim-phoenix"}
vim.pack.add{"https://github.com/n1ghtmare/noirblaze-vim"}
vim.pack.add{"https://github.com/jaredgorski/Mies.vim"}
vim.cmd"colorscheme noirblaze"

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
vim.keymap.set("i", "<C-j>", function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
end, { expr = true })
vim.keymap.set("i", "<C-k>", function()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>"
end, { expr = true })
-- -- lsp
-- keymap.set("n", "gD", vim.lsp.buf.declaration)                  -- go to declaration
-- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action) -- see available code actions, in visual mode will apply to selection
-- keymap.set("n", "<leader>rn", vim.lsp.buf.rename)               -- smart rename
-- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
-- keymap.set("n", "K", vim.lsp.buf.hover)           -- show documentation for what is under cursor
-- keymap.set("n", "<leader>gf", vim.lsp.buf.format) -- format the current buffer
-- keymap.set("n", "<leader>rs", "<cmd>lsp restart<cr>")

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
vim.api.nvim_create_user_command("Isort", "!isort %", {desc = "Sort the current Python file's imports"})

-- === PLUGINS AND THEIR KEYMAPS ===
GH = function(x)
    if x then
        return "https://github.com/" .. x
    end
end
--- oil
vim.pack.add({ GH("stevearc/oil.nvim") })
require("oil").setup({
    keymaps = {
        ["<C-l>"] = false,
        ["<C-h>"] = false,
        ["<C-n>"] = "actions.refresh",
    },
})
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
--- parinfer (for lisp parentheses)
vim.pack.add{GH("gpanders/nvim-parinfer")}
--- undotree (bundled with nvim, not loaded by default)
vim.cmd.packadd{"nvim.undotree"}
keymap.set("n", "<leader>u", ":Undotree<cr>")
--- whichkey
vim.pack.add({GH('folke/which-key.nvim')})
require("which-key").setup()
--- zen mode
vim.pack.add{GH"folke/zen-mode.nvim"}
require("zen-mode").setup({
    plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
            enabled = true,
            ruler = false, -- disables the ruler text in the cmd line area
            showcmd = false, -- disables the command in the last line of the screen
            -- you may turn on/off statusline in zen mode by setting 'laststatus' 
            -- statusline will be shown only if 'laststatus' == 3
            laststatus = 0, -- turn off the statusline in zen mode
        }
    }
})
keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>") -- zen mode + twilight
--- fidget (nice ui for notifications)
vim.pack.add{ GH("j-hui/fidget.nvim") }
require("fidget").setup()
--- fugitive (lightweight git addon)
vim.pack.add{GH"tpope/vim-fugitive"}
--- git signs 
vim.pack.add{GH"lewis6991/gitsigns.nvim"}
require("gitsigns").setup{
	current_line_blame_opts = {
        delay = 200,
	},
}
keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>") -- shows blame on each line
--- harpoon
vim.pack.add{GH"nvim-lua/plenary.nvim"}
vim.pack.add({
    {
        src = GH('ThePrimeagen/harpoon'),
        version = "harpoon2" 
    }
})
local harpoon = require("harpoon")
harpoon:setup()
keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end) -- open harpoon list
keymap.set("n", "<leader>a", function() harpoon:list():add() end)                         -- add current file to harpoon list
keymap.set("n", "<M-h>", function() harpoon:list():select(1) end)                         -- go to 1st-4th selection using Alt+hjkl
keymap.set("n", "<M-j>", function() harpoon:list():select(2) end)
keymap.set("n", "<M-k>", function() harpoon:list():select(3) end)
keymap.set("n", "<M-l>", function() harpoon:list():select(4) end)
--- vim-tmux navigation
vim.pack.add{GH"christoomey/vim-tmux-navigator"}
--- venv selector
vim.pack.add{GH('linux-cultist/venv-selector.nvim')}
require("venv-selector").setup{
    auto_refresh = true,
    search_venv_managers = true,
    search_workspace = false,
}
keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>")
keymap.set("n", "<leader>vc", "<cmd>VenvSelectCached<cr>")
--- mini stuff
vim.pack.add{
    GH"nvim-mini/mini.nvim",
}

require("mini.ai").setup()
require("mini.surround").setup()
require("mini.icons").setup()
require("mini.splitjoin").setup({
    mappings = { toggle = "<leader>m" }
})
local minipick = require("mini.pick")
minipick.setup{
    mappings = {
        move_down  = '<C-j>',
        move_up    = '<C-k>',
    }
}
local miniextra = require("mini.extra")
miniextra.setup()

keymap.set("n", "<leader>ff", function () minipick.builtin.files() end, {desc = "File fuzzy finding"})
keymap.set("n", "<leader>fs", function () minipick.builtin.grep_live() end, {desc = "String fuzzy finding"})
keymap.set("n", "<leader>fh", function () minipick.builtin.help() end, {desc = "Help fuzzy finding"})
keymap.set("n", "<leader>fc", function () miniextra.pickers.commands() end, {desc = "Fuzzy find neovim commands"})
keymap.set("n", "<leader>fk", function () miniextra.pickers.keymaps() end, {desc = "Fuzzy find neovim keymaps"})

-- === LSP & COMPLETIONS ===
vim.pack.add({
    GH("Saghen/blink.lib"),
    GH("Saghen/blink.cmp"),
})

local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
    keymap = {
        preset = "default",
        ['<C-j>'] = { 'select_next' },
        ['<C-k>'] = { 'select_prev' },
        ['<C-s>'] = { 'select_and_accept' },
    },
    completion = {
        documentation = {
            auto_show = false,
        },
    },
    sources = {
        default = { "path", "buffer" },
        per_filetype = {
            tex = { inherit_defaults = true, "omni" },
            bib = { inherit_defaults = true, "omni" },
        },
    },
})
