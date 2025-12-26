-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- General Keymaps -------------------

-- C-u and C-d put cursor in middle of page
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
keymap.set("n", "Y", "y$")

-- fncrement/decrement numbers
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab]]--

-- terminal stuff
keymap.set("t", "", "<C-\\><C-n>")
keymap.set("n", "<leader>tp", "<cmd>new term://zsh<CR>ipython3<CR><C-k>")

-- Moving text in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- lsp keymaps
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")            -- show lsp definitions
keymap.set("n", "gD", vim.lsp.buf.declaration)                         -- go to declaration
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)        -- see available code actions, in visual mode will apply to selection
keymap.set("n", "<leader>rn", vim.lsp.buf.rename)                      -- smart rename
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>") -- show  diagnostics for file
keymap.set("n", "<leader>d", vim.diagnostic.open_float)                -- show diagnostics for line
keymap.set("n", "[d", vim.diagnostic.goto_prev)                        -- jump to previous diagnostic in buffer
keymap.set("n", "]d", vim.diagnostic.goto_next)                        -- jump to next diagnostic in buffer
keymap.set("n", "K", vim.lsp.buf.hover)                                -- show documentation for what is under cursor
keymap.set("n", "<leader>rs", ":LspRestart<CR>")                       -- mapping to restart lsp if necessary
keymap.set("n", "<leader>gf", vim.lsp.buf.format)                      -- format the current buffer

-- python
keymap.set("n", "<leader>is", "<cmd>!isort %<cr>")
