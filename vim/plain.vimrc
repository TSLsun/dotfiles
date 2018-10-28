""" vundle - plugins settings
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on     " required

" Put your stuff after this line
syntax on    	        " 語法上色

set mouse=a
set encoding=utf-8
set number 	            " 顯示行號
set ruler 	            " 顯示右下角詳細資訊
set cindent 	        " 自動縮排 
set cursorline 	        " 底線 目前游標位置
set expandtab  	        " 將文件中的tab轉成space顯示
set tabstop=4 	        " tab換成幾個空格
set shiftwidth=4        " 自動縮排時的空格數量

inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i
inoremap {<CR> {<CR>}<Esc>ko
inoremap {{ {}<ESC>i

""" COLOR settings
set background=dark
"colorscheme Tomorrow-Night-Bright 
"colorscheme kolor 
"colorscheme molokai
"colorscheme solarized
