local vim = vim
local keymap = vim.keymap -- for conciseness

-- C-u and C-d put cursor in middle of page
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "Y", "y$") -- Y yanks to end of line

-- open new tabs (hardly used, but sometimes helpful)
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab]]--



-- Moving text in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- lsp keymaps
keymap.set("n", "gD", vim.lsp.buf.declaration)                  -- go to declaration
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action) -- see available code actions, in visual mode will apply to selection
keymap.set("n", "<leader>rn", vim.lsp.buf.rename)               -- smart rename

keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
keymap.set("n", "K", vim.lsp.buf.hover)           -- show documentation for what is under cursor
keymap.set("n", "<leader>gf", vim.lsp.buf.format) -- format the current buffer
keymap.set("n", "<leader>rs", "<cmd>lsp restart<cr>")

-- scrolling through pop up menu (pum)
vim.keymap.set("i", "<C-j>", function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
end, { expr = true })

vim.keymap.set("i", "<C-k>", function()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>"
end, { expr = true })

-- clear packages
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

------------ PLUGIN KEYBINDS ------------
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>") -- zen mode + twilight

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Find buffers" })
keymap.set("n", "<leader>ft", "<cmd>Telescope<cr>", { desc = "Start telescope" })
keymap.set("n", "<leader>th", require("telescope.builtin").colorscheme, { desc = "List colorschemes" })
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics<CR>") -- show  diagnostics for file
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")            -- show lsp definitions

-- harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end) -- open harpoon list
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)                         -- add current file to harpoon list

vim.keymap.set("n", "<M-h>", function() harpoon:list():select(1) end)                         -- go to 1st-4th selection using Alt+hjkl
vim.keymap.set("n", "<M-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-l>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- venv-selector
vim.keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>")
vim.keymap.set("n", "<leader>vc", "<cmd>VenvSelectCached<cr>")

-- toggleterm
vim.keymap.set("t", "<C-Space>", "<C-\\><C-n><cmd>ToggleTerm<cr>")
vim.keymap.set("n", "<C-Space>", "<cmd>ToggleTerm<cr>")


vim.keymap.del("n", "s")
vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, {desc = "Flash"} )
vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, {desc = "Flash Treesitter"})
vim.keymap.set("o", "r", function() require("flash").remote() end, {desc = "Remote Flash"})
vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end, {desc = "Treesitter Search"})
vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end, {desc = "Toggle Flash Search"})

--typst
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
