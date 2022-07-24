local gs = require('gitsigns')
local line = vim.fn.line
local M = {}

function M.on_attach(bufnr)
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

return M
