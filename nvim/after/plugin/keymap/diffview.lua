local remap = require("tslsun.keymap")
local nnoremap = remap.nnoremap

nnoremap('<space>gvo', '<Cmd>DiffviewOpen<CR>')
nnoremap('<space>gvq', '<Cmd>DiffviewClose<CR>')
nnoremap('<space>gvl', '<Cmd>DiffviewFileHistory<CR>')
