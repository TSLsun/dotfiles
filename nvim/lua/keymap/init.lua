local remap = require("utils.keymap")
local cmd = remap.cmd
local opts = remap.new_opts
local silent = remap.silent
local nmap = remap.nmap
local nnoremap = remap.nnoremap
local vnoremap = remap.vnoremap
local inoremap = remap.inoremap
local xnoremap = remap.xnoremap

require('keymap.diffview')
require('keymap.fugitive')
require('keymap.lsp')
require('keymap.neogit')
require('keymap.nvim-tmux-navigation')
require('keymap.nvim-tree')
require('keymap.telescope')

nnoremap { '<leader>w', cmd('write') }
nnoremap { '<leader>q', cmd('quit') }
nnoremap { '<leader><CR>', cmd('source ~/.config/nvim/init.lua') }

-- clear search highlighter
nnoremap { '<space>/', cmd('noh') }
nnoremap { '<leader><space>/', cmd('let @/=""') }

-- format code by LSP
nnoremap {
  '<space>=',
  function()
    vim.lsp.buf.format({ async = false })
    print("Done formatted...")
  end,
  opts("LSP formatting")
}

vnoremap({
  { "J", ":m '>+1<CR>gv=gv" },
  { "K", ":m '<-2<CR>gv=gv" },
  { "<", "<gv" },
  { ">", ">gv" }
})

nnoremap({
  { "Y", "yg$" },
  { "n", "nzzzv" },
  { "N", "Nzzzv" },
  { "J", "mzJ`z" },
})
--nnoremap { "<F3>", cmd("set list!") }

---- copy to system clipboard
nnoremap { "<leader>y", "\"+y" }
vnoremap { "<leader>y", "\"+y" }
nmap { "<leader>Y", "\"+Y" }

-- replace with yanked text, and put the deletes to black hole register
xnoremap { "<leader>p", "\"_dP" }
nnoremap { "<leader>d", "\"_d" }
vnoremap { "<leader>d", "\"_d" }

inoremap { "<C-c>", "<Esc>" }
nnoremap { "Q", "<nop>" }
nnoremap { "<space>", "<nop>" } -- use space as a second leader

-- tab navigation
nmap { "<S-Tab>", cmd("tabprev") }
nmap { "<Tab>", cmd("tabnext") }
nnoremap({
  { "<leader>1", cmd("1tabn") },
  { "<leader>2", cmd("2tabn") },
  { "<leader>3", cmd("3tabn") },
  { "<leader>4", cmd("4tabn") },
  { "<leader>5", cmd("5tabn") },
  { "<leader>6", cmd("6tabn") },
  { "<leader>7", cmd("7tabn") },
  { "<leader>8", cmd("8tabn") },
  { "<leader>9", cmd("9tabn") },
})

-- pane navigation
-- set plugin keymaps to support navigation between vim & tmux panes
--nnoremap({
  --{ "<C-h>", "<C-w><C-h>" },
  --{ "<C-j>", "<C-w><C-j>" },
  --{ "<C-k>", "<C-w><C-k>" },
  --{ "<C-l>", "<C-w><C-l>" },
--})

-- pane resizing
nnoremap { "<leader><Left>", cmd("vertical resize -5") }
nnoremap { "<leader><Right>", cmd("vertical resize +5") }
nnoremap { "<leader><UP>", cmd("resize +2") }
nnoremap { "<leader><Down>", cmd("resize -2") }

-- screen navigation
nnoremap { "<space><Left>", "^" }
nnoremap { "<space><Right>", "$" }
nnoremap { "<space><UP>", "H" }
nnoremap { "<space><Down>", "L" }

nnoremap { "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>" }
nnoremap { "<leader>x", cmd("!chmod +x %"), opts(silent) }
--nnoremap { "<C-f>", cmd("silent !tmux neww tmux-sessionizer") }
