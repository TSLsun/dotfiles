local gs = require('gitsigns')

local line = vim.fn.line

local function on_attach(bufnr)
  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  map('n', ']c', function()
    if vim.wo.diff then return ']c' end
    vim.schedule(gs.next_hunk)
    return '<Ignore>'
  end, { expr = true, desc = "(gitsigns) go to next_hunk" })

  map('n', '[c', function()
    if vim.wo.diff then return '[c' end
    vim.schedule(gs.prev_hunk)
    return '<Ignore>'
  end, { expr = true, desc = "(gitsigns) go to prev_hunk" })

  map('n', '<Space>hs', gs.stage_hunk, { desc = "stage_hunk" })
  map('n', '<Space>hr', gs.reset_hunk, { desc = "reset_hunk" })
  map('v', '<Space>hs',
    function() gs.stage_hunk({ line("."), line("v") }) end,
    { desc = "stage_hunk" }
  )
  map('v', '<Space>hr',
    function() gs.reset_hunk({ line("."), line("v") }) end,
    { desc = "reset_hunk" }
  )
  map('n', '<Space>hu', gs.undo_stage_hunk, { desc = "undo_stage_hunk" })
  map('n', '<Space>hS', gs.stage_buffer, { desc = "stage_buffer" })
  map('n', '<Space>hR', gs.reset_buffer, { desc = "reset_buffer" })
  map('n', '<Space>hp', gs.preview_hunk, { desc = "preview_hunk" })
  map('n', '<Space>hb',
    function() gs.blame_line { full = true } end,
    { desc = "(gitsigns) hover blame_line" }
  )
  map('n', '<Space>hd', gs.diffthis, { desc = "(gitsigns) diffthis" })
  map('n', '<Space>hD',
    function() gs.diffthis('~') end,
    { desc = "(gitsigns) diffthis('~')" }
  )

  -- Toggles
  map('n', '<Space>tb', gs.toggle_current_line_blame)
  map('n', '<Space>td', gs.toggle_deleted)
  map('n', '<Space>tw', gs.toggle_word_diff)

  map('n', '<Space>hQ',
    function() gs.setqflist('all') end,
    { desc = "(gitsigns) setqflist('all')" }
  )
  map('n', '<Space>hq', gs.setqflist, { desc = "(gitsigns) setqflist" })

  map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end

gs.setup {
  on_attach                    = on_attach,
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
