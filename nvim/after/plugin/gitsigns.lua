require('gitsigns').setup {
  on_attach                    = require('keymap.gitsigns').on_attach,
  signs                        = {
    add          = {
      hl = 'GitSignsAdd', text = '│',
      numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn',
      show_count = false
    },
    change       = {
      hl = 'GitSignsChange', text = '│',
      numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn',
      show_count = false
    },
    delete       = {
      hl = 'GitSignsDelete', text = '_',
      numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn',
      show_count = true
    },
    topdelete    = {
      hl = 'GitSignsDelete', text = '‾',
      numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn',
      show_count = true
    },
    changedelete = {
      hl = 'GitSignsChange', text = '~',
      numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn',
      show_count = true
    },
  },
  count_chars                  = {
    '⒈', '⒉', '⒊', '⒋', '⒌', '⒍', '⒎', '⒏', '⒐',
    '⒑', '⒒', '⒓', '⒔', '⒕', '⒖', '⒗', '⒘', '⒙', '⒚', '⒛',
  },
  signcolumn                   = true, --  Toggle with `:Gitsigns toggle_signs`
  numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                 = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked          = true,
  current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil, -- Use default
  max_file_length              = 40000,
  preview_config               = {
    -- Options passed to nvim_open_win
    border = 'rounded',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm                         = {
    enable = false
  },
  _extmark_signs               = true,
  _threaded_diff               = true,
}
