
"*******************************
"" Vim-plug (plugin manager)
"*******************************

" Automatic installaion of vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
let g:plug_home = has("nvim") ? stdpath('data') . '/plugged' : '~/.vim' . '/plugged'
" nvim plugin folder: `~/.local/share/nvim/plugged
call plug#begin()

" Handy plugins
Plug 'preservim/nerdcommenter' " -- [count]<leader>c<space> <Plug>NERDCommenterToggle<CR>
Plug 'tpope/vim-surround' " -- ys, cs, ds, S(VISUAL mode)
Plug 'tpope/vim-repeat' " -- Support `.` for vim-surround
Plug 'psliwka/vim-smoothie' " -- Smooth scrolling
Plug 'windwp/nvim-autopairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " -- :MarkdownPreview<CR>
"Plug 'mbbill/undotree' " -- :UndoTreeShow<CR>

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'junegunn/gv.vim'
Plug 'ThePrimeagen/git-worktree.nvim'

" UI
Plug 'gruvbox-community/gruvbox'
"Plug 'luisiacc/gruvbox-baby'
"Plug 'rakr/vim-one'
"Plug 'joshdick/onedark.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
"Plug 'windwp/windline.nvim'

" LSP
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind.nvim'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" LuaSnip
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Neovim Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-context'

" Neovim Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()

lua require('nvim-autopairs').setup {}

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 200})
augroup END

" vim-plug keymaps
nnoremap <leader>pi <Cmd>PlugInstall<CR>
nnoremap <leader>pc <Cmd>PlugClean<CR>

" to try plugins
"nnoremap <leader>u :UndotreeShow<CR>

lua require('tslsun')
