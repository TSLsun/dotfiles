require("nvim-tree").setup()

local nnoremap = require("tslsun.keymap").nnoremap

nnoremap("<C-n>", "<Cmd>NvimTreeToggle<CR>")
