vim.g.git_messenger_floating_win_opts = { border = 'single' }
vim.g.git_messenger_popup_content_margins = false

vim.cmd [[
" Normal color in popup window
hi link gitmessengerPopupNormal CursorLine
" Header such as 'Commit:', 'Author:'
hi link gitmessengerHeader Statement
" Commit hash at 'Commit:' header
hi link gitmessengerHash Special
" History number at 'History:' header
hi link gitmessengerHistory Title
]]

-- default keymap:
-- nmap <leader>gm <Plug>(git-messenger)
