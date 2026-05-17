local remap = require("utils.keymap")
local cmd = remap.cmd
local nnoremap = remap.nnoremap

nnoremap { "<C-n>", cmd("NvimTreeToggle") }
