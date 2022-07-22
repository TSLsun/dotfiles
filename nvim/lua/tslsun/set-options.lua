local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.guicursor = ""
opt.cursorline = true
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true -- Use spaces instead of tab characters.

opt.smartindent = true
opt.showmode = false
opt.ruler = false -- Disable showing line and column numbers in command line.
opt.cmdheight = 1 -- Give more space for displaying messages
opt.list = true -- Show characters in 'listchars' in place of certain special characters.
opt.listchars = {
    tab = "»·",
    nbsp = "␣",
    extends = "…", -- extends = ">"
    precedes = "…", -- precedes = "<"
    trail = "·", -- trail = "~"
    --eol = "¬",
}
opt.signcolumn = "yes"
--opt.colorcolumn = "100"

opt.belloff = "all" -- NO Bells
opt.mouse = "nv"

opt.swapfile = false
opt.backup = false
--opt.undofile = true
--opt.undodir = "~/.local/share/nvim/site/undodir"
opt.hidden = false -- set true for hidden buffer
opt.splitright = true -- prefer vsplitting to the right
opt.splitbelow = true -- prefer splitting below
opt.updatetime = 1000 -- Make updates happen faster (default 4000ms)
opt.scrolloff = 7 -- padding between cursor and top/bottom of window

opt.completeopt = { -- Options for insert mode completion
  'menu', -- Use the pop-up menu
  'menuone', -- Use the pop-up menu also when there is only one match
  'noselect', -- Do not select a match in the menu
}

