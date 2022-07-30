local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  print('Installing packer close and reopen Neovim...')
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return require('packer').startup(function(use)
  -- Put all plugins here
  use 'wbthomason/packer.nvim'
  -- Utilities
  use 'preservim/nerdcommenter' -- [count]<leader>c<space> <Plug>NERDCommenterToggle<CR>
  use 'tpope/vim-surround' -- ys, cs, ds, S(VISUAL mode)
  use 'tpope/vim-repeat' -- Support `.` for vim-surround
  use 'psliwka/vim-smoothie' -- Smooth scrolling
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end,
  }
  use { 'alexghergh/nvim-tmux-navigation',
    config = function()
      require 'nvim-tmux-navigation'.setup {
        disable_when_zoomed = true -- defaults to false
      }
    end
  }
  use { -- :MarkdownPreview<CR>
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = { 'markdown' }
  }
  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'sindrets/diffview.nvim'
  use 'TimUntersberger/neogit'
  use 'rhysd/git-messenger.vim'
  use 'junegunn/gv.vim'

  -- UI
  use 'gruvbox-community/gruvbox'
  use 'luisiacc/gruvbox-baby'
  use 'folke/tokyonight.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use { 'akinsho/bufferline.nvim', tag = 'v2.*' }
  use 'kyazdani42/nvim-tree.lua'

  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim'
  --use 'simrat39/symbols-outline.nvim'
  use {
    'glepnir/lspsaga.nvim',
    config = function() require('lspsaga').init_lsp_saga() end,
  }
  use {
    "folke/trouble.nvim",
    config = function() require("trouble").setup {} end,
  }

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- LuaSnip
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Neovim Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Neovim Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'ThePrimeagen/git-worktree.nvim'

  local remap = require('utils.keymap')
  local nnoremap = remap.map('n', remap.noremap)
  nnoremap { '<leader>pi', '<Cmd>PackerInstall<CR>' }
  nnoremap { '<leader>pc', '<Cmd>PackerClean<CR>' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
