local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'
  use 'preservim/nerdcommenter'  -- [count]<leader>c<space> <Plug>NERDCommenterToggle<CR>
  use 'tpope/vim-surround'       -- ys, cs, ds, S(VISUAL mode)
  use 'tpope/vim-repeat'         -- Support `.` for vim-surround
  use 'psliwka/vim-smoothie'     -- Smooth scrolling
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end,
  }
  use {                          -- :MarkdownPreview<CR>
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn["mkdp#util#install"]() end,
    ft = { 'markdown' }
  }
  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'sindrets/diffview.nvim'
  use 'junegunn/gv.vim'

  -- UI
  use 'gruvbox-community/gruvbox'
  --use 'luisiacc/gruvbox-baby'
  --use 'rakr/vim-one'
  --use 'joshdick/onedark.vim'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  --use 'windwp/windline.nvim'
  use {
    'akinsho/bufferline.nvim', tag = 'v2.*'
  }
  use 'kyazdani42/nvim-tree.lua'
  use 'liuchengxu/vista.vim'

  -- LSP
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- LuaSnip
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Neovim Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Neovim Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0'
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'ThePrimeagen/git-worktree.nvim'

  local nnoremap = require('tslsun.keymap').nnoremap
  nnoremap('<leader>pi', '<Cmd>PackerInstall<CR>')
  nnoremap('<leader>pc', '<Cmd>PackerClean<CR>')

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

