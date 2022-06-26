let mapleader=" "

""" IdeaVim only settings ------------------
" Join things together like comments and method chaining. Activated with shift+j
set ideajoin
" Define the mode that would be enabled during the refactoring
set idearefactormode=visual

""" Plugins (https://github.com/JetBrains/ideavim/wiki/Emulated-plugins)
Plug 'tpope/vim-surround'            " ys, cs, ds, S
Plug 'tpope/vim-commentary'          " gcc, gc + motion, v_gc
Plug 'preservim/nerdtree'
    let g:NERDTreeMapActivateNode='l'
    let g:NERDTreeMapJumpParent='h'
    nnoremap <C-n> :NERDTree <CR>
    "Esc - Back to editor, will keep the NERDTree window
    "q - Close the NERDTree window
    "t/T - Open file in new tab (T: keep cursor in NERDTree)
    "i/I - Open file in new h-split (I: keep cursor in NERDTree)
    "s/S - Open file in new v-split (S: keep cursor in NERDTree)
    "O - Recursively open the selected directory
    "x - Close dir
    "X - Close children
    "p->h - Jump to node parent
    "o->l - Open files, directories and bookmarks
    """ https://github.com/JetBrains/ideavim/wiki/NERDTree-support
Plug 'machakann/vim-highlightedyank' " show highlight when yank
"Plug 'easymotion/vim-easymotion'

""" Settings -------------------------------
set showmode
set showcmd
set number
set relativenumber
set incsearch
"set hlsearch
set nohlsearch      " Disable search highlighting
set ignorecase
set smartcase       " Override the 'ignorecase' option if the search pattern contains upper case characters
set scrolloff=3

set clipboard+=unnamed
set clipboard+=ideaput

""" Don't use Ex mode, use Q for formatting.
map Q gq

""" Some more setups
map <C-c> <Esc>
nnoremap <C-z> :action ToggleDistractionFreeMode<CR>
vnoremap < <gv
vnoremap > >gv

nnoremap \w :w<cr>
nnoremap \q :q<cr>
nnoremap \e :e ~/.ideavimrc<CR>
nnoremap \r :action IdeaVim.ReloadVimRc.reload<CR>
nnoremap \c :action Assertions2AssertJ.ConvertFile<CR>

""" Split windows
sethandler <C-j> a:vim
sethandler <C-k> a:vim
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <C-\> :action SplitVertically<CR>
nnoremap <C--> :action SplitHorizontally<CR>
nnoremap <C-=> :action Unsplit<CR>
nnoremap <C-m> :action MoveEditorToOppositeTabGroup<CR>

""" Navigate tab
nnoremap <TAB>      :action PreviousTab<CR>
nnoremap <S-TAB>    :action NextTab<CR>

""" Navigate window
nnoremap <leader>en :action EditSourceInNewWindow<CR>
nnoremap <leader>w  :action NextWindow<CR>
nnoremap <leader>W  :action PreviousWindow<CR>
nnoremap <leader>qq :action CloseContent<CR>
nnoremap <leader>qa :action CloseAllEditors<CR>

""" Fold & Unfold
nnoremap zc :action CollapseRegion<CR>
nnoremap zo :action ExpandRegion<CR>
nnoremap <leader>zc :action CollapseAllRegions<CR>
nnoremap <leader>zo :action ExpandAllRegions<CR>

""" Common usages
nnoremap <leader>c :action CommentByLineComment<CR>
nnoremap <leader>R :action Refactorings.QuickListPopupAction<CR>
nnoremap <leader>= :action ReformatCode<CR>
nnoremap <leader>o :action OptimizeImports<CR>
nnoremap <leader>/ :action ShowErrorDescription<CR>
nnoremap <leader>l :action RecentLocations<CR>
nnoremap <leader>u :action FindUsages<CR>

""" Source navigation
nnoremap [[ :action MethodUp<CR>
nnoremap ]] :action MethodDown<CR>
nnoremap gc :action GotoClass<CR>
nnoremap gi :action GotoImplementation<CR>
nnoremap gd :action GotToDeclaration<CR>
nnoremap gp :action GotToSuperMethod<CR>
nnoremap gT :action GotoTest<CR>
nnoremap gu :action ShowUsages<CR>
nnoremap gb :action Back<CR>
nnoremap gf :action Forward<CR>
nnoremap gr :action RecentFiles<CR>
nnoremap ge :action GotoNextError<CR>
nnoremap gE :action GotoPreviousError<CR>

""" Running and Debugging
nnoremap \f :action ChooseRunConfiguration<CR>
nnoremap <leader>b :action ToggleLineBreakpoint<CR>
nnoremap <leader>rr :action ContextRun<CR>
nnoremap <leader>rd :action ContextDebug<CR>
nnoremap <leader>rc :action RunClass<CR>
nnoremap <leader>rf :action RerunFailedTests<CR>

""" ToolWindow
nnoremap <leader>pw :action ActivateProblemsViewToolWindow<CR>
nnoremap <leader>lw :action ActivateSonarLintToolWindow<CR>
nnoremap <leader>fw :action ActivateFindToolWindow<CR>
nnoremap <leader>sw :action ActivateStructureToolWindow<CR>
nnoremap <leader>rw :action ActivateRunToolWindow<CR>
nnoremap <leader>dw :action ActivateDebugToolWindow<CR>
nnoremap <leader>tw :action ActivateTerminalToolWindow<CR>
nnoremap <leader>bw :action ActivateBuildToolWindow<CR>
nnoremap <leader>mw :action ActivateMavenToolWindow<CR>
nnoremap <leader>Dw :action ActivateDatabaseToolWindow<CR>

nnoremap <leader>M :action MaximizeToolWindow<CR>
nnoremap <leader>hw :action HideActiveWindow<CR>
nnoremap <leader>ha :action HideAllWindows<CR>
nnoremap <C-p> :action JumpToLastWindow<CR>

""" Terminal
nnoremap <leader>nt :action Terminal.OpenInTerminal<CR>
