local vim = vim
local keymap = vim.keymap -- for conciseness

-- C-u and C-d put cursor in middle of page
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "Y", "y$") -- Y yanks to end of line

-- open new tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab]]--

-- Moving text in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- lsp keymaps
keymap.set("n", "gD", vim.lsp.buf.declaration)                         -- go to declaration
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)        -- see available code actions, in visual mode will apply to selection
keymap.set("n", "<leader>rn", vim.lsp.buf.rename)                      -- smart rename
keymap.set('n', '<leader>d', function()
    -- toggles the virtual line diagnostics
    local new_config
    if vim.diagnostic.config().virtual_lines == false then
        new_config = { current_line = true }
    else
        new_config = false
    end
    vim.diagnostic.config { virtual_lines = new_config }
end, { desc = 'Toggle diagnostic virtual lines and virtual text' })

keymap.set("n", "[d", vim.diagnostic.goto_prev)                        -- jump to previous diagnostic in buffer
keymap.set("n", "]d", vim.diagnostic.goto_next)                        -- jump to next diagnostic in buffer
keymap.set("n", "K", vim.lsp.buf.hover)                                -- show documentation for what is under cursor
keymap.set("n", "<leader>rs", ":LspRestart<CR>")                       -- mapping to restart lsp if necessary
keymap.set("n", "<leader>gf", vim.lsp.buf.format)                      -- format the current buffer

-- scrolling through pop up menu (pum)
vim.keymap.set("i", "<C-j>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
end, { expr = true })

vim.keymap.set("i", "<C-k>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>"
end, { expr = true })

------------ PLUGIN KEYBINDS ------------
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>") -- zen mode + twilight

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Find buffers" })
keymap.set("n", "<leader>ft", "<cmd>Telescope<cr>", {desc = "Start telescope"})
keymap.set("n", "<leader>th", require("telescope.builtin").colorscheme, { desc = "List colorschemes" })
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>") -- show  diagnostics for file
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")            -- show lsp definitions

-- harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end) -- open harpoon list
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end) -- add current file to harpoon list

vim.keymap.set("n", "<M-h>", function() harpoon:list():select(1) end) -- go to 1st-4th selection using Alt+hjkl
vim.keymap.set("n", "<M-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-l>", function() harpoon:list():select(4) end)

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

