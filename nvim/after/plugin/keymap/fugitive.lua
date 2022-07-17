local remap = require("tslsun.keymap")
local nnoremap = remap.nnoremap

nnoremap('<space>gb', '<Cmd>Git blame<CR>')
nnoremap('<space>gd', '<Cmd>Gvdiffsplit<CR>')

