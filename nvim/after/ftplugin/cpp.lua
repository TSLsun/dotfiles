local remap = require("utils.keymap")
local nnoremap = remap.nnoremap

vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

nnoremap { "<F7>", "<ESC> :w <CR> :!g++-12 -std=c++17 -lm -s -x c++ -D_DEBUG -O2 -o %< % && ./%< < input<CR>" }
nnoremap { "<F8>",
  "<ESC> :w <CR> :!g++-12 -std=c++17 -lm -s -x c++ -O2 -o %< % <CR> :vs|:term ./%< <CR>" }
nnoremap { "<F9>",
  "<ESC> :w <CR> :!g++-12 -std=c++17 -lm -s -x c++ -Wall -Wextra -D_DEBUG -O2 -o %< % <CR> :vs|:term ./%< <CR>" }
nnoremap { "<F10>",
  "<ESC> :w <CR> :!g++-12 -std=c++17 -lm -s -x c++ -Wall -Wextra -D_DEBUG -O2 -o %< % && ./%< < input<CR>" }
