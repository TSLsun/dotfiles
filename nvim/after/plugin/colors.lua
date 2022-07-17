-- Colors setup
vim.opt.termguicolors = true -- Enables 24-bit RGB color support.

function ColorMyPencils ()
  vim.opt.background = "dark"
  vim.g.gruvbox_contrast_dark = "hard"
  vim.g.gruvbox_invert_selection = "0"
  vim.cmd("colorscheme gruvbox")
  vim.cmd([[
    "highlight ColorColumn ctermbg=0 guibg=lightgrey
     highlight SignColumn guibg=none
     highlight CursorLineNR ctermbg=0 guibg=none
     highlight Normal guibg=none
    "]])
end

ColorMyPencils()

-- status line
require('lualine').setup {
  options = {
    theme = 'gruvbox',
  },
}

-- devicons
require('nvim-web-devicons').setup { }

vim.keymap.set('n', '<leader>cmp', '<Cmd>lua ColorMyPencils()<CR>', { noremap = true })
