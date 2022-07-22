-- Colors setup
vim.opt.termguicolors = true -- Enables 24-bit RGB color support.

function ColorMyPencils()
  vim.opt.background = "dark"
  vim.g.gruvbox_contrast_dark = "hard"
  vim.g.gruvbox_invert_selection = "0"
  vim.cmd("colorscheme gruvbox")

  local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
  end

  hl("SignColumn", { bg = "none", })
  hl("ColorColumn", { ctermbg = 0, bg = "lightgrey" })
  hl("CursorLineNR", { ctermbg = 0, bg = "none" })
  hl("Normal", { bg = "none" })
  --hl("LineNr", { fg = "#5eacd3" })
  --hl("netrwDir", { fg = "#5eacd3" })
end

ColorMyPencils()

-- devicons
require('nvim-web-devicons').setup {}

-- status line
require('lualine').setup {
  options = {
    theme = 'gruvbox',
  },
}

-- buffer(tab) line
require('bufferline').setup {
  options = {
    mode = "tabs", -- "buffers" | "tabs" (only show tabpages)
    numbers = "ordinal", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string
  }
}

vim.keymap.set('n', '<leader>cmp', '<Cmd>lua ColorMyPencils()<CR>', { noremap = true })
