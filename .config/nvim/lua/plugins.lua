GH = function (x)
    if x then
        return "https://github.com/" .. x
    end
end

local keymap = vim.keymap -- for conciseness

-- colorschemes
vim.pack.add { "https://github.com/andreypopp/vim-colors-plain" }
vim.pack.add { "https://github.com/stefanvanburen/rams.vim" }
vim.pack.add { "https://github.com/widatama/vim-phoenix" }
vim.pack.add { "https://github.com/n1ghtmare/noirblaze-vim" }
vim.pack.add { "https://github.com/jaredgorski/Mies.vim" }
vim.pack.add { GH'shaunsingh/nord.nvim' }
vim.pack.add { GH'alligator/accent.vim' }
vim.g.accent_colour = "green"
vim.g.accent_no_bg = 1
vim.cmd "colorscheme accent"

-- lualine
vim.pack.add{ GH'nvim-lualine/lualine.nvim' }
require("lualine").setup({
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
})


--- oil
vim.pack.add({ GH("stevearc/oil.nvim") })
require("oil").setup({
    keymaps = {
        ["<C-l>"] = false,
        ["<C-h>"] = false,
        ["<C-n>"] = "actions.refresh"
    }
})
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--- parinfer (for lisp parentheses)
vim.pack.add { GH("gpanders/nvim-parinfer") }

--- undotree (bundled with nvim, not loaded by default)
vim.cmd.packadd { "nvim.undotree" }
keymap.set("n", "<leader>u", ":Undotree<cr>")

--- whichkey
vim.pack.add({ GH('folke/which-key.nvim') })
require("which-key").setup()

--- zen mode
vim.pack.add { GH "folke/zen-mode.nvim" }
require("zen-mode").setup({
    plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
            enabled = true,
            ruler = false,   -- disables the ruler text in the cmd line area
            showcmd = false, -- disables the command in the last line of the screen
            -- you may turn on/off statusline in zen mode by setting 'laststatus' 
            -- statusline will be shown only if 'laststatus' == 3
            laststatus = 0   -- turn off the statusline in zen mode
        }
    }
})
keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>") -- zen mode + twilight

--- fugitive (lightweight git addon)
vim.pack.add { GH "tpope/vim-fugitive" }

--- git signs
vim.pack.add { GH "lewis6991/gitsigns.nvim" }
require("gitsigns").setup {
    current_line_blame_opts = {
        delay = 200
    }
}
keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>") -- shows blame on each line

--- harpoon
vim.pack.add { GH "nvim-lua/plenary.nvim" }
vim.pack.add({
    {
        src = GH('ThePrimeagen/harpoon'),
        version = "harpoon2"
    }
})
local harpoon = require("harpoon")
harpoon:setup()
keymap.set("n", "<leader>h", function ()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end) -- open harpoon list
keymap.set("n", "<leader>a", function ()
    harpoon:list():add()
end) -- add current file to harpoon list
keymap.set("n", "<M-h>", function ()
    harpoon:list():select(1)
end) -- go to 1st-4th selection using Alt+hjkl
keymap.set("n", "<M-j>", function ()
    harpoon:list():select(2)
end)
keymap.set("n", "<M-k>", function ()
    harpoon:list():select(3)
end)
keymap.set("n", "<M-l>", function ()
    harpoon:list():select(4)
end)

--- vim-tmux navigation
vim.pack.add { GH "christoomey/vim-tmux-navigator" }

--- venv selector
vim.pack.add { GH('linux-cultist/venv-selector.nvim') }
require("venv-selector").setup { auto_refresh = true, search_venv_managers = true, search_workspace = false }
keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>")
keymap.set("n", "<leader>vc", "<cmd>VenvSelectCached<cr>")

--- vimtex
vim.g.vimtex_mappings_enabled = 1
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_latexmk = { out_dir = "build" }
vim.g.vimtex_complete_enabled = true
vim.g.vimtex_quickfix_ignore_filters = { "Overfull \\\\hbox" }
vim.pack.add { "https://github.com/lervag/vimtex" }

--- mini stuff
vim.pack.add { GH "nvim-mini/mini.nvim" }

require("mini.notify").setup({
    lsp_progress = { enable = false }
})
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.icons").setup()
require("mini.splitjoin").setup({
    mappings = { toggle = "<leader>m" }
})
require("mini.snippets").setup({
    snippets = {
        require("mini.snippets").gen_loader.from_lang()
    },
    mappings = {
        expand = '<C-s>'
    },
    expand = {
        insert = function (snippet)
            return MiniSnippets.default_insert(snippet, { empty_tabstop = "", empty_tabstop_final = "" })
        end
    }
})
require("mini.snippets").start_lsp_server({ match = false })
-- fuzzy finder!
local minipick = require("mini.pick")
minipick.setup {
    mappings = {
        move_down = '<C-j>',
        move_up   = '<C-k>',
        send_all_to_quickfix = {
            char = '<C-q>',
            func = function()
                local matches = minipick.get_picker_matches()
                minipick.default_choose_marked(matches.all)
                return true -- close the picker
            end,
        },
    }

}
local miniextra = require("mini.extra")
miniextra.setup()
keymap.set("n", "<leader>ff", function ()
    minipick.builtin.files()
end, { desc = "File fuzzy finding" }
)
keymap.set("n", "<leader>fs", function ()
    minipick.builtin.grep_live()
end, { desc = "String fuzzy finding" }
)
keymap.set("n", "<leader>fh", function ()
    minipick.builtin.help()
end, { desc = "Help fuzzy finding" }
)
keymap.set("n", "<leader>fc", function ()
    miniextra.pickers.commands()
end, { desc = "Fuzzy find neovim commands" }
)
keymap.set("n", "<leader>fk", function ()
    miniextra.pickers.keymaps()
end, { desc = "Fuzzy find neovim keymaps" }
)

--- treesitter
vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter' }

--- markdown
vim.pack.add({ 'https://github.com/MeanderingProgrammer/render-markdown.nvim' })

--- opencode
vim.pack.add({ { src = "https://github.com/nickjvandyke/opencode.nvim", version = vim.version.range("*") } })
vim.keymap.set({ "n", "x" }, "<C-x>x", function ()
    require("opencode").ask("@this: ")
end, { desc = "Ask OpenCode about current highlight" }
)
vim.keymap.set({ "n", "x" }, "<C-x>a", function ()
    require("opencode").ask()
end, { desc = "Ask OpenCode" }
)

--- snacks
vim.pack.add { GH "folke/snacks.nvim" }
require("snacks").setup({
    input = { enable = true },
    -- allows viewing images by opening them in a buffer. need terminal compatible w the kitty graphics protocol
    image = { enable = true }
})

--- typst
vim.pack.add{ GH("chomosuke/typst-preview.nvim") }
require("typst-preview").setup{
    open_cmd = "sh -c 'flatpak run org.mozilla.firefox \"$1\" >/dev/null 2>&1 &' sh %s",
}


-- === LSP & COMPLETIONS ===
vim.pack.add { GH("mason-org/mason.nvim") } -- for easy lsp installs run :Mason
require("mason").setup()
vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' } -- default lsp configs. run :h lspconfig-all to see them.
vim.lsp.enable({ "pyright", "clangd", "emmylua_ls", "tinymist", "html_lsp" })
vim.lsp.config('emmylua_ls', {
    settings = { emmylua = { diagnostics = { globals = { 'vim' } } } }
})

vim.lsp.config("tinymist", {
    on_attach = function(client, bufnr)
        vim.keymap.set("n", "<leader>tp", function()
            client:exec_cmd({
                title = "pin",
                command = "tinymist.pinMain",
                arguments = { vim.api.nvim_buf_get_name(0) },
            }, { bufnr = bufnr })
        end, { desc = "[T]inymist [P]in", noremap = true })

        vim.keymap.set("n", "<leader>tu", function()
            client:exec_cmd({
                title = "unpin",
                command = "tinymist.pinMain",
                arguments = { vim.v.null },
            }, { bufnr = bufnr })
        end, { desc = "[T]inymist [U]npin", noremap = true })
    end,
})

vim.pack.add({
    GH("Saghen/blink.lib"),
    GH("Saghen/blink.cmp")
})

local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
    keymap = {
        preset = "default",
        ['<C-j>'] = { 'select_next' },
        ['<C-k>'] = { 'select_prev' },
        ['<C-s>'] = { 'select_and_accept' }
    },
    completion = {
        documentation = {
            auto_show = false
        }
    },
    sources = {
        default = { "lsp", "path", "buffer" },
        per_filetype = {
            tex = { inherit_defaults = true, "omni" },
            bib = { inherit_defaults = true, "omni" },
            opencode_ask = { "lsp", "buffer" }
        }
    }
})
