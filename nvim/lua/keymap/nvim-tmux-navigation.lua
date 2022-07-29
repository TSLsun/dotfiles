local remap = require("utils.keymap")
local cmd = remap.cmd
local nnoremap = remap.nnoremap

nnoremap { "<C-h>", cmd("lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()") }
nnoremap { "<C-j>", cmd("lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()") }
nnoremap { "<C-k>", cmd("lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()") }
nnoremap { "<C-l>", cmd("lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()") }
