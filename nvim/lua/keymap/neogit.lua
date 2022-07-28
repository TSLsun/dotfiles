local remap = require("utils.keymap")
local cmd = remap.cmd
local nnoremap = remap.nnoremap

nnoremap { '<space>ng', cmd('Neogit') }
