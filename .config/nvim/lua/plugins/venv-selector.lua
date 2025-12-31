vim.pack.add{GH('linux-cultist/venv-selector.nvim')}
require("venv-selector").setup{
    auto_refresh = true,
    search_venv_managers = true,
    search_workspace = false,
}
