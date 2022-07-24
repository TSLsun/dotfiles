--
-- UI setup
--

-- color scheme
vim.opt.termguicolors = true -- Enables 24-bit RGB color support.
vim.opt.background = "dark"

function ColorMyPencils()
  vim.g.gruvbox_contrast_dark = "hard"
  vim.g.gruvbox_invert_selection = "0"

  vim.g.gruvbox_baby_function_style = "NONE"
  vim.g.gruvbox_baby_keyword_style = "italic"
  -- Each highlight group must follow the structure:
  -- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
  -- See also :h highlight-guifg
  vim.g.gruvbox_baby_highlights = {
    Normal = { fg = "#123123", bg = "NONE", style = "underline" }
  }
  -- Enable telescope theme
  vim.g.gruvbox_baby_telescope_theme = 0
  -- Enable transparent mode
  vim.g.gruvbox_baby_transparent_mode = 1

  vim.g.tokyonight_style = "storm" -- storm | night | day
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

  --vim.cmd [[colorscheme gruvbox]]
  vim.cmd [[colorscheme gruvbox-baby]]
  --vim.cmd [[colorscheme tokyonight]]

  local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
  end

  hl("SignColumn", { bg = "none", })
  hl("ColorColumn", { ctermbg = 0, bg = "#555555" })
  hl("CursorLineNR", { ctermbg = 0, bg = "none" })
  hl("Normal", { bg = "none" })
  hl("LineNr", { fg = "#5eacd3" })
  hl("netrwDir", { fg = "#5eacd3" })
  hl("QuickFixLine", { ctermfg = "none", bg = "#303030" })
end

ColorMyPencils()

-- devicons
require('nvim-web-devicons').setup {}

-- status line
require('lualine').setup {
  options = {
    --theme = 'auto',
    theme = 'gruvbox',
    --theme = 'tokyonight',
  },
}

-- buffer(tab) line
require('bufferline').setup {
  options = {
    mode = "tabs", -- "buffers" | "tabs" (only show tabpages)
    numbers = "ordinal", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string
  }
}

-- file browser
require('nvim-tree').setup {}

--vim.keymap.set('n', '<leader>cmp', '<Cmd>lua ColorMyPencils()<CR>', { noremap = true })
