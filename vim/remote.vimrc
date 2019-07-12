""" vundle - plugins settings
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""" Plugins:
"Plugin 'davidhalter/jedi-vim' 
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter' 
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/fzf'
Plugin 'Yggdroot/indentLine'
"Plugin 'terryma/vim-multiple-cursors'

" nerdtree settings"
map <C-n> :NERDTreeToggle<CR> 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeNodeDelimiter = "\t"

" fzf settings"
map <C-p> :FZF<CR>

filetype plugin indent on     " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

syntax on    	        " 語法上色

set mouse=a
set encoding=utf-8

set number 	            " 顯示行號
if version >= 704
    set relativenumber      " 顯示相對行號
endif

set ruler 	            " 顯示右下角詳細資訊
set cindent 	        " 自動縮排 
set cursorline 	        " 底線 目前游標位置
set expandtab  	        " 將文件中的tab轉成space顯示
set backspace=2         " Insert mode 才能刪東西
set tabstop=4 	        " tab換成幾個空格
set shiftwidth=4        " 自動縮排時的空格數量

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" :set paste toggle
set pastetoggle=<leader>p

inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i
inoremap {<CR> {<CR>}<Esc>ko
inoremap {{ {}<ESC>i

"" COLOR settings
set background=dark
colorscheme Tomorrow-Night-Bright 

"" powerline settings
set rtp+=~/.local/lib/python3.6/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
