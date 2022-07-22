local remap = require("tslsun.keymap")
local nnoremap = remap.nnoremap
local vnoremap = remap.vnoremap
local inoremap = remap.inoremap
local xnoremap = remap.xnoremap
local nmap = remap.nmap

nnoremap("<leader>w", "<Cmd>write<CR>")
nnoremap("<leader>q", "<Cmd>quit<CR>")
vim.cmd('set pastetoggle=<leader>p')
nnoremap("<leader><CR>", "<Cmd>source ~/.config/nvim/init.lua<CR>")

-- clear search highlight
nnoremap("<space>/", "<Cmd>noh<CR>")
nnoremap("<leader><space>/", "<Cmd>let @/=\"\"<CR>")

nnoremap("<leader>pv", "<Cmd>Explore<CR>")
--nnoremap("<leader>u", ":UndotreeShow<CR>")

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
vnoremap("<", "<gv")
vnoremap(">", ">gv")

--nnoremap("<F3>", "<Cmd>set list!<CR>")

-- copy to system clipboard
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

-- replace with yanked text, and put the deletes to black hole register
xnoremap("<leader>p", "\"_dP")
nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

inoremap("<C-c>", "<Esc>")
nnoremap("Q", "<nop>")
--nnoremap("<C-f>", "<Cmd>silent !tmux neww tmux-sessionizer<CR>")

nmap("<S-Tab>", "<Cmd>tabprev<CR>")
nmap("<Tab>", "<Cmd>tabnext<CR>")
nnoremap("<leader>1", "<Cmd>1tabn<CR>")
nnoremap("<leader>2", "<Cmd>2tabn<CR>")
nnoremap("<leader>3", "<Cmd>3tabn<CR>")
nnoremap("<leader>4", "<Cmd>4tabn<CR>")
nnoremap("<leader>5", "<Cmd>5tabn<CR>")
nnoremap("<leader>6", "<Cmd>6tabn<CR>")
nnoremap("<leader>7", "<Cmd>7tabn<CR>")
nnoremap("<leader>8", "<Cmd>8tabn<CR>")
nnoremap("<leader>9", "<Cmd>9tabn<CR>")
--nnoremap("<C-k>", "<Cmd>cnext<CR>zz")
--nnoremap("<C-j>", "<Cmd>cprev<CR>zz")
--nnoremap("<leader>k", "<Cmd>lnext<CR>zz")
--nnoremap("<leader>j", "<Cmd>lprev<CR>zz")

nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
nnoremap("<leader>x", "<Cmd>!chmod +x %<CR>", { silent = true })

nnoremap("<leader>+", ":vertical resize +5<CR>")
nnoremap("<leader>-", ":vertical resize -5<CR>")

