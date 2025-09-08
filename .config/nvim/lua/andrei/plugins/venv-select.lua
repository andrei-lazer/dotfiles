return {
  'linux-cultist/venv-selector.nvim',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  opts = {
    -- Your options go here
    -- name = "venv",
    auto_refresh = true,
    search_venv_managers = true,
    search_workspace = false,
    name = {
      'mt-modules-env',
      'base',
    },
    anaconda_base_path = '/home/andrei/miniconda3/bin/',
    anaconda_envs_path = '/home/andrei/miniconda3/envs/'
  },
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>vs', '<cmd>VenvSelect<cr>' },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
  },
}
