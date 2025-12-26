return {
    'norcalli/nvim-colorizer.lua',
    priority = -1,
    config = function()
        require 'colorizer'.setup {
            'css';
            'javascript';
        }
    end
}
