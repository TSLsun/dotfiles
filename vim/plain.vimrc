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
