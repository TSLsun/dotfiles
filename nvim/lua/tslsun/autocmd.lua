vim.cmd[[

  " Quit Nvim if we have only one window, and its filetype match our pattern.
  function! s:quit_current_win() abort
    let l:quit_filetypes = ['qf', 'vista', 'NvimTree']

    let l:should_quit = v:true

    let l:tabwins = nvim_tabpage_list_wins(0)
    for w in l:tabwins
      let l:buf = nvim_win_get_buf(w)
      let l:bf = getbufvar(l:buf, '&filetype')

      if index(l:quit_filetypes, l:bf) == -1
        let l:should_quit = v:false
      endif
    endfor

    if l:should_quit
      qall
    endif
  endfunction

  augroup auto_close_win
    autocmd!
    autocmd BufEnter * call s:quit_current_win()
  augroup END

  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 200})
  augroup END
]]
