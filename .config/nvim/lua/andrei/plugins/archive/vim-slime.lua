return {
  'jpalardy/vim-slime',
  config = function()
    vim.g.slime_target = "kitty"
    vim.g.slime_bracketed_paste = 1
    vim.cmd([[
    xmap <leader>ps <Plug>SlimeRegionSend
    nmap <leader>ps <Plug>SlimeMotionSend
    nmap <leader>pl <Plug>SlimeLineSend
    ]])
  end
}


