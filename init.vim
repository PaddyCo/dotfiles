" Leader key settings
let mapleader = " "
set timeoutlen=500 

" Clear search highlight on Enter
nmap <return> :noh<CR>

" Set yank default target to system clipboard
set clipboard+=unnamedplus

" Set default tabs
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Plugins
call plug#begin(stdpath('data') . 'plugged')

    " fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1.0 } }
    
    " Automatic tab detection
    Plug 'tpope/vim-sleuth'
    let g:sleuth_automatic = 1
    Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Keybindings
" - Find files in current project
nmap <leader><leader> :GFiles?<CR>
