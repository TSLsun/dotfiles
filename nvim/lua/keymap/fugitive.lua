local remap = require("utils.keymap")
local cmd = remap.cmd
local nnoremap = remap.nnoremap

nnoremap({
  { '<space>gb', cmd('Git blame') },
  { '<space>gd', cmd('Gvdiffsplit') },
})
