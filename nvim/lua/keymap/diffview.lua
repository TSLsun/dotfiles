local remap = require("utils.keymap")
local cmd = remap.cmd
local nnoremap = remap.nnoremap

nnoremap({
  { '<space>gvo', cmd('DiffviewOpen') },
  { '<space>gvq', cmd('DiffviewClose') },
  { '<space>gvl', cmd('DiffviewFileHistory') },
})
