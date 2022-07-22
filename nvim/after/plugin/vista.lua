vim.cmd[[
  let g:vista_executive_for = {
    \ 'java': 'nvim_lsp',
    \ 'json': 'nvim_lsp',
    \ 'lua': 'nvim_lsp',
    \ 'vim': 'nvim_lsp',
    \ }

  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
]]

local nnoremap = require('tslsun.keymap').nnoremap

nnoremap("<space>t", "<Cmd>Vista!!<CR>")
