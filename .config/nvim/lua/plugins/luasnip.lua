return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")

    ls.config.setup({
      store_selection_keys = "<Tab>",
      enable_autosnippets = true,
      update_events = 'TextChanged,TextChangedI'
    })



    -- load my custom snippets from the "luasnip" folder
    require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/andrei/plugins/luasnip/"})


    ls.update_events = 'TextChanged,TextChangedI'

    vim.cmd[[
    " Use Tab to expand and jump through snippets
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
    smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
    
    " Use Shift-Tab to jump backwards through snippets
    imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    ]]
  end
}
